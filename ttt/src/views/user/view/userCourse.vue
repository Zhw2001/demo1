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
          <el-table-column type="selection"> </el-table-column>

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
            <div style="flex 1 1 auto;margin-left:10px;">
              <label style="margin:5px;">课程</label>
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
            <div style="flex 1 0 auto;margin-left:20px;">
              <el-button
                type="primary"
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

            <el-table-column label="操作">
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
      selected_course: []
    };
  },
  created() {
    this.load();
  },
  methods: {
    AddConfirm() {
      this.$confirm("确定为该用户分配这些课程吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          this.addCourse();
        })
        .catch(() => {
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
        subject_id: this.selected_uid,
        delete: [v.cid]
      };
      this.$request.post("/api_S/admin/del_course", result).then(res => {
        this.$message({
          type: "info",
          message: res.msg
        });
      });
    },
    addCourse() {
      let result = {
        subject_id: this.selected_uid,
        insert: this.selected_course
      };
      this.$request.post("/api_S/admin/set_course", result).then(res => {
        this.$message({
          type: "info",
          message: res.msg
        });
        this.close()
      });
    },
    show(row) {
      this.vis = true;
      this.selected_uid = row.uid;
      this.$request
        .get("/api_S/admin/get_course_list?uid=" + row.uid)
        .then(res => {
          this.course_list = res.data;
        });
    },

    load() {
      this.$request.get("/api_S/admin/all").then(res => {
        this.tableData = [];
        for (let i of res.data) {
          for (let j = i.adminRoleList.length - 1; j > 0; j--) {
            if (i.adminRoleList[j].role_id === 4) {
              this.tableData.push(i);
              break;
            }
          }
        }
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