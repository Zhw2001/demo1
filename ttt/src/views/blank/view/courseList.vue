<template>
  <div class="home-container">
    <div
      style="display:flex;flex-direction:row;flex-wrap: nowrap;justify-content:space-around; margin:1vw 0vw;"
    >
      <course-selected
        :course="selected_course"
        style="flex: 1 1 auto;"
      ></course-selected>
      <div
        style="flex: 1 1 auto;display:flex;justify-content:flex-start ;flex-direction:row;"
      >
        <span
          style="font-size:0.8vw;flex:0 1 auto;line-height:1.8vw;margin:0px 10px;"
          >课程类型:</span
        >
        <el-select
          @change="handleCTypeChange"
          style="flex:0 1 auto;"
          v-model="ctype"
          placeholder="课程类型"
          size="small"
        >
          <el-option
            v-for="item in ctypeList"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          >
          </el-option>
        </el-select>
      </div>
    </div>
    <div class="card">
      <div class="card-body">
        <el-form :inline="true" @submit.native.prevent>
          <el-form-item  label="查找:">
            <el-input v-model="searchCourse" placeholder="请输入关键字" @keyup.enter.native="search(searchCourse)"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type='primary' @click="search(searchCourse)"><i class="el-icon-search"></i></el-button>
          </el-form-item>
        </el-form>
        <div class="myELTable">
          <el-table stripe :data="searchList">
            <el-table-column prop="cid" label="课程编号"> </el-table-column>

            <el-table-column prop="cname" label="课程名称"> </el-table-column>

            <el-table-column label="课程类型">
              <template slot-scope="scope">
                <span>{{ setCType(scope.row.course_type) }}</span>
              </template>
            </el-table-column>

            <el-table-column prop="course_type_name" label="课程属性"> </el-table-column>
            <el-table-column prop="course_category" label="课程类别"> </el-table-column>
            <el-table-column prop="faculty" label="开课院系"> </el-table-column>
            <el-table-column prop="teacher" label="授课教师"> </el-table-column>

            <el-table-column label="操作">
              <template slot-scope="scope">
                <span>
                  <el-button
                    circle
                    size="mini"
                    icon="el-icon-thumb"
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
import CourseSelected from "@/components/CourseSelected.vue";

export default {
  name: "Blank",
  components: {
    "course-selected": CourseSelected
  },
  data() {
    return {
      searchCourse: '',
      searchList: [],
      selected_course: "",
      currList: [],
      courseList: [],
      ctype: "",
      ctypeList: [
        { label: "理论课", value: 0 },
        { label: "实验课", value: 1 },
        { label: "课程设计", value: 2 },
        { label: "毕业设计", value: 3 }
      ]
    };
  },
  created() {
    this.getCList();
    this.selected_course = JSON.parse(localStorage.getItem("selected_course"))
      ? JSON.parse(localStorage.getItem("selected_course")).cname
      : "";
  },
  methods: {
    search(searchCourse){
      console.log('123')
      if (searchCourse) {
          this.searchList =  this.currList.filter(data => {
            return Object.keys(data).some(key => {
              return String(data[key]).toLowerCase().indexOf(searchCourse) > -1
            })
          })
        }
    },
    handleCTypeChange(v){
      this.currList = []
      for(let i of this.courseList){
        if(i.course_type === v){
          this.currList.push(i)
        }
      }
      this.searchList = this.currList
    },
    setCourse(v) {
      this.selected_course = v.cname;
      localStorage.setItem("selected_course", JSON.stringify(v));
      this.$message({
        type: "success",
        message: "成功"
      });
    },
    getCList() {
      if (JSON.parse(localStorage.getItem("role")).role_id !== 1) {
        this.courseList = JSON.parse(localStorage.getItem("course_list"));
        for( let i of this.courseList){
          let teacherstr = i.teacher.split(',');
          i.teacher = teacherstr[0] + (teacherstr.length > 1 ? ',' + teacherstr[1] : '') + (teacherstr.length > 2 ? ',' + teacherstr[2] : '')
        }
        this.currList = this.courseList;
        this.searchList = this.courseList;
      } else {
        this.$request.get("/api_S/cinfo/all").then(res => {
          this.courseList = res.data;
          for( let i of this.courseList){
            let teacherstr = i.teacher.split(',');
            i.teacher = teacherstr[0] + (teacherstr.length > 1 ? ',' + teacherstr[1] : '') + (teacherstr.length > 2 ? ',' + teacherstr[2] : '')
          }
          this.currList = this.courseList;
          this.searchList = this.courseList;
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
    setCType(v) {
      switch (v) {
        case 0:
          return "理论课";
        case 1:
          return "实验课";
        case 2:
          return "课程设计";
        case 3:
          return "毕业设计";
      }
    }
  }
};
</script>

<style scoped>
</style>
