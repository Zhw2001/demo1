<template>
    <div class="home-container">
        <div style="margin: 10px 0">
          <el-form :inline="true" class="demo-form-inline">
            <el-form-item label="课程类型:">
                <el-select v-model="value" placeholder="TYPE">
                  <el-option
                  v-for="item in options"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                  </el-option>
                </el-select>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="show_template"><i class="el-icon-search"></i></el-button>
            </el-form-item>
            <el-form-item >
                <el-button type="primary" @click="download_template_xlsx"><i class="el-icon-download"></i><span>模板</span></el-button>
            </el-form-item>
            <el-form-item >
                <el-button type="primary" @click="download_template_xlsx"><i class="el-icon-thumb"></i><span>表格生成</span></el-button>
            </el-form-item>
          </el-form>
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
        </el-table>
        <div style="margin: 10px 0">
            <el-form :inline="true" class="demo-form-inline">
              <el-form-item>
                <el-upload
                  class="upload-demo"
                  ref="upload"
                  action="/api_S/files/upload"
                  :on-preview="handlePreview"
                  :on-change="fileChange"
                  :before-remove="beforeRemove"
                  :file-list="fileList"
                  :auto-upload="false">
                  <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
                  <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload">上传到服务器</el-button>
                  <div slot="tip" class="el-upload__tip">只能上传xlsx/doc文件，且不超过500kb</div>
                </el-upload>
              </el-form-item>
            </el-form>
        </div>
    </div>
</template>

<script>
import request from "@/request";
import global from '@/components/Global';

  export default {

    data() {
      return {
        fileList: [],
        options: [
          {
          value: '课程模板表.xlsx',
          label: '普通课程'
          }, 
          {
            value: '实验模板表.xlsx',
            label: '实验课程'
          }, 
          {
            value: '课程设计模板表.xlsx',
            label: '课程设计'
          }, 
          {
            value: '毕业设计模板表.xlsx',
            label: '毕业设计'
          }, 
        ],
        value: '',
        tableData:[],
      }
    },
    methods: {

      //展示模板
      show_template(){
        switch (this.value) {
          case '课程模板表.xlsx':

              break;
          case '实验模板表.xlsx':

              break;
          case '课程设计模板表.xlsx':

              break;
          case '毕业设计模板表.xlsx':

              break;
        } 
      },

      //下载模板
      download_template_xlsx(){
        request.get("/api_S/files/get_port").then(res=>{
          let port = res.data;
          let url = global.ip+port+"/files/"+this.value;
          this.$alert(url, '下载链接');
        });
      },


      //上传
      submitUpload() {
        this.$refs.upload.submit();
      },
      beforeRemove(file, fileList) {
        return this.$confirm(`确定移除 ${ file.name }？`);
      },
      handlePreview(file) {
        console.log(file);//上传完成打印文件信息
      },
      fileChange(file, fileList){
        this.dataList = fileList
      },
    }
  }
</script>

<style scoped>
.home-container {
    padding: 10px;
    padding-top: 5px;
}
</style>