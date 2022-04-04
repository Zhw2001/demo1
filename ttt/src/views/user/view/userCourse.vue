<template>
  <div class="home-container">
    <div class="card">
      <div class="card-body">
        <div class="myELTable">
        <el-table
          :fit="true"
          stripe
          :header-cell-style="mytable"
          :cell-style="mytableCell"
          :data="tableData"
          :default-sort="{ prop: 'uid', order: 'ascending' }"
          @select="Select"
          @select-all="SelectAll"
        >
          <!--<el-table-column type="selection"> </el-table-column> -->

          <el-table-column label="ID" prop="uid" sortable> </el-table-column>

          <el-table-column prop="account" label="账户"> </el-table-column>

          <el-table-column prop="nickname" label="昵称"> </el-table-column>

          <el-table-column label="操作">
            <template slot-scope="scope">
              <span>
                <el-button
                  size="mini"
                  type="primary"
                  icon="el-icon-edit"
                  @click="show(scope.row)"
                ></el-button>
              </span>
            </template>
          </el-table-column>
        </el-table>
        </div>
      </div>
    </div>
    <el-dialog title="分配课程" :visible.sync="vis" width="70%">
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
              v-model="role_id"
              placeholder="请选择角色"
              @change="handleRoleChange()"
            >
              <el-option
                v-for="(role, i) in roleList"
                :key="i"
                :label="role.role_name"
                :value="role.role_id"
              >
              </el-option>
            </el-select>
            <div v-if="role_id !== 1" style="flex 1 1 auto;margin-left:1vw;">
              <label style="margin:5px;">课程:</label>
              <el-select
                multiple
                filterable
                collapse-tags
                v-model="selected_course"
                placeholder="搜索"
              >
                <el-option
                  v-for="(opt, i) in courseOption"
                  :key="i"
                  :label="opt.cname"
                  :value="opt.cid"
                >
                </el-option>
              </el-select>
            </div>
            <div v-if="role_id !== 1" style="flex 1 0 auto;margin-left:1vw;">
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
            :data="course_list"
          >
            <el-table-column prop="cid" label="课程编号"> </el-table-column>

            <el-table-column prop="cname" label="课程名称"> </el-table-column>

            <el-table-column v-if="role_id !== 1" label="操作">
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
        <el-button type="primary" @click="close()">确定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "home",
  data() {
    return {
      vis: false,
      confireVis: false,
      selected_uid: "",
      tableData: [],
      course_list: [],
      courseOption: [],
      selected_course: [],
      role_id: '',
      roleList:[],
      UR_ID:''
    };
  },
  created() {
    this.load();
  },
  methods: {
    AddConfirm() {
      if(this.role_id === ""){
        this.$message({
          type: "warning",
          message: "请先选择角色"
        });
        return;
      }
      this.$confirm("确定为该用户分配这些课程吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          this.addCourse();
        })
        .catch(() => {
          console.log("111111111")
          this.$message({
            type: "info",
            message: "已取消"
          });
        });
    },
    DelConfirm(v) {
      this.$confirm("确定删除该课程吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          this.delCourse(v);
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消"
          });
        });
    },
    close() {
      this.vis = false;
    },
    //课程班级表单相关
    delCourse(v) {
      let index = this.course_list.indexOf(v);
      this.course_list.splice(index, 1);
      let result = {
        subject_id: this.UR_ID,
        delete: [v.cid]
      };
      this.$request.post("/api_S/admin/set_course", result).then(res => {
        this.$message({
          type: "info",
          message: res.msg
        });
      });
    },
    addCourse() {
      let result = {
        subject_id: this.UR_ID,
        insert: this.selected_course
      };
      this.$request.post("/api_S/admin/set_course", result).then(res => {
        console.log('set_course',res.msg)
        this.handleRoleChange()
      });
    },

    show(row) {
      this.role_id = '';
      this.vis = true;
      this.selected_uid = row.uid;
      this.roleList = row.adminRoleList;
      this.course_list = [];
      this.selected_course = [];
    },

    handleRoleChange(){
      this.course_list = []
      if( this.role_id !== 1 ){
        this.$request.get( '/api_S/admin/get_ur_id?uid='+ this.selected_uid + '&role_id=' + this.role_id ).then( res => {
          this.UR_ID = res.data
          this.$request.get( '/api_S/admin/get_course_list?ur_id='+this.UR_ID ).then( res => {
            this.course_list = res.data;
          })
        })
      } else{
        this.$request.get("/api_S/cinfo/all").then(res => {
          this.course_list = res.data;
        });
      }
    },

    load() {
      this.$request.get("/api_S/admin/all").then(res => {
        this.tableData = res.data;
      });
      this.$request.get("/api_S/cinfo/all").then(res => {
        this.courseOption = res.data;
      });
    },

    //数据行选择方法
    Select(value) {
      console.log(value);
    },
    //全选方法
    SelectAll(value) {
      console.log(value);
    },

    //表格样式设置
    mytable() {
      return this.$setCss.tableHeadCell;
    },
    mytableCell() {
      return this.$setCss.tableCell;
    }
  }
};
</script>

<style scoped>
</style>