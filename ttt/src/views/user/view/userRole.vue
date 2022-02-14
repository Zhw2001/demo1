<template>
  <div class="home-container">
      <div class = "btnRow" ><el-button type="danger" @click="show">批量删除角色</el-button></div>
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
              <el-button size='mini' type='primary' icon="el-icon-edit"></el-button>
              <el-button size='mini' type='danger' icon="el-icon-delete"></el-button>
            </div>
            </el-table-column>

          </el-table>
        </div>
      </div>
  </div>
</template>

<script>
export default {
  data () {
    return{
      roleList: []
    }
  },
  created(){
    this.load()
  },
  methods: {
    load(){
      this.$request.get('/api_S/role/list').then( res => {
      let data = res.data
      this.roleList = data
      })
    },
    mytable(){
      return this.$setCss.tableHeadCell
    },
    mytableCell(){
      return this.$setCss.tableCell
    },
  }
}
</script>

<style scoped>

</style>