<template>
  <div class="home-container">
      <div class = "btnRow" ><el-button type="danger">批量删除角色</el-button></div>
      <div class="card">
        <div class="card-body">
          <div class="myELTable">
            <el-table
            :fit = "true"
            stripe
            :header-cell-style = "mytable"
            :cell-style = "mytableCell"
            :data="roleList"
            :default-sort = "{prop: 'role_id', order: 'ascending'}">

            <el-table-column
              type="selection"
            >
            </el-table-column>

            <el-table-column
            label="序号"
            prop="role_id"
            sortable>
            </el-table-column>

            <el-table-column
            prop="role_name"
            label="角色名">
            </el-table-column>

            <el-table-column
            prop="role_description"
            label="角色介绍">
            </el-table-column>    

            <el-table-column
            label="操作">
            <template slot-scope="scope">
              <span>
                <el-button size='mini' type='primary' icon="el-icon-edit" @click = "show(scope.row)" ></el-button>
              </span>
              <span>
                <el-button size='mini' type='danger' icon="el-icon-delete"></el-button>
              </span>
            </template>
            </el-table-column>

            </el-table>
          </div>
        </div>
      </div>
      <el-dialog
      title="分配权限"
      :visible.sync="vis"
      width="30%">
        <el-tree ref="AuthTree" default-expand-all node-key="id" :data="mydata" :props="defaultProps" show-checkbox @check-change="handleCheckChange" check-strictly >
          <span class="custom-tree-node" slot-scope="{ node }">
              <span>{{ node.label }}</span>
          </span>
        </el-tree>
        <div style="margin-top:20px; text-align:center;">
          <el-button size="mini" type="primary" @click="editAuth()">确定</el-button>
          <el-button size="mini" type="message" @click="close">取消</el-button>
        </div>
      </el-dialog>
  </div>
</template>

<script>
export default {
  data () {
    return{
      vis: false,
      roleList: [],
      mydata: [],
      defaultProps: {
          id:'id',
          children: 'children',
          label: 'label'
      },
      selectedAuth: [],
      existedAuth: [],
      selectedRoleID: ''
    }
  },
  created(){
    this.load()
    this.loadTree()
  },
  methods: {
    authConcat(existed,selected){
      let deleteList = []
      let insertList = []
      let map = []
      for(let i of selected){ //被选中的加一
        if(!map[i.id]){map[i.id] = 0}
        map[i.id] = map[i.id] + 1
      }
      for (let i of existed){ //已存在的减一
        if(!map[i]){map[i] = 0}
        map[i] = map[i] - 1
      }
      for(let i = 0; i < map.length; i++){
        if(map[i] == -1){deleteList.push(i)}
        if(map[i] == 1){insertList.push(i)}
      }
      let result = {}
      result.insert = insertList
      result.delete = deleteList
      result.subject_id = this.selectedRoleID
      return result
    },
    editAuth(){
      let updateList = this.authConcat(this.existedAuth ,this.selectedAuth)
      console.log(updateList)
      this.$request.post("/api_S/role/update",updateList).then( res => {location.reload()})
    },
    show(row){
      this.vis = true
      this.selectedRoleID = row.role_id
      this.loadDefault(row.role_name)
    },
    close(){
      this.vis = false
    },
    load(){
      this.$request.get('/api_S/role/list').then( res => {
      let data = res.data
      this.roleList = data
      })
    },
    handleCheckChange(data, checked) {
      if (!checked) { 
        this.remove(data)
        return
        }
      this.selectedAuth = this.selectedAuth.concat(data)
    },
    remove(v){
      for(let i = 0; i < this.selectedAuth.length; i++ ){
        if (v.id == this.selectedAuth[i].id) {
          this.selectedAuth.splice( i, 1 )
          return
        }
      }
    },

    mytable(){
      return this.$setCss.tableHeadCell
    },
    mytableCell(){
      return this.$setCss.tableCell
    },

    loadDefault(roleName){
      let Checkedkeys = []
      this.$request.get("/api_S/role/authlist?rolename=" + roleName ).then(res=>{
        let yourAuthList = res.data.adminAuthList
        for (let i = 0; i < yourAuthList.length; i++){
          if (yourAuthList[i].authority_parent_id){ Checkedkeys.push(yourAuthList[i].authority_id) }
        }
        this.existedAuth = Checkedkeys
        console.log(Checkedkeys)
        this.$refs.AuthTree.setCheckedKeys(Checkedkeys)
      })
    },

    loadTree(){
      this.$request.get("/api_S/auth/list").then(res=>{
          let data = res.data
          for(let i of data){
              this.cook(i);
          }
      })
    },
    hasParent(data){
      if(data.authority_parent_id == '' || data.authority_parent_id == null){
          return false;
      }
      return true;
    },
    cook(data){
      if(this.hasParent(data)){
          let parent = this.mydata.find(function(x){return x.label == data.authority_parent_name});
          parent.children.push({
            id: data.authority_id, 
            label: data.authority_name,
            url: data.authority_url,
            children:[]
          });
      }
      else{
          this.mydata.push({id:data.authority_id,label:data.authority_name,children:[]});
      }
    }

  },
}
</script>

<style lang="less" scoped>
/deep/ .el-tree > .el-tree-node > .el-tree-node__content .el-checkbox {
  display: none;
}
</style>