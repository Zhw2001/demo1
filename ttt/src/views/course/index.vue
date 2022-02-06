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
            </el-form>
            <course  :courseData='CourseData' :visible = 'CourseVisible'></course>
            <experiment  :experData='ExperData'  :visible = 'ExperVisble'></experiment>
            <cdesign  :cdesignData='CdesigData'  :visible = 'CdesignVisble'></cdesign>
            <gdesign :gdesignData='GdesignData'  :visible = 'GdesignVisble'></gdesign>
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
        type: '',
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

</style>