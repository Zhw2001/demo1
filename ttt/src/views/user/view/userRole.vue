<template>
  <div class="home-container">
      <div class = "btnRow" ><el-button type="danger">批量删除角色</el-button></div>
      <div class="card">
        <div class="card-body">
            <el-table
            :fit = "true"
            stripe
            :header-cell-style = "mytable"
            :cell-style = "mytableCell"
            :data="roleList"
            :default-sort = "{prop: 'role_id', order: 'ascending'}"
            @select="Select"
            @select-all = "SelectAll">

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
            <div>
              <span>
                <el-button size='mini' type='primary' icon="el-icon-edit" @click = "show" ></el-button>
              </span>
              <span>
                <el-button size='mini' type='danger' icon="el-icon-delete"></el-button>
              </span>
            </div>
            </el-table-column>

          </el-table>
        </div>
      </div>
      <el-dialog
      title="分配权限"
      :visible.sync="vis"
      width="30%">
        <el-tree :data="mydata" :props="defaultProps" :expand-on-click-node="false" show-checkbox @check-change="handleCheckChange" check-strictly >
          <span class="custom-tree-node" slot-scope="{ node }">
              <span>{{ node.label }}</span>
          </span>
        </el-tree>
        <div style="margin-top:20px; text-align:center;">
          <el-button size="mini" type="primary">确定</el-button>
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
      selectedAuth: []
    }
  },
  created(){
    this.load()
    this.loadTree()
  },
  methods: {
    show(){
      this.vis = true
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
      console.log(this.selectedAuth)
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


    loadTree(){
      this.$request.get("/api_S/auth/list").then(res=>{
          var data = res.data;
          console.log(data);
          for(let i of data){
              this.cook(i);
          }
          console.log(this.mydata);
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
          console.log(parent);
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

  }
}
</script>

<style lang="less" scoped>
/deep/ .el-tree > .el-tree-node > .el-tree-node__content .el-checkbox {
  display: none;
}
</style>