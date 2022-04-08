<template>
  <div class="home-container">
    <div
      v-if=" docVis === 0 "
      style="display:flex;flex-direction:row;flex-wrap: nowrap;justify-content:space-between;margin:1vw 0vw;"
    >
      <semester-selector
        style="flex: 0 1 auto;"
        @semesterChange="handleSemesterChange($event)"
        :semesterList="semesterList"
        :semester="basicInfo.semester"
      ></semester-selector>
      <div  class = "btnRow" style="flex: 1 1 auto;" ><el-button v-if="downloadPermission && nextVis && !submitVis" size="small" type='primary' @click="downloadConfirm()">下载该表</el-button></div>
      <course-selected
        :course="selected_course"
        style="flex: 1 1 auto;"
      ></course-selected>
    </div>
    <div class="card">
      <div class="card-body">
        <div class="mydoc">
          <p
            style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:1vw;"
          >
            <span
              style="font-family:&#39;宋体&#39;; font-weight:bold; letter-spacing:2pt"
            >
              课程教学目标达成度评价
            </span>
          </p>
          <div v-if="docVis === 0">
            <h1 class="myTitle">1.课程基本信息</h1>
            <table class="basicInfoTable">
              <tr>
                <th>评价学期</th>
                <td colspan="2">{{ basicInfo.semester }}</td>
                <th>评价时间</th>
                <td colspan="2">
                  <el-input
                    @blur="validateDate(basicInfo.eva_date, 'eva')"
                    v-model="basicInfo.eva_date"
                    placeholder="评价时间"
                    clearable
                  ></el-input>
                </td>
              </tr>
              <tr>
                <th>课程名称</th>
                <td colspan="2">
                  {{ basicInfo.course_name }}</td>
                <th>课程性质</th>
                <td colspan="2">
                  <span v-if="!editNow">{{ basicInfo.course_property }}</span>
                  <el-input v-else
                    v-model="basicInfo.course_property"
                    placeholder="课程性质"
                    clearable
                  ></el-input></td>
              </tr>
              <tr>
                <th>考核班级</th>
                <td colspan="2">{{ basicInfo.classes }}</td>
                <th>考试时间</th>
                <td colspan="2">
                  <span v-if="!editNow">{{ basicInfo.exam_date }}</span>
                  <el-input v-else
                  @blur="validateDate(basicInfo.exam_date, 'exam')"
                    v-model="basicInfo.exam_date"
                    placeholder="考试时间"
                    clearable
                  ></el-input>
                </td>
              </tr>
              <tr>
                <th>课程学分</th>
                <td>
                  <span v-if="!editNow">{{ basicInfo.course_point }}</span>
                  <el-input v-else
                    v-model="basicInfo.course_point"
                    placeholder="课程学分"
                    clearable
                  ></el-input></td>
                <th>周学时</th>
                <td>
                  <span v-if="!editNow">{{ basicInfo.week_hour }}</span>
                  <el-input v-else
                    v-model="basicInfo.week_hour"
                    placeholder="周学时"
                    clearable
                  ></el-input>
                </td>
                <th>总学时</th>
                <td>
                  <span v-if="!editNow">{{ basicInfo.course_hour }}</span>
                  <el-input v-else
                    v-model="basicInfo.course_hour"
                    placeholder="总学时"
                    clearable
                  ></el-input>
                </td>
              </tr>
              <tr>
                <td colspan="6">学时分配</td>
              </tr>
              <tr>
                <th>课堂讲授</th>
                <td colspan="2">
                  <span v-if="!editNow">{{ basicInfo.lesson_hour }}</span>
                  <el-input v-else
                    v-model="basicInfo.lesson_hour"
                    placeholder="课堂讲授"
                    clearable
                  ></el-input></td>
                <th>课程实践</th>
                <td colspan="2">
                  <span v-if="!editNow">{{ basicInfo.practice_hour }}</span>
                  <el-input v-else
                    v-model="basicInfo.practice_hour"
                    placeholder="课程实践"
                    clearable
                  ></el-input></td>
              </tr>
              <tr>
                <th>考核方式</th>
                <td colspan="5">{{ basicInfo.exam_type }}</td>
              </tr>
              <tr>
                <th>教材信息</th>
                <td colspan="5">
                  <span v-if="!editNow">{{ basicInfo.text_book }}</span>
                  <el-input v-else
                    v-model="basicInfo.text_book"
                    placeholder="教材信息"
                    clearable
                  ></el-input></td>
              </tr>
            </table>
            <div><el-button v-if="editNow && submitVis"  style="margin:1vw;" type="primary" @click="evaReload()">提交</el-button></div>
          </div>
          <div v-if="docVis === 1">
            <h1 class="myTitle">2.评分标准</h1>
            <table class="basicInfoTable">
              <tr>
                <th>评定等级</th>
                <td>评分标准</td>
              </tr>
              <tr>
                <th>优秀</th>
                <td>{{ courseStandard.excellent }}</td>
              </tr>
              <tr>
                <th>良好</th>
                <td>{{ courseStandard.good }}</td>
              </tr>
              <tr>
                <th>中等</th>
                <td>{{ courseStandard.normal }}</td>
              </tr>
              <tr>
                <th>及格</th>
                <td>{{ courseStandard.pass }}</td>
              </tr>
              <tr>
                <th>不及格</th>
                <td>{{ courseStandard.poor }}</td>
              </tr>
            </table>
          </div>
          <div v-if="docVis === 2">
            <h1 class="myTitle">3.课程达成度评价</h1>
            <table class="basicInfoTable">
              <tr>
                <th rowspan="5">总评成绩分布情况</th>
                <td>应考人数:{{ evaForm.need_exam }}</td>
                <td>缺考人数:{{ evaForm.miss_exam }}</td>
              </tr>
              <tr>
                <td>60分以下(不合格)人数:{{ evaForm.poor_num }}</td>
                <td>60-69分(合格)人数:{{ evaForm.pass_num }}</td>
              </tr>
              <tr>
                <td>70-79分(中等)人数:{{ evaForm.normal_num }}</td>
                <td>80-89分(良好)人数:{{ evaForm.good_num }}</td>
              </tr>
              <tr>
                <td>90-100分(优秀)人数:{{ evaForm.excellent_num }}</td>
                <td></td>
              </tr>
              <tr>
                <td>优秀率:{{ evaForm.excellent_ratio }}%</td>
                <td>及格率:{{ evaForm.pass_ratio }}%</td>
              </tr>
            </table>

            <table class="basicInfoTable" style="margin-top:2vw;">
              <tr>
                <td colspan="2">学习目标</td>
                <td colspan="5">学习任务的观测</td>
              </tr>
              <tr>
                <th>课程目标</th>
                <th>支撑指标点</th>
                <th>观测点</th>
                <th>总分</th>
                <th>期望值</th>
                <th>实际值</th>
                <th>达成度</th>
              </tr>
              <tr v-for="(ctar, i) in cTARForm.ctargets" :key="i">
                <td>课程目标{{ i + 1 }}</td>
                <td>{{ ctar.support_graduation_require }}</td>
                <td>{{ ctar.eva_point }}</td>
                <td>{{ ctar.total }}</td>
                <td>{{ ctar.expectation }}</td>
                <td>{{ ctar.not_reach }}</td>
                <td>{{ ctar.achieve_degree }}</td>
              </tr>
            </table>
          </div>
          <div :style="[docVis !== 3 ? display_class : '']" class="evaForm">
            <h1 class="myTitle">4.基于达成度的分析和改进</h1>
            <div>
              <span>
                {{ basicInfo.semester }}学期的{{
                  basicInfo.course_name
                }}考核结果分析如图1所示
              </span>
              <div style="width: 100%;height:400px;" ref="goals_pic"></div>
              <div style="display:flex;flex-wrap: nowrap;flex-direction:row;justify-content:flex-start;">
                <span style="white-space:nowrap;flex: 1 1 auto;font-size: 0.8vw;line-height: 1.9vw;margin-right:0.8vw;">分析:</span>
                <el-input
                  v-model="basicInfo.goals_degree_describe"
                  placeholder="分析"
                  clearable
                ></el-input>
              </div>
            </div>
            <div v-for="(ctarget, i) in cTARForm.ctargets" :key="i">
              <div>课程目标{{ i + 1 }}</div>
              <div style="display:flex;flex-wrap: nowrap;flex-direction:row;justify-content:flex-start;">
                <span style="white-space:nowrap;flex: 1 1 auto;font-size: 0.8vw;line-height: 1.9vw;margin-right:0.8vw;">描述:</span>
                <el-input
                  style="flex: 1 1 auto;"
                  :autosize="{ minRows: 3, maxRows: 6 }"
                  type="textarea"
                  v-model="ctarget.score_description"
                  placeholder="描述"
                  clearable
                ></el-input>
              </div>

              <div
                style="width: 100%;height:400px;"
                :id="'course_goal_' + i"
              ></div>
              <div style="display:flex;flex-wrap: nowrap;flex-direction:row;justify-content:flex-start;">
                <span style="white-space:nowrap;flex: 1 1 auto;font-size: 0.8vw;line-height: 1.9vw;margin-right:0.8vw;">分析:</span>
                <el-input
                  type="textarea"
                  style="flex: 1 1 auto;"
                  :autosize="{ minRows: 3, maxRows: 6 }"
                  v-model="ctarget.score_analysis"
                  placeholder="分析"
                  clearable
                ></el-input>
              </div>
            </div>

            <p
              style="margin-top:0pt; margin-bottom:0pt;   widows:0; orphans:0; font-size:10.5pt"
            >
              <span style="font-family:&#39;宋体&#39;">
                课程评价人:<input
                  style="text-align:center;"
                  v-model="basicInfo.eva_person"
                />
              </span>
              <span style="font-family:&#39;宋体&#39;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              </span>
              <span style="font-family:&#39;宋体&#39;">
                评价时间{{ basicInfo.eva_date }}
              </span>
            </p>
          </div>
        </div>
        <div style="margin-top:20px;text-align:center;">
          <el-button v-if="docVis !== 0 " @click="back()">上一页</el-button>
          <el-button v-if="docVis === 3 " @click="sendDBConfirm()">提交</el-button>
          <el-button v-if="docVis !== 3 && !submitVis && nextVis " @click="next()">下一页</el-button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import CourseSelected from "@/components/CourseSelected.vue";
import SemesterSelector from "../component/SemesterSelector.vue";
export default {
  name: "courseDegree",
  components: {
    "semester-selector": SemesterSelector,
    "course-selected": CourseSelected
  },
  data() {
    return {
      submitVis: false,
      nextVis: true,
      editNow: false,
      downloadPermission: false,
      selected_course: "",
      display_class: { display: "none" },
      last_semester: "",
      semesterList: [],
      docVis: 0,
      basicInfo: {},
      courseStandard: {},
      evaForm: {},
      cTARForm: {
        ctargets: []
      },
      goals_detail: [],
      goals_chart: "",
      course_goal_charts: ""
    };
  },
  methods: {
    validateDate(time, name){
      let patt = /[0-9]{4}.[0-9]{2}.[0-9]{2}/;
      if (patt.test(time)) {
        return
      } else {
        switch(name){
          case 'eva':
            this.basicInfo.eva_date = ''
            break;
          case 'exam':
            this.basicInfo.exam_date = ''
        }
        this.$message({
          type: "warning",
          message: "输入格式为2019.02.01"
        });
      }
    },
    evaReload(){
      this.sendDataBase()
    },
    editBasic(){
      this.editNow = true;
    },
    back() {
      if (this.docVis-- === 0) {
        this.docVis = 0;
      }
    },
    next() {
      if (!this.basicInfo.semester) {
        this.$message({
          type: "warning",
          message: "未选择学期"
        });
        return;
      }
      if (this.docVis++ === 3) {
        this.docVis = 0;
      }
    },
    sendDBConfirm() {
      this.$confirm("确定提交本次修改吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          if (
            !this.basicInfo.goals_degree_describe ||
            !this.basicInfo.eva_person ||
            !this.basicInfo.eva_date
          ) {
            this.$message({
              type: "warning",
              message: "请填写完整"
            });
            return false;
          }
          for (let i = 0; i < this.cTARForm.ctargets.length; i++) {
            if (!this.cTARForm.ctargets[i].score_description) {
              this.$message({
                type: "warning",
                message: "请填写完整2"
              });
              return false;
            }
          }
          this.sendDataBase()
          this.directDownload()
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消"
          });
        });
    },
    sendDataBase() {
      let data = {};
      data.basicInfo = this.basicInfo;
      data.ctargets = this.cTARForm.ctargets;
      this.$request.post("/api_S/exam_audit/update_eva", data).then(res => {
        console.log("11111111111", res);
      });
    },
    downloadConfirm() {
      if (!this.basicInfo.semester) {
        this.$message({
          type: "warning",
          message: "未选择学期"
        });
        return;
      }
      this.$confirm("是否下载此表", "提示", {
        confirmButtonText: "是",
        cancelButtonText: "否",
        type: "warning"
      })
        .then(() => {
          this.directDownload()
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消"
          });
        });
    },
    directDownload(){
      this.$request
        .post("/api_P/degree", this.generateData(), { responseType: "blob" })
        .then(res => {
          console.log("下载课程目标达成度", res);
          let blob = new Blob([res], { type: "application/msword" }); // 服务端返回的文件流excel文件
          let fileName = this.selected_course + '课程目标达成度评价' + '-' + this.basicInfo.semester +'.doc'; // 保存的文件名
          this.downLoadFile(blob, fileName);
        })
        .catch(error => {
          this.$message({
              type: "warning",
              message: error
          });
        });
    },
    downLoadFile(blob, fileName) {
      // for IE
      if (window.navigator && window.navigator.msSaveOrOpenBlob) {
        window.navigator.msSaveOrOpenBlob(blob, fileName);
      }
      // for Non-IE (chrome, firefox etc.)
      else {
        var a = document.createElement('a');
        document.body.appendChild(a);
        a.style = 'display: none';
        var url = window.URL.createObjectURL(blob);
        a.href = url;
        a.download = fileName;
        a.click();
        a.remove();
        window.URL.revokeObjectURL(url);
      }
    },
    generateData() {
      let data = {};
      data.course_id = this.basicInfo.course_number
      data.semester = this.basicInfo.semester;
      data.date = this.basicInfo.eva_date;
      data.course_name = this.basicInfo.course_name;
      data.exam_type = this.basicInfo.course_property;
      data.exam_mode = this.basicInfo.exam_type;
      data.classes = this.basicInfo.classes;
      data.textbook = this.basicInfo.text_book;
      data.exam_date = this.basicInfo.exam_date;
      let standard = [];
      standard.push(this.courseStandard.excellent);
      standard.push(this.courseStandard.good);
      standard.push(this.courseStandard.normal);
      standard.push(this.courseStandard.pass);
      standard.push(this.courseStandard.poor);
      data.standard = standard;
      data.need_exam = this.evaForm.need_exam;
      data.miss_exam = this.evaForm.miss_exam;
      data.appraiser = this.basicInfo.eva_person;
      let course_goals = [];
      for (let i of this.cTARForm.ctargets) {
        let temp_target = {};
        temp_target.support_graduation_require = i.support_graduation_require;
        temp_target.point = i.eva_point;
        temp_target.score = i.total;
        temp_target.expectation = i.expectation;
        temp_target.degree = i.achieve_degree;
        temp_target.description = i.score_description;
        temp_target.analysis = i.score_analysis;
        course_goals.push(temp_target);
      }
      data.course_goals = course_goals;
      return data;
    },
    handleSemesterChange(v) {
      if (!v) {
        this.$message({
          type: "warning",
          message: "未选择学期"
        });
        return;
      }
      if (this.last_semester === v) {
        return;
      }
      this.basicInfo.semester = v;
      this.basicInfo.course_number = JSON.parse(
        localStorage.getItem("selected_course")
      ).cid;
      this.nextVis = true;
      this.editNow = false;
      this.submitVis = false;
      this.load();
      this.docVis = 0;
    },
    getSemester() {
      this.$request
        .get(
          "/api_S/exam_audit/semester_list?cid=" + this.basicInfo.course_number
        )
        .then(res => {
          this.semesterList = res.data;
        });
    },
    load() {
      this.$request
        .get(
          "/api_S/exam_audit/load_info?semester=" +
            this.basicInfo.semester +
            "&cid=" +
            this.basicInfo.course_number +
            "&page=" +
            "eva"
        )
        .then(res => {
          if (res.code === "500") {
            this.$message({
              type: "warning",
              message: res.msg
            });
            this.downloadPermission = false;
            let s = this.basicInfo.semester;
            this.basicInfo = {};
            this.basicInfo.semester = s;
            this.courseStandard = {};
            this.evaForm = {};
            this.cTARForm = {};
            this.goals_detail = [];
            this.goals_chart = "";
            this.course_goal_charts = "";
            this.nextVis = false;
            return;
          }
          let data = res.data;
          this.basicInfo = data.basicInfo;
          if(!data.mods){
            this.editNow = true; //如果没有填写eva信息则进入编辑状态
            this.submitVis = true; //而且可以编辑
            return;
          }
          if(!data.evaForm){
            this.$message({
              type: "warning",
              message: "没有课程目标成绩信息"
            });
            this.nextVis = false; //不能下一页
            return;
          }
          this.editNow = true;
          this.nextVis = true;
          this.downloadPermission = true;
          this.cTARForm.ctargets = data.ctargets !== null ? data.ctargets : [];
          this.courseStandard = data.courseStandard;
          this.evaForm = data.evaForm;
          for (let i of data.goal_details) {
            let temp_data = [];
            for (let j = 0; j < i.value.length; j++) {
              let temp = [j + 1, i.value[j]];
              temp_data.push(temp);
            }
            this.goals_detail.push(temp_data);
          }
        });
    },
    initEChart() {
      this.$nextTick(() => {
        this.goals_chart = this.$echarts.init(this.$refs.goals_pic);
        this.drawEChart();
      });
    },
    drawEChart() {
      let x_goals = [];
      for (let i = 0; i < this.cTARForm.ctargets.length; i++) {
        x_goals.push("课程目标" + (i + 1));
      }
      let goals_value = [];
      for (let j of this.cTARForm.ctargets) {
        goals_value.push(j.achieve_degree);
      }
      let option = {
        title: {
          top: "bottom",
          left: "center",
          text: "图1"
        },
        grid: {
          left: "center",
          top: "top"
        },
        tooltip: {
          trigger: "axis",
          axisPointer: {
            type: "cross"
          },
          backgroundColor: "rgba(255, 255, 255, 0.8)",
          extraCssText: "width: 170px"
        },
        xAxis: {
          type: "category",
          data: x_goals
        },
        yAxis: {
          type: "value"
        },
        series: [
          {
            name: "达成度",
            type: "bar",
            data: goals_value
          }
        ]
      };
      this.goals_chart.setOption(option);
    },
    initCGEChart() {
      this.$nextTick(() => {
        let arr = [];
        for (let i = 0; i < this.cTARForm.ctargets.length; i++) {
          let item = {
            barChart: "" // chart 对象实例
          };
          arr.push(item);
        }
        this.course_goal_charts = arr;
        for (let i = 0; i < this.cTARForm.ctargets.length; i++) {
          let refName = "course_goal_" + i;
          this.course_goal_charts[i].barChart = this.$echarts.init(
            document.getElementById(refName)
          );
        }
        this.drawCG();
      });
    },
    drawCG() {
      for (let i = 0; i < this.cTARForm.ctargets.length; i++) {
        this.drawCGEChart(
          this.course_goal_charts[i].barChart,
          this.goals_detail[i]
        );
      }
    },
    drawCGEChart(charter, point_data) {
      let option = {
        grid: {
          left: "3%",
          right: "7%",
          bottom: "3%",
          containLabel: true
        },
        xAxis: {
          type: "value",
          scale: true,
          axisLabel: {
            formatter: "{value}"
          },
          splitLine: {
            show: false
          }
        },
        yAxis: {
          type: "value",
          scale: true,
          axisLabel: {
            formatter: "{value}"
          },
          splitLine: {
            show: false
          }
        },
        series: [
          {
            name: "Male",
            type: "scatter",
            data: point_data
          }
        ]
      };
      charter.setOption(option);
    },

    mytable() {
      return this.$setCss.tableHeadCell;
    },
    mytableCell() {
      return this.$setCss.tableCell;
    }
  },
  created() {
    if (!localStorage.getItem("selected_course")) {
      this.$message({
        type: "warning",
        message: "请先选择课程"
      });
      this.$router.push("/myCourseList");
    } else {
      this.selected_course = JSON.parse(
        localStorage.getItem("selected_course")
      ).cname;
      this.basicInfo.course_number = JSON.parse(
        localStorage.getItem("selected_course")
      ).cid;
      this.getSemester();
    }
  },
  mounted() {},
  watch: {
    docVis(v) {
      if (v === 3) {
        this.initEChart();
        this.initCGEChart();
      }
    }
  }
};
</script>

<style lang="less" scoped>
.el-input {
  /deep/ .el-input__inner {
    text-align: center;
  }
}
.mydoc {
  text-align: center;
}

.mydoc table {
  margin: auto;
}

.myTitle {
  margin: 1vw;
  line-height: 150%;
  font-size: 1.7vw;
}

.mySecondTitle {
  margin: 0.5vw;
  font-size: 1.5vw;
}

.basicInfoTable {
  border-collapse: collapse;
  width: 80%;
}

.basicInfoTable tr {
  height: 3vw;
}

.basicInfoTable tr td {
  border-style: solid;
  border-width: 0.5pt;
  font-size: 1vw;
  padding: 10px;
}

.basicInfoTable tr th {
  border-style: solid;
  border-width: 0.5pt;
  width: 10%;
  font-size: 1vw;
  padding: 10px;
}

.basicInfoTable tr td span{
  border-width: 0.5pt;
  font-size: 1vw;
}

.evaForm {
  margin: 2vw;
}

.evaForm > div {
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  margin: 1.5vw;
}

.evaForm > div > span {
  flex: 1 1 auto;
}

.evaForm > div > div {
  flex: 1 0 auto;
  margin: 0.5vw;
}
</style>