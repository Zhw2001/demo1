<template>
  <div class="home-container">
    <div class = "btnRow" ><el-button type='primary' @click="createShow">添加用户</el-button></div>
    <div class="card">
      <div class="card-body">
        <el-form :inline="true" @submit.native.prevent>
          <el-form-item  label="查找:">
            <el-input v-model="search" placeholder="请输入关键字" @keyup.enter.native="load"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type='primary' @click="load"><i class="el-icon-search"></i></el-button>
          </el-form-item>
        </el-form>
        <div class="myELTable">
        <el-table
          stripe
          :header-cell-style = "mytable"
          :cell-style = "mytableCell"
          :data="tableData"
          :default-sort = "{prop: 'uid', order: 'ascending'}"
          @select="Select"
          @select-all = "SelectAll">

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
              <el-button @click="showRowEdit(scope.row)" icon="el-icon-view" circle></el-button>
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

          <el-table-column
            label="操作">
            <template slot-scope="scope">
              <span style="display: none">
                <el-button size='mini' type='primary' icon="el-icon-edit" @click = "show(scope.row)" ></el-button>
              </span>
              <span>
                <el-button size='mini' type='danger' icon="el-icon-delete" @click= "delUserConfirm(scope.row)"></el-button>
              </span>
            </template>
            </el-table-column>

        </el-table>
        </div>
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
    <el-dialog title="分配角色" :visible.sync="roleVis" width="70%">
      <el-form>
        <el-form-item>
          <div
            style="display:flex;flex-direction:row;flex-wrap: nowrap;justify-content:flex-start;"
          >
            <span
              style="font-size:0.8vw;flex:0 1 auto;margin:0vw 0.5vw 0vw 1vw;"
              >角色:</span
            >
            <el-select
              style="flex:0 1 auto;"
              v-model="selected_role"
               multiple
               collapse-tags
              placeholder="请选择角色"
            >
              <el-option
                v-for="(role, i) in roleOption"
                :key="i"
                :label="role.role_name"
                :value="role.role_id"
              >
              </el-option>
            </el-select>
           
            <div style="flex 1 0 auto;margin-left:1vw;">
              <el-button
                type="primary"
                size="medium"
                icon="el-icon-plus"
                @click="AddConfirm()"
              ></el-button>
            </div>
            
          </div>
        </el-form-item>
        <el-form-item>
          <el-table
            stripe
            :header-cell-style="mytable"
            :cell-style="mytableCell"
            :data="roleList"
          >
            <el-table-column prop="role_id" label="角色编号"> </el-table-column>

            <el-table-column prop="role_name" label="角色名称"> </el-table-column>

            <el-table-column  label="操作">
              <template slot-scope="scope">
                <span>
                  <el-button
                    size="mini"
                    type="danger"
                    icon="el-icon-delete"
                    @click="DelConfirm(scope.row)"
                  ></el-button>
                </span>
              </template>
            </el-table-column>
          </el-table>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="roleVis = false">确定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>

export default {
  name: 'home',
  data() {
    return {
      roleVis: false,
      createVis: false,
      editVis: false,
      selected_uid: [],
      selected_role: '',
      roleList: [], //当前选中用户的角色列表
      roleOption: [], //所有角色作为选项
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
    this.$request.get("/api_S/role/list").then(res => {
      this.roleOption = res.data
    });
  },
  methods:{
    // 设置角色
    showRowEdit(v){
      this.selected_role = []
      this.selected_uid = v.uid
      this.roleVis = true
      this.roleList = v.adminRoleList
    },
    DelConfirm(v){
      this.$confirm("确定删除该角色吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
      .then(() => {
        let index = this.roleList.indexOf(v);
        this.roleList.splice(index, 1);
        let data = {}
        data.subject_id = this.selected_uid
        data.delete = []
        data.delete.push(v.role_id)
        this.$request.post("/api_S/admin/set_role", data).then(res => {
          this.$message({
            type: "info",
            message: res.msg
          });
        });
      })
      .catch(() => {
        this.$message({
          type: "info",
          message: "已取消"
        });
      });
    },
    AddConfirm(){
      this.$confirm("确定添加该角色吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
      .then(() => {
        let data = {}
        data.subject_id = this.selected_uid
        data.insert = this.selected_role
        console.log(data)
        this.$request.post("/api_S/admin/set_role", data).then(res => {
          this.$message({
            type: "info",
            message: res.msg
          });
          this.load()
          for( let k = 0; k < this.selected_role.length; k++){
            for(let i = 0; i < this.roleOption.length; i++){
              if(this.roleOption[i].role_id === this.selected_role[k])
              this.roleList.push(this.roleOption[i])
            }
          }
          console.log(this.roleList)
        });
      })
      .catch(() => {
        this.$message({
          type: "info",
          message: "已取消"
        });
      });
    },

    submitCreate(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.saveConfirm()
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
      this.$request.get("/api_S/admin/all").then(res=>{
        this.total = res.data.length;
      });
    },
    load(){
      this.$request.get("/api_S/admin/list?pageNum="+this.currentPage+"&pageSize="+this.pageSize+"&search="+this.search).then(res=>{//等价于.then(function(res){console.log(res.data)})
        this.tableData=res.data
        console.log(this.tableData);
      });
    },
    save(){
      this.$request.post("/api_S/admin/regist",this.ruleForm).then(res =>{
        console.log(res);
        this.createVis = false;
        this.load()
      });
    },
    saveConfirm(){
      this.$confirm("确定添加改用户吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
      .then(() => {
        this.save()
      })
      .catch(() => {
        this.$message({
          type: "info",
          message: "已取消"
        });
      });
    },

    delete(v){
      this.$request.post("/api_S/admin/delete",v).then(res =>{
        this.load()
      });
    },
    delUserConfirm(v){
      this.$confirm("确定删除改用户吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
      .then(() => {
        this.delete(v)
      })
      .catch(() => {
        this.$message({
          type: "info",
          message: "已取消"
        });
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