<template>
    <div class="home-container">
      <div class = "btnRow" >
        <el-button type='primary' @click="add($event)">新增记录</el-button>
        <div style="display:none" label="专业:">
          <el-select v-model="major" placeholder="MAJOR">
            <el-option
            v-for = "item in Majors"
            :key = "item.value"
            :label = "item.label"
            :value = "item.value">
            </el-option>
          </el-select>
        </div>
          <el-select :value="type" placeholder="TYPE" @change = "handleTypeChange">
            <el-option
            v-for = "item in courseType"
            :key = "item.value"
            :label = "item.label"
            :value = "item.value">
            </el-option>
          </el-select>
      </div>
      
      <div class="card">
        <div class="card-body" style='width:100%;'>
          <component :major="major" :w_lock="wlock" @delEmptyRow ="delERow($event)" :dataList = "dataList" :is = "setView"></component>
        </div>
      </div>
    </div>
</template>

<script>
import course from "../component/course";
import experiment from "../component/experiment";
import cdesign from "../component/cdesign";
import gdesign from "../component/gdesign";

export default {
    name: 'home',
    data() {
      return {
        wlock: true,
        cinfo: {
          ccids: [],
          ecids: [],
          cdcids: [],
          gdcids: []
        },
        dataList: {
          CourseData: [],
          ExperData: [],
          CdesignData: [],
          GdesignData: []
        },
        courseType: [
          {
          value: '0',
          label: '普通课程'
          }, 
          {
            value: '1',
            label: '实验课程'
          }, 
          {
            value: '2',
            label: '课程设计'
          }, 
          {
            value: '3',
            label: '毕业设计'
          }, 
        ],
        type: '0',
        Majors: [
          {
            value: '体育部',
            label: '体育部'
          }, 
          {
            value: '学生处',
            label: '学生处'
          }, 
          {
            value: '教务处',
            label: '教务处'
          }, 
          {
            value: '数学系',
            label: '数学系'
          }, 
          {
            value: '法学院',
            label: '法学院'
          }, 
          {
            value: '管理系',
            label: '管理系'
          }, 
          {
            value: '英语系',
            label: '英语系'
          }, 
          {
            value: '行政系',
            label: '行政系'
          }, 
          {
            value: '计算机系',
            label: '计算机系'
          }, 
        ],
        major: '',
      }
    },
    created(){
      this.get_cidList();
      this.load();
    },
    computed:{
      setView: function () {
        switch (this.type) {
          case '0':
            return 'course'
          case '1':
            return 'experiment'
          case '2':
            return 'cdesign'
          case '3':
            return 'gdesign'
        }
      },
    },
    methods:{
      handleTypeChange(v){
        console.log('type',v)
        this.type = v;
      },
      get_cidList(){
        if( localStorage.getItem('role') ){
          var cids = JSON.parse( localStorage.getItem('role') ).cidList.split(',')
          if(cids == 'ALL'){ return }
          for(let i of cids){
            switch(i.split('_')[0]){
              case 'C':
                this.cinfo.ccids.push(i.split('_')[1])
                break
              case 'E':
                this.cinfo.ecids.push(i.split('_')[1])
                break
              case 'CD':
                this.cinfo.cdcids.push(i.split('_')[1])
                break
              case 'GD':
                this.cinfo.gdcids.push(i.split('_')[1])
                break
              default:
                this.cinfo.ccids.push('')
                this.cinfo.ecids.push('')
                this.cinfo.cdcids.push('')
                this.cinfo.gdcids.push('')
            }
          }
        }
      },
      load(){
        this.$request.post("/api_S/cinfo/list_cid",this.cinfo).then( res=> {
          this.dataList.CourseData = [];
          this.dataList.ExperData = [];
          this.dataList.CdesignData = [];
          this.dataList.GdesignData = [];
          for(let i of res.data){
            if( i.course_type == 0 ){
              this.dataList.CourseData.push(i);
            }

            if( i.course_type == 1 ){
              this.dataList.ExperData.push(i);
            }

            if( i.course_type == 2 ){
              this.dataList.CdesignData.push(i);
            }

            if( i.course_type == 3 ){
              this.dataList.GdesignData.push(i);
            }
          }
          console.log('load finish',this.dataList)
        })
      },
      add(evt){
        this.$setCss.clickHandler(evt)
        switch(parseInt(this.type)){
          case 0:
            this.addCourse(this.dataList.CourseData);
            break;
          case 1:
            this.addExperData(this.dataList.ExperData);
            break;
          case 2:
            this.addCDData(this.dataList.CdesignData);
            break;
          case 3:
            this.addGDData(this.dataList.GdesignData);
            break;
          default:
            return;
        }
        this.wlock = false;
      },
      addCourse(Data){
        if(this.wlock == false){this.$message('请先完成添加');return;}
        var newCourse = new Object;
        newCourse.regular ='';
        newCourse.written ='';
        newCourse.overall = '';
        newCourse.stime = '';
        newCourse.sid = '';
        newCourse.cid = '';
        newCourse.sclass = '';
        newCourse.sstate ='';
        newCourse.sname ='';
        newCourse.cnum = '';
        newCourse.selected=true;
        Data.push(newCourse);
      },
      addExperData(Data){
        if(this.wlock == false){this.$message('请先完成添加');return;}
        var newExper = new Object;
        newExper.cid = '';
        newExper.cnum = '';
        newExper.id = '';
        newExper.overall = '';
        newExper.p1 = '';
        newExper.p2 = '';
        newExper.p3 = '';
        newExper.p4 = '';
        newExper.p5 = '';
        newExper.p6 = '';
        newExper.p7 = '';
        newExper.p8 = '';
        newExper.r1 = '';
        newExper.r2 = '';
        newExper.r3 = '';
        newExper.r4 = '';
        newExper.r5 = '';
        newExper.r6 = '';
        newExper.r7 = '';
        newExper.r8 = '';
        newExper.regular = '';
        newExper.sclass = '';
        newExper.selected = true;
        newExper.sid = '';
        newExper.sname = '';
        newExper.sstate = '';
        newExper.stime = '';
        newExper.written = '';
        Data.push(newExper);
      },
      addCDData(Data){
        if(this.wlock == false){this.$message('请先完成添加');return;}
        var newCd = {}
        newCd.cid = '';
        newCd.cnum = '';
        newCd.id = '';
        newCd.overall = '';
        newCd.regular = '';
        newCd.sclass = '';
        newCd.selected = true;
        newCd.sid = '';
        newCd.sname = '';
        newCd.sstate = '';
        newCd.stime = '';
        newCd.written = '';
        Data.push(newCd);
      },
      addGDData(Data){
        if(this.wlock == false){this.$message('请先完成添加');return;}
        var newGd = new Object;
        newGd.a_1 = '';
        newGd.a_2 = '';
        newGd.a_3 = '';
        newGd.a_4 = '';
        newGd.a_5 = '';
        newGd.a_6 = '';
        newGd.b_1 = '';
        newGd.b_2 = '';
        newGd.b_3 = '';
        newGd.b_4 = '';
        newGd.c_1 = '';
        newGd.c_2 = '';
        newGd.c_3 = '';
        newGd.cid = '';
        newGd.cnum = '';
        newGd.id = '';
        newGd.overall = '';
        newGd.selected = true;
        newGd.sid = '';
        newGd.sname = '';
        newGd.stime = '';
        Data.push(newGd);
      },
      delERow(type){
        switch(type){
          case 0:
            this.dataList.CourseData.pop();
            break;
          case 1:
            this.dataList.ExperData.pop();
            break;
          case 2:
            this.dataList.CdesignData.pop();
            break;
          case 3:
            this.dataList.GdesignData.pop();
            break;
          default:
            return;
        }
        this.wlock = true;
      },
    },
    components: {
      'course': course,
      'experiment':experiment,
      'cdesign': cdesign,
      'gdesign': gdesign
    },
}
</script>

<style scoped>

</style>