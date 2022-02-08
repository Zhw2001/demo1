<template>
    <div class="home-container">
        <div class="card">
          <div class="card-body" style='width:100%;'>
            <el-form :inline="true" class="demo-form-inline">
              <el-form-item  label="专业:">
                <el-select v-model="major" placeholder="MAJOR">
                  <el-option
                  v-for = "item in Majors"
                  :key = "item.value"
                  :label = "item.label"
                  :value = "item.value">
                  </el-option>
                </el-select>
              </el-form-item>
              <el-form-item  label="课程类型:">
                <el-select v-model="type" placeholder="TYPE" @change = "show_courses">
                  <el-option
                  v-for = "item in courseType"
                  :key = "item.value"
                  :label = "item.label"
                  :value = "item.value">
                  </el-option>
                </el-select>
              </el-form-item>
              <el-form-item>
                <el-button @click="add()" circle icon="el-icon-plus"></el-button>
              </el-form-item>
            </el-form>
          </div>
        </div>

        <div class="card"></div>

        <div class="card">
          <div class="card-body" style='width:100%;'>
            <course @delEmptyRow ="delERow($event)"  :w_lock='wlock' :courseData='CourseData' :visible = 'CourseVisible'></course>
            <experiment @delEmptyRow ="delERow($event)" :w_lock='wlock' :experData='ExperData'  :visible = 'ExperVisble'></experiment>
            <cdesign @delEmptyRow ="delERow($event)" :w_lock='wlock' :cdesignData='CdesigData'  :visible = 'CdesignVisble'></cdesign>
            <gdesign @delEmptyRow ="delERow($event)" :w_lock='wlock' :gdesignData='GdesignData'  :visible = 'GdesignVisble'></gdesign>
          </div>
        </div>
    </div>
</template>

<script>
import request from "@/request";
import course from "./component/course";
import experiment from "./component/experiment";
import cdesign from "./component/cdesign";
import gdesign from "./component/gdesign";

export default {
    name: 'home',
    data() {
      return {
        wlock:true,
        CourseData:[],
        ExperData:[],
        CdesigData:[],
        GdesignData:[],
        CourseVisible:false,
        ExperVisble:false,
        CdesignVisble:false,
        GdesignVisble:false,
        cidList:'',
        courseType: [
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
        type: '课程模板表.xlsx',
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
        major: '计算机系',
      }
    },
    created(){
      this.get_cidList();
      this.load('');
      this.show_courses();
    },
    methods:{
      show_courses(){
        switch (this.type) {
          case '课程模板表.xlsx':
            this.CourseVisible = true;
            this.ExperVisble = false;
            this.CdesignVisble = false;
            this.GdesignVisble = false;
            
            break;
          case '实验模板表.xlsx':
            this.CourseVisible = false;
            this.ExperVisble = true;
            this.CdesignVisble = false;
            this.GdesignVisble = false;
            break;
          case '课程设计模板表.xlsx':
            this.CourseVisible = false;
            this.ExperVisble = false;
            this.CdesignVisble = true;
            this.GdesignVisble = false;
            break;
          case '毕业设计模板表.xlsx':
            this.CourseVisible = false;
            this.ExperVisble = false;
            this.CdesignVisble = false;
            this.GdesignVisble = true;
            break;
            default:
            this.CourseVisible = false;
            this.ExperVisble = false;
            this.CdesignVisble = false;
            this.GdesignVisble = false;
        }
      },
      trans_type(){
        switch (this.type) {
          case '课程模板表.xlsx':
            return 0;
          case '实验模板表.xlsx':
            return 1;
          case '课程设计模板表.xlsx':
            return 2;
          case '毕业设计模板表.xlsx':
            return 3;
          default:
            return 0;
        }
      },
      get_cidList(){
        var cidList = localStorage.getItem('cidList');
        this.cidList = cidList;
      },
      load(dep){
        var thistype=this.trans_type();
        request.get("/api_S/cinfo/list_CD?&cid="+this.cidList+"&dep="+dep).then(
          res=>{
            this.CourseData = [];
            this.ExperData = [];
            this.CdesigData = [];
            this.GdesignData = [];
            for(let i of res.data){
              if(i != null && i.courseList!=null){
                for(let j of i.courseList){
                  j.selected = false;
                  this.CourseData.push(j);
                }
              }

              if(i != null && i.experimentList != null){
                for(let j of i.experimentList){
                  j.selected = false;
                  this.ExperData.push(j);
                } 
              }

              if(i != null && i.cdesignList != null){
                for(let j of i.cdesignList){
                  j.selected = false;
                  this.CdesigData.push(j);
                } 
              }

              if(i != null && i.gdesignList != null){
                for(let j of i.gdesignList){
                    j.selected = false;
                    this.GdesignData.push(j);
                }
              } 
            }
            console.log(this.GdesignData);
          }
        );
      },
      add(){
        switch(this.trans_type(this.type)){
          case 0:
            this.addCourse(this.CourseData);
            break;
          case 1:
            this.addExperData(this.ExperData);
            break;
          case 2:
            this.addCDData(this.CdesigData);
            break;
          case 3:
            this.addGDData(this.GdesignData);
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
        var newCd = new Object;
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
            this.CourseData.pop();
            break;
          case 1:
            this.ExperData.pop();
            break;
          case 2:
            this.CdesigData.pop();
            break;
          case 3:
            this.GdesignData.pop();
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
      'gdesign': gdesign,
    },
    watch:{
        major: function(newMajor,oldMajor){
          this.load(newMajor);
        }
    },
}
</script>

<style scoped>
  .el-button:focus {
    display: inline-block;
    line-height: 1;
    white-space: nowrap;
    cursor: pointer;
    background: #FFF;
    border: 1px solid #DCDFE6;
    color: #606266;
    -webkit-appearance: none;
    text-align: center;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    outline: 0;
    margin: 0;
    -webkit-transition: .1s;
    transition: .1s;
    font-weight: 500;
    font-size: 14px;
    border-radius: 50%;
    padding: 12px;
  }
</style>