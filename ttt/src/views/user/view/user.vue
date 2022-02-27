<template>
  <div class="home-container">
    <div class = "btnRow" ><el-button type='primary' @click="createShow">添加用户</el-button></div>
    <div class="card">
      <div class="card-body">
        <el-form :inline="true" class="demo-form-inline">
          <el-form-item  label="查找:">
            <el-input v-model="search" placeholder="请输入关键字"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type='primary' @click="load"><i class="el-icon-search"></i></el-button>
          </el-form-item>
        </el-form>
        <el-table
          :fit = "true"
          stripe
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
          label="密码">
            <template>
              <span>******</span>
            </template>
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
        <el-pagination
          class="pagination"
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
    <el-dialog
      title="新建用户"
      :visible.sync="createVis"
      width="30%" >

      <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
          <el-form-item label="账户" prop="account">
              <el-input v-model="ruleForm.account"></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="password">
          <el-input  v-model="ruleForm.password"></el-input>
          </el-form-item>
          <el-form-item label="电子邮件" prop="email">
          <el-input  v-model="ruleForm.email"></el-input>
          </el-form-item>
          <el-form-item label="手机号码" prop="phone">
          <el-input  v-model="ruleForm.phone"></el-input>
          </el-form-item>

          <el-form-item>
          <el-button type="primary" @click="submitCreate('ruleForm')">立即创建</el-button>
          <el-button @click="resetCreate('ruleForm')">重置</el-button>
          </el-form-item>
      </el-form>
    </el-dialog>

  </div>
</template>

<script>

export default {
  name: 'home',
  data() {
    return {
      createVis: false,
      editVis: false,
      ruleForm: {
        account: '',
        password: '',
        email: '',
        phone: '',
      },
      rules: {
          account: [
          { required: true, message: '请输入用户名', trigger: 'blur' },
          { min: 3, max: 5, message: '长度在 3 到 5 个字符', trigger: 'blur' }
          ],
          password:[
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 6, message: '长度大于 6 个字符', trigger: 'blur'}
          ],
          email:[
          { required: true, trigger: 'blur' },
          ],
          phone:[
          { required: true,  trigger: 'blur' },
          ],
      },

      currentPage: 1,//当前页面默认1
      search:'',//search输入框中的值
      pageSize:10,
      total:0,
      tableData: []

    }
  },
  created(){
    this.load();
    this.cal_total();
  },
  methods:{
    submitCreate(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          alert('submit!');
          this.save();
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    resetCreate(formName) {
      this.$refs[formName].resetFields();
    },
    createShow () {
      this.createVis = true
    },



    //增删改查
    delete(index,account){
      this.tableData.splice(index,1);
      this.$request.post("/api_S/admin/delete",{account: account}).then(res =>{this.$message("删除成功");});
    },
    cal_total(){
      this.$request.get("/api_S/admin/cal_list").then(res=>{
        this.total = res.data.length;
      });
    },
    load(){
      this.$request.get("/api_S/admin/list?pageNum="+this.currentPage+"&pageSize="+this.pageSize+"&search="+this.search).then(res=>{//等价于.then(function(res){console.log(res.data)})
        this.tableData=[];
        for(let i of res.data){
          let roleList = [];
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
      this.$request.post("/api_S/admin/regist",this.ruleForm).then(res =>{
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
      return this.$setCss.tableHeadCell
    },
    mytableCell(){
      return this.$setCss.tableCell
    },
  },
}
</script>

<style scoped>

</style>