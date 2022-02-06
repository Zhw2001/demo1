<template>
    <div class="home-container">
        <div class="card">
          <div class="card-body">
            <el-button v-if = 'ButtonVis' type="primary" @click="showExam"><i class="el-icon-thumb"></i><span>考试/考查审查表生成</span></el-button>
            <exam-audit :vis = 'setvis'  @close = "closeExam($event)" ></exam-audit>
          </div>
        </div>
        
    </div>
</template>

<script>
import request from "@/request";
import global from '@/components/Global';
import examAudit from './component/examAudit';

  export default {

    data() {
      return {
        Vislock:true,//三个页面只能显示一个
        ButtonVis:true,//按钮和页面只能显示其一
      }
    },
    methods: {
      closeExam(){
        this.ButtonVis = true;
        this.Vislock = true;
      },
      showExam(){
        this.ButtonVis = false;
      }
    },
    components: {
      'exam-audit':examAudit,
    },

    computed:{
      setvis: function(){
        if(!this.ButtonVis && this.Vislock){return true;}
        return false;
      }
    }
  }
</script>

<style scoped>

</style>