<template>
    <div class="home-container">
        <div class="card">
          <div class="card-body">
            <div class="mydiv">
              <span>第一步：下载课程模板表格，填写数据</span>
              <div><el-button @click="showModel()" round><i class='el-icon-thumb'></i></el-button></div>
            </div>


            <div class="mydiv">
              <span>第二步：上传填写完成的表格</span>
              <div>
                <el-form>
                  <el-form-item>
                    <el-upload
                      class="upload-demo"
                      ref="upload"
                      action="/api_P/files/upload"
                      :on-preview="handlePreview"
                      :on-change="fileChange"
                      :before-remove="beforeRemove"
                      :file-list="fileList"
                      :auto-upload="false">
                      <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
                      <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload">上传</el-button>
                    </el-upload>
                  </el-form-item>
                </el-form>
              </div>
            </div>

            <el-dialog
            title="选择填写的课程"
            :visible.sync = 'ModelVis'
            width="80%">
              <el-form :inline="true">
                <el-form-item  label="课程类型:">
                    <el-select v-model="value" placeholder="TYPE" @change = "show_template">
                      <el-option
                      v-for = "item in options"
                      :key = "item.value"
                      :label = "item.label"
                      :value = "item.value">
                      </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="download_template_xlsx"><i class="el-icon-download"></i><span>表格模板</span></el-button>
                </el-form-item>
                <div>
                  <el-table       
                      :header-cell-style = "mytable"
                      :cell-style = "mytableCell"
                      :data="tableData1"
                      v-if = "table1">
                      <el-table-column
                        prop="sTime"
                        label="sTime"
                        align="center">
                        </el-table-column>
                        <el-table-column
                        prop="cId"
                        label="cId"
                        align="center">
                        </el-table-column>
                        <el-table-column
                        prop="cNum"
                        label="cNum"
                        align="center">
                        </el-table-column>
                        <el-table-column
                        prop="sId"
                        label="sId">
                        </el-table-column>
                        <el-table-column
                        prop="sName"
                        label="sName"
                        align="center">  
                        </el-table-column>          
                        <el-table-column
                        prop="sClass"
                        label="sClass"
                        align="center">
                        </el-table-column>
                        <el-table-column
                        prop="sState"
                        label="sState"
                        align="center">
                        </el-table-column>
                        <el-table-column
                        prop="regular"
                        label="regular"
                        align="center">
                        </el-table-column>
                        <el-table-column
                        prop="written"
                        label="written"
                        align="center">
                        </el-table-column>
                        <el-table-column
                        prop="overall"
                        label="overall"
                        align="center">
                        </el-table-column>
                  </el-table>

                  <el-table       
                    :header-cell-style = "mytable"
                    :cell-style = "mytableCell"
                    :data="tableData2"
                    v-if = "table2"
                    size='mini'
                    >
                    <el-table-column
                    prop="sTime"
                    label="sTime">
                    </el-table-column>
                    <el-table-column
                    prop="cId"
                    label="cId">
                    </el-table-column>
                    <el-table-column
                    prop="cNum"
                    label="cNum"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="sId"
                    label="sId">
                    </el-table-column>
                    <el-table-column
                    prop="sName"
                    label="sName"
                    align="center">  
                    </el-table-column>          
                    <el-table-column
                    prop="sClass"
                    label="sClass"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="sState"
                    label="sState"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="p1"
                    label="p1"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="r1"
                    label="r1"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    label="...">
                    </el-table-column>
                                  <el-table-column
                    prop="p8"
                    label="p8">
                    </el-table-column>
                                  <el-table-column
                    prop="t8"
                    label="t8">
                    </el-table-column>
                                  <el-table-column
                    prop="regular"
                    label="regular">
                    </el-table-column>
                                  <el-table-column
                    prop="written"
                    label="written">
                    </el-table-column>
                                  <el-table-column
                    prop="overall"
                    label="overall">
                    </el-table-column>
                  </el-table>

                  <el-table       
                    :header-cell-style = "mytable"
                    :cell-style = "mytableCell"
                    :data="tableData3"
                    v-if = "table3">
                    <el-table-column
                    prop="sTime"
                    label="sTime"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="cId"
                    label="cId"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="cNum"
                    label="cNum"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="sId"
                    label="sId">
                    </el-table-column>
                    <el-table-column
                    prop="sName"
                    label="sName"
                    align="center">  
                    </el-table-column>          
                    <el-table-column
                    prop="sClass"
                    label="sClass"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="sState"
                    label="sState"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="select"
                    label="select"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="begin"
                    label="begin"
                    align="center">
                    </el-table-column> 
                    <el-table-column
                    prop="medium"
                    label="medium"
                    align="center">
                    </el-table-column>   
                    <el-table-column
                    prop="program"
                    label="program"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="answer"
                    label="answer"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="report"
                    label="report"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="overall"
                    label="overall"
                    align="center">
                    </el-table-column>
                  </el-table>

                  <el-table       
                    :header-cell-style = "mytable"
                    :cell-style = "mytableCell"
                    :data="tableData4"
                    v-if = "table4">
                    <el-table-column
                    prop="sTime"
                    label="sTime"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="cId"
                    label="cId"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="cNum"
                    label="cNum"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="sId"
                    label="sId">
                    </el-table-column>
                    <el-table-column
                    prop="sName"
                    label="sName"
                    align="center">  
                    </el-table-column>          
                    <el-table-column
                    prop="1-1"
                    label="1-1"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="1-2"
                    label="1-2"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    label="..."
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="3-3"
                    label="3-3"
                    align="center">
                    </el-table-column>
                    <el-table-column
                    prop="overall"
                    label="overall"
                    align="center">
                    </el-table-column>
                  </el-table>
                </div>
              </el-form>
            </el-dialog> 

          </div>
        </div>
        
    </div>
</template>

<script>
import global from '@/components/Global';

  export default {
    name:'generate',

    data() {
      return {
        ModelVis:false,
        table1:'',
        table2:'',
        table3:'',
        table4:'',
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
        tableData1:[
          {sTime:'2018-2019-1', cId:'XX110100', cNum:'01', sId:'201410111355', sName:'刘平东', sClass:'计算机162', sState:'正常', regular:'90', written:'90', overall:'90'},
        ],
        tableData2:[
          {sTime:'2018-2019-1', cId:'XX110100', cNum:'01', sId:'201410111355', sName:'刘平东', sClass:'计算机162', sState:'正常', p1:'3', r1:'9', p8:'3.5',t8:'8', regular:'90', written:'90', overall:'90'},
        ],
        tableData3:[
           {sTime:'2018-2019-1', cId:'XX110100', cNum:'01', sId:'201410111355', sName:'刘平东', sClass:'计算机162', sState:'正常', select:'14', begin:'8', medium:'15', program:'18', answer:'17', report:'18', overall:'90'},
        ],
        tableData4:[
           {sTime:'2018-2019-1', cId:'XX127130', cNum:'01', sId:'201510121066', sName:'徐盛', '1-1':'4', '1-2':'4', '3-3':'8.2', overall:'90'},
        ],
      }
    },



    methods: {

      showModel(){
        this.ModelVis = true;
      },

      //展示模板
      show_template(){
        switch (this.value) {
          case '课程模板表.xlsx':
            this.table1 = true;
            this.table2 = false;
            this.table3 = false;
            this.table4 = false;
            
            break;
          case '实验模板表.xlsx':
            this.table1 = false;
            this.table2 = true;
            this.table3 = false;
            this.table4 = false;
            break;
          case '课程设计模板表.xlsx':
            this.table1 = false;
            this.table2 = false;
            this.table3 = true;
            this.table4 = false;
            break;
          case '毕业设计模板表.xlsx':
            this.table1 = false;
            this.table2 = false;
            this.table3 = false;
            this.table4 = true;
            break;
            default:
            this.table1 = false;
            this.table2 = false;
            this.table3 = false;
            this.table4 = false;
        } 
      },

      //下载模板
      download_template_xlsx(){
        this.$request.get("/api_S/files/get_port").then(res=>{
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
        this.fileList = fileList
      },

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
.mydiv{
  text-align:center;
}

.mydiv span{
  font-size:30px;
}

.mydiv div{
  margin-top:20px;
}


</style>