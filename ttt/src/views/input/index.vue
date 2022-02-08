<template>
    <div class="home-container">
        <div class="card">
          <div class="card-body">
            <el-button v-if = 'homeVis' type="primary" @click="nextPage(['ea','home'])"><i class="el-icon-thumb"></i><span>考试/考查审查表生成</span></el-button>
            <exam-audit :vis = 'eaVis' @next='nextPage(arguments)' @back = 'nextPage(arguments)' ></exam-audit>
            <course-degree :vis = 'cdVis'  @next='nextPage(arguments)' @back = 'nextPage(arguments)' ></course-degree>
            <generate :vis = 'gVis'  @next='nextPage(arguments)' @back = 'nextPage(arguments)'></generate>
          </div>
        </div>
        
    </div>
</template>

<script>
import request from "@/request";
import global from '@/components/Global';
import examAudit from './component/examAudit';
import courseDegree from './component/courseDegree';
import generate from './component/generate.vue';
import Gdesign from '../course/component/gdesign.vue';

export default {

  data() {
    return {
      homeVis:true,
      cdVis:false,
      eaVis:false,
      gVis:false,
    }
  },
  methods: {
    nextPage(pages){
      switch(pages[1]){
        case 'ea':
          this.eaVis = false;
          break;
        case 'cd':
          this.cdVis = false;
          break;
        case 'g':
          this.gVis = false;
          break;
        case 'home':
          this.homeVis = false;
      }

      switch(pages[0]){
        case 'ea':
          this.eaVis = true;
          break;
        case 'cd':
          this.cdVis = true;
          break;
        case 'g':
          this.gVis = true;
          break;
        case 'home':
          this.homeVis = true;
      }
      
    },

  },
  components: {
    'exam-audit':examAudit,
    'course-degree':courseDegree,
    'generate':generate,
    Gdesign,
  },



}
</script>

<style scoped>

</style>