<template>
  <div class="home-container">
    <div class="card">
      <div class="card-body">
        <semester-selector v-if="divVis" @semesterChange = "handleSemesterChange($event)" :semesterList = semesterList :semester = semester></semester-selector>
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
import SemesterSelector from "../component/SemesterSelector.vue"

export default {
  name: "generate",
  components: {
    'semester-selector': SemesterSelector,
  },
  data() {
    return {
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
        message: "未选择课程"
      });
      this.$router.push("/");
    } else {
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
        let blob = new Blob([res], { type: "application/vnd.ms-excel" }); // 获取服务端返回的文件流excel文件
        let fileName = `成绩明细${new Date().getTime()}.xls`; // 保存的文件名
        this.downLoadFile(blob, fileName);
      });
    },
    dSSend(params) {
      const config = {
        headers: {
          "Content-Type": "multipart/form-data"
        }
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
        let blob = new Blob([res], { type: "application/vnd.ms-excel" }); // 获取服务端返回的文件流excel文件
        let fileName = `成绩模板${new Date().getTime()}.xls`; // 保存的文件名
        this.downLoadFile(blob, fileName);
      });
    },
    dTSend(params) {
      const config = {
        headers: {
          "Content-Type": "multipart/form-data"
        }
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
      if (window.navigator.msSaveOrOpenBlob) {
        // IE10
        navigator.msSaveBlob(blob, fileName);
      } else {
        let link = document.createElement("a");
        link.style.display = "none";
        link.href = URL.createObjectURL(blob); //创建一个指向该参数对象的URL
        link.download = fileName;
        link.click(); // 触发下载
        URL.revokeObjectURL(link.href); // 释放通过 URL.createObjectURL() 创建的 URL
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
      this.downloadTemplate()
    },


    //上传
    submitUpload() {
      this.$refs.upload.submit();
    },
    httpRequest(param) {
      let fileObj = param.file; // 相当于input里取得的files
      let fd = new FormData(); // FormData 对象
      fd.append("excelFile", fileObj); // 文件对象
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