<template>
 <div class="home-container">
    <div class="card">
      <div class="card-body">
        <div class="myELTable">
          <el-table
            stripe
            :data="courseList"
          >
            <el-table-column prop="cid" label="课程编号"> </el-table-column>

            <el-table-column prop="cname" label="课程名称"> </el-table-column>

            <el-table-column label="操作">
              <template slot-scope="scope">
                <span>
                  <el-button circle
                    size="mini"
                    icon="el-icon-s-open"
                    @click="AuditConfirm(scope.row)"
                  ></el-button>
                </span>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </div>
    </div>
 </div>
</template>


<script>

export default {
  name: "Blank",
  data() {
    return {
      courseList: []
    };
  },
  created() {
    this.getCList()
  },
  methods: {
    setCourse(v){
      localStorage.setItem("selected_course", JSON.stringify(v))
      this.$message({
        type: "success",
        message: "成功"
      });
    },
    getCList() {
      if (JSON.parse(localStorage.getItem("role")).role_id !== 1) {
          this.courseList = JSON.parse(localStorage.getItem("course_list"))
      } else {
        this.$request.get("/api_S/cinfo/all").then(res => {
          this.courseList = res.data;
        });
      }
    },
    AuditConfirm(v) {
      this.$confirm("确定选择该课程吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          this.setCourse(v);
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消"
          });
        });
    },
  }
};
</script>

<style scoped>

</style>
