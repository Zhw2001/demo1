<template>
  <div class="home-container">
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
            prop="nickname"
            label="昵称">
            </el-table-column>

            <el-table-column
            label="操作">
            <template slot-scope="scope">
              <span>
                <el-button size='mini' type='primary' icon="el-icon-edit" @click = "show(scope.row)" ></el-button>
              </span>
            </template>
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
    title="分配课程"
    :visible.sync="vis"
    width="70%" 
    >
    <el-form>
        <el-form-item>
            <div style='display:flex;flex-direction:row;flex-wrap: nowrap;justify-content:flex-start;'>
                <div style="flex 1 1 auto;">
                <label style="margin:5px;">角色</label>
                <el-select v-model="role"  placeholder="" >
                    <el-option
                    v-for="(opt,i) in roleOption"
                    :key ="i"
                    :label ="opt.label"
                    :value ="opt.value">
                    </el-option>
                </el-select>
                </div>
                <div style="flex 1 1 auto;margin-left:10px;">
                <label style="margin:5px;">课程</label>
                <el-select value-key="cid"  v-model="course"  placeholder="" >
                    <el-option
                    v-for="(opt,i) in courseOption"
                    :key ="i"
                    :label ="opt.label"
                    :value ="opt.value">
                    </el-option>
                </el-select>
                </div>
                <div style="flex 1 1 auto;margin-left:10px;">
                <label style="margin:5px;">班级</label>
                <el-select value-key="cid" multiple filterable allow-create default-first-option v-model="classList"  placeholder="支持键盘输入，ENTER选中" >
                    <el-option
                    v-for="(opt,i) in classOption"
                    :key ="i"
                    :label ="opt.label"
                    :value ="opt.value">
                    </el-option>
                </el-select>
                </div>
                <div style="flex 1 0 auto;margin-left:20px;">
                    <el-button  type='primary' icon="el-icon-plus" @click="addCC()"></el-button>
                </div>
            </div>
        </el-form-item>
        <el-form-item>
            <el-table
            stripe
            :header-cell-style = "mytable"
            :cell-style = "mytableCell"
            :data="cc_list">

                <el-table-column
                prop="role_id"
                label="角色ID">
                </el-table-column>

                <el-table-column
                prop="cname"
                label="课程">
                </el-table-column>

                <el-table-column
                prop="classes"
                label="班级">
                </el-table-column>

                <el-table-column
                label="操作">
                    <template slot-scope="scope">
                    <span>
                        <el-button size='mini' type='danger' icon="el-icon-delete" @click ="delCC(scope.row)"></el-button>
                    </span>
                    </template>
                </el-table-column>

            </el-table>
        </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="setCCList()">确定</el-button>
    </span>
    </el-dialog>

  </div>
</template>

<script>

export default {
    name: 'home',
    data() {
        return {
        vis: false,
        selectedAccount: '',
        currentPage: 1,//当前页面默认1
        search:'',//search输入框中的值
        pageSize:10,
        total:0,
        tableData: [],
        role:'',
        course:'',
        classList:[],
        roleOption:[],
        classOption:[],
        courseOption:[],
        cc_list: []
        }
    },
    created(){
        this.load()
        this.cal_total()
        this.getCidOpt()
    },
    methods:{

        //提交班级课程表单
        setCCList(){
            this.$request.post("/api_S/admin/setCC",this.cc_list).then( res => {
                this.$message({
                    type:"success",
                    message: res.msg
                })
            })
            this.vis = false
        },
        //课程班级表单相关
        delCC(v){
            let index = this.cc_list.indexOf(v)
            this.cc_list.splice(index,1)
        },
        addCC(){
            if(this.role && this.course && this.classList.length > 0){
                for(let i of this.classList){
                    let temp = {}
                    temp.account = this.selectedAccount
                    temp.role_id = this.role
                    temp.cid = this.course.cid
                    temp.cname = this.course.cname
                    temp.classes = i
                    this.cc_list.push(temp)
                }
            }else{
                console.log("NULL")
            }
        },
        show(row){
            this.vis = true
            this.selectedAccount = row.account
            this.roleOption = row.adminRoleList
        },

        //用户信息获取与展示
        cal_total(){
            this.$request.get("/api_S/admin/cal_list").then(res=>{
                this.total = res.data.length;
            });
        },
        load(){
            this.$request.get("/api_S/admin/list?pageNum="+this.currentPage+"&pageSize="+this.pageSize+"&search="+this.search).then(res=>{
                this.tableData=[];
                for(let i of res.data){
                    let roleList = [];
                    for(let j of i.adminRoleList){
                        let temp = {}
                        temp.value = j.role_id
                        temp.label = j.role_name
                        roleList.push(temp);
                    }
                    i.adminRoleList = roleList;
                    this.tableData.push(i);
                }
            });
        },
        getCidOpt(){
            this.$request.get("/api_S/cinfo/all").then( res => {
                for(let i of res.data){
                    let temp ={}
                    let courseOpt = {}
                    temp.cname = i.cname
                    temp.cid = i.cid
                    courseOpt.label = i.cname
                    courseOpt.value = temp
                    this.courseOption.push(courseOpt)
                }
            })
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