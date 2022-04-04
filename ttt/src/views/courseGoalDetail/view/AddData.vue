<template>
  <div class="home-container">
    <div
      v-if="divVis"
      style="display:flex;flex-direction:row;flex-wrap: nowrap;justify-content:flex-start; margin:1vw 0vw;"
    >
      <semester-selector  style="flex: 1 1 auto;"  @semesterChange = "handleSemesterChange($event)" :semesterList = semesterList :semester = semester></semester-selector>
      <course-selected 
        :course="selected_course"
        style="flex: 1 1 auto;"
      ></course-selected>
    </div>
    <div class="card">
      <div class="card-body">
        <div v-if="divVis" class="mydiv">
          <div style="margin-bottom: 1.5vw;">
            <span>下载课程模板表格，填写数据</span>
          </div>
          <div>
            <el-button @click="nextPage()" round >下一步</el-button>
          </div>
        </div>

        <div v-else class="mydiv">
          <span>上传填写完成的表格</span>
          <div>
            <el-form>
              <el-form-item >
                <el-upload
                  class="upload-demo"
                  ref="upload"
                  accept=".xlsx"
                  :http-request="httpRequest"
                  :file-list="fileList"
                  :on-change="handleChange"
                  action=""
                  :show-file-list="true"
                  :on-success="onSuccess"
                  :on-error="onError"
                  :auto-upload="false"
                >
                  <el-button slot="trigger" size="small" type="primary"
                    >选取文件</el-button
                  >
                </el-upload>
              </el-form-item>
              <el-form-item>
                <el-button
                     size="small"
                    type="success"
                    @click="submitUpload"
                    >上传</el-button>
              </el-form-item>
              <el-form-item>
                <el-button style="margin-left:90%;" @click="nextPage()">返回</el-button>
              </el-form-item>
            </el-form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import CourseSelected from "@/components/CourseSelected.vue"
import SemesterSelector from "../component/SemesterSelector.vue"

export default {
  name: "generate",
  components: {
    'semester-selector': SemesterSelector,
    "course-selected": CourseSelected
  },
  data() {
    return {
      selected_course:'',
      last_semester: '',
      semesterList: [],
      semester: '',
      cid: '',
      divVis: true,
      fileList: [],
    };
  },

  created(){
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
      this.cid = JSON.parse(
        localStorage.getItem("selected_course")
      ).cid;
      this.getSemester();
    }
  },

  methods: {

    downloadScoreDetail() {
      let fd = new FormData(); // FormData 对象
      fd.append("semester", this.semester);
      fd.append("course_id", this.cid);
      this.dSSend(fd).then(res => {
        console.log('下载课程目标明细')
        let data = res.data
        let blob = new Blob([data], { type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" }); // 获取服务端返回的文件流excel文件
        let fileName = res.headers['content-disposition'].split('filename=')[1]// 保存的文件名
        this.downLoadFile(blob, fileName);
      });
    },
    dSSend(params) {
      const config = {
        headers: {
          "Content-Type": "multipart/form-data"
        },
        responseType: "blob",
      };
      return axios
        .post("/api_P/download_score", params, config)
        .then(res => {
          return res;
        })
        .catch(error => {
          console.log(error);
        });
    },

    downloadTemplate() {
      let fd = new FormData(); // FormData 对象
      fd.append("semester", this.semester);
      fd.append("course_id", this.cid);
      this.dTSend(fd).then(res => {
        console.log('下载课程模板')
        let data = res.data
        let blob = new Blob([data], { type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" }); // 获取服务端返回的文件流excel文件
        let fileName = this.selected_course + this.semester + '.xlsx'// 保存的文件名
        this.downLoadFile(blob, fileName);
      });
    },
    dTSend(params) {
      const config = {
        headers: {
          "Content-Type": "multipart/form-data"
        },
        responseType: "blob",
      };
      return axios
        .post("/api_P/detail_template", params, config)
        .then(res => {
          return res;
        })
        .catch(error => {
          console.log(error);
        });
    },

    //处理返回的二进制流
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

    nextPage() {
      if(this.semester === ""){
        this.$message({
            type: "warning",
            message: "请先下载并填写表格!"
          })
        return
      }
      this.divVis = !this.divVis;

    },
    getSemester() {
      this.$request
        .get(
          "/api_S/exam_audit/semester_list?cid=" + this.cid
        )
        .then(res => {
          this.semesterList = res.data;
        });
    },
    handleSemesterChange(v) {
      if(!v){
        this.$message({
          type: "warning",
          message: "未选择学期"
        });
        return
      }
      this.semester = v
      this.last_semester = v
      this.downloadTemplate()
    },


    //上传
    submitUpload() {
      this.$refs.upload.submit();
    },
    httpRequest(param) {
      let fileObj = param.file; // 相当于input里取得的files
      let fd = new FormData(); // FormData 对象
      fd.append("file", fileObj); // 文件对象
      fd.append("semester", this.semester);
      fd.append("course_id", this.cid);
      this.uploadScore(fd).then(res => {
          this.$message({
            type: "success",
            message: "上传成功，准备下载成绩明细"
          })
          this.downloadScoreDetail();
      });
    },
    uploadScore(params) {
      const config = {
        headers: {
          "Content-Type": "multipart/form-data"
        }
      };
      return axios
        .post("/api_P/upload_score", params, config)
        .then(res => {
          return res;
        })
        .catch(error => {
          console.log(error);
        });
    },
   
    onSuccess(res) {
      this.$alert(res.data, "提示", {
        confirmButtonText: "确定",
        callback: action => {
          console.log("上传成功");
        }
      });
    },
    onError(res) {
      this.$alert("创建失败", "提示", {
        confirmButtonText: "确定",
        callback: action => {
          console.log("上传失败");
        }
      });
    },
    handleChange(file, fileList) {
      if (fileList.length > 0) {
        this.fileList = [fileList[fileList.length - 1]]; // 这一步，是展示最后一次选择的文件
      }
    },

    mytable() {
      return this.$setCss.tableHeadCell;
    },
    mytableCell() {
      return this.$setCss.tableCell;
    }
  }
};
</script>

<style lang="less" scoped>
.mydiv {
  text-align: center;
}

.mydiv span {
  font-size: 2vw;
}

.mydiv div {
  margin-top: 1vw;
}
.upload-demo {
  display: flex;
  justify-content: center;
}
/deep/ .el-list-enter-active,
/deep/ .el-list-leave-active {
  transition: none;
}

/deep/ .el-list-enter,
/deep/ .el-list-leave-active {
  opacity: 0;
}
/deep/ .el-upload-list {
  height: 40px;
}
</style>