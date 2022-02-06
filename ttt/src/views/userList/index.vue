<template>
    <div class="home-container">
      <div class="card">
        <div class="card-body">
          <div style="display:flex;">
            <el-form :inline="true" class="demo-form-inline">
              <el-form-item  label="查找:">
                <el-input v-model="search" placeholder="请输入关键字"></el-input>
              </el-form-item>
              <el-form-item>
                <el-button type='primary' @click="load"><i class="el-icon-search"></i></el-button>
              </el-form-item>
              <el-form-item style="margin-left: 747px;">
                <el-button type='primary' @click="show"><i class="el-icon-plus"></i></el-button>
              </el-form-item>
              <el-form-item>
                <el-button type='primary' ><i class="el-icon-edit"></i></el-button>
              </el-form-item>
            </el-form>
          </div>
          <el-table
            :fit = "true"
            :header-cell-style = "mytable"
            :cell-style = "mytableCell"
            :data="tableData"
            :default-sort = "{prop: 'uid', order: 'ascending'}"
            @select="Select"
            @select-all = "SelectAll">

            <el-table-column
              type="selection"
            >
            </el-table-column>

            <el-table-column
            label="ID"
            prop="uid"
            sortable>
            </el-table-column>

            <el-table-column
            prop="account"
            label="账户">
            </el-table-column>

            <el-table-column
            prop="nickname"
            label="昵称">
            </el-table-column>

            <el-table-column
            label="角色">  
              <template slot-scope="scope">
                <el-tag v-if="scope.row.adminRoleList[0]" >{{scope.row.adminRoleList[0]}}</el-tag>
                <el-tag v-if="scope.row.adminRoleList[1]">{{scope.row.adminRoleList[1]}}</el-tag>
                <el-tag v-if="scope.row.adminRoleList[2]">{{scope.row.adminRoleList[2]}}</el-tag>
            </template>
            </el-table-column>      

            <el-table-column
            prop="email"
            label="邮箱">
            </el-table-column>

            <el-table-column
            prop="phone"
            label="手机">
            </el-table-column>

          </el-table>
          <div  style="margin: 10px 0">
            <el-pagination
              @size-change="SizeChange"
              @current-change="CurrentChange"
              :current-page="currentPage"
              :pager-count="5"
              :page-sizes="[5, 10, 15, 20]"
              :page-size="pageSize"
              layout="total, sizes, prev, pager, next, jumper"
              :total="total">
            </el-pagination>
          </div>
        </div>
      </div>

      <create-table :visible = 'CreateVisible'  @close = "outclose($event)"></create-table>
    </div>
</template>

<script>
import request from "@/request";
import creatTable from "./component/createTable"
export default {
    name: 'home',
    data() {

      return {
        CreateVisible: false,
        currentPage: 1,//当前页面默认1
        search:'',//search输入框中的值
        pageSize:10,
        total:0,
        tableData: [],
      }
    },
    created(){
      this.load();
      this.cal_total();
    },
    methods:{
      //创建用户按钮
      show(){
        this.CreateVisible = true;
      },
      outclose(visible){
        this.CreateVisible = visible;
      },


      //增删改查
      delete(index,account){
        this.tableData.splice(index,1);
        request.post("/api_S/admin/delete",{account: account}).then(res =>{this.$message("删除成功");});
      },
      cal_total(){
        request.get("/api_S/admin/cal_list").then(res=>{
          this.total = res.data.length;
        });
      },
      load(){
        var roleList = new Array();
        request.get("/api_S/admin/list?pageNum="+this.currentPage+"&pageSize="+this.pageSize+"&search="+this.search).then(res=>{//等价于.then(function(res){console.log(res.data)})
          this.tableData=[];
          for(let i of res.data){
            roleList = [];
            for(let j of i.adminRoleList){
              roleList.push(j.role_name);
            }
            i.adminRoleList = roleList;
            this.tableData.push(i);
          }
          console.log(this.tableData);
        });
      },
      save(){
        request.post("/api_S/admin/regist",this.ruleForm).then(res =>{
          console.log(res);
        });
      },




      //数据行选择方法
      Select(value) {
        console.log(value);
      },
      //全选方法
      SelectAll(value){
        console.log(value);
      },



      //分页所用方法
      SizeChange(val) {
        this.pageSize=val;
        this.load();
      },
      CurrentChange(val) {
        this.currentPage = val;
        this.load();
      },

      //表格样式设置
      mytable(){
        return 'background-color:#f1f3fa; color:rgba(0, 0, 0, 0.85);font-weight: 500;text-align:center;'
      },
      mytableCell(){
        return 'text-align:center;'
      },
    },
    components: {
      'create-table':creatTable,
    },
}
</script>

<style scoped>

</style>