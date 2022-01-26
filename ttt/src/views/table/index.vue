<template>
    <div class="home-container">
        <div style="margin: 10px 0">
            <el-input v-model="search" placeholder="请输入关键字" style="width: 20%"></el-input>
            <el-button type='primary' @click="load()"><i class="el-icon-search"></i></el-button>
            <el-button type='primary' @click="dialogVisible = true">+</el-button>
            <el-button type='primary' @click="testadd(tableData)">添加TEST</el-button>
            <el-button type='primary'>+</el-button>
        </div>
          <el-table
            :data="tableData"
            border
            style="width: 100%"
            :default-sort = "{prop: 'id', order: 'descending'}"
          >
            <el-table-column
            type="index"
            label="ID"
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
            prop="admin_role_ids"
            label="角色组">  
            </el-table-column>          
            <el-table-column
            prop="email"
            label="邮箱">
            </el-table-column>
            <el-table-column
            prop="phone"
            label="手机">
            </el-table-column>
            <el-table-column
            prop="enable"
            label="是否启用">
            </el-table-column>
            <el-table-column width="180" align="center" label="操作">
                <template slot-scope="scope">
                    <el-button
                    size="mini"
                    @click="handleEdit(scope.row)">编辑</el-button>
                    <el-button
                    size="mini"
                    type="danger"
                    @click="handleDelete(scope.$index,scope.row)">删除</el-button>
                </template>
            </el-table-column>
          </el-table>
        <div class="block" style="margin: 10px 0">
          <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="currentPage"
            :pager-count="5"
            :page-sizes="[5, 10, 15, 20]"
            :page-size="pageSize"
            layout="total, sizes, prev, pager, next, jumper"
            :total="total">
          </el-pagination>
        </div>
        <el-dialog
          title="提示"
          :visible.sync="dialogVisible"
          width="30%"
          :before-close="handleClose">
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
            <el-form-item label="是否有效" prop="enable">
              <el-switch v-model="ruleForm.enable"></el-switch>
            </el-form-item>

            <el-form-item>
              <el-button type="primary" @click="submitForm('ruleForm')">立即创建</el-button>
              <el-button @click="resetForm('ruleForm')">重置</el-button>
            </el-form-item>
          </el-form>
        </el-dialog>
    </div>
</template>

<script>
import request from "@/request";
export default {
    name: 'home',
    data() {

      return {
        ruleForm: {
          account: '',
          password: '',
          email: '',
          phone: '',
          enable: false
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
        dialogVisible: false,//点击按钮弹出对话框，默认隐藏
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
      testadd(tableData){
        let rep=0;
        for(let item of tableData){
          if(item.id == this.search){
            rep=1;
            break;
          }
        }
        if(rep == 0){
          tableData.push({id:this.search});
        }
      },
      delete(index,account){
        this.tableData.splice(index,1);
        request.post("/api_S/admin/delete",{account: account}).then(res =>{
        });
      },
      cal_total(){
        request.get("/api_S/admin/cal_list").then(res=>{
          this.total = res.data.length;
        });
      },
      load(){
        request.get("/api_S/admin/list?pageNum="+this.currentPage+"&pageSize="+this.pageSize+"&search="+this.search).then(res=>{//等价于.then(function(res){console.log(res.data)})
        this.tableData = res.data;
        console.log(this.tableData.length);
        });
      },
      save(){
        if(this.ruleForm.enable===true){
          this.ruleForm.enable=1;
        }else{
          this.ruleForm.enable=0;
        }
        request.post("/api_S/admin/regist",this.ruleForm).then(res =>{
          console.log(res);
        });
      },
      handleEdit(row) {
        this.dialogVisible = true;
        this.ruleForm = row;
      },
      handleDelete(index,row) {
        this.delete(index,row.account);
      },
      handleSizeChange(val) {
        this.pageSize=val;
          this.load();
      },
      handleCurrentChange(val) {
          this.currentPage = val;
          this.load();
      },
      handleClose(done) {
      this.$confirm('确认关闭？')
        .then(_ => {
          done();
        })
        .catch(_ => {});
      },

      submitForm(formName) {
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
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    }
}
</script>

<style scoped>
.home-container {
    padding: 20px;
    padding-top: 5px;
}
</style>