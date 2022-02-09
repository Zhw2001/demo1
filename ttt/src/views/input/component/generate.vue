<template>
    <div v-if='setvis'>
            <div style="text-align:center;margin-bottom:30px;">
            <el-button><i class="el-icon-thumb"><span>一键生成</span></i></el-button>
            </div>
            <el-button @click = 'back()'>上一页</el-button>
            <el-button @click = 'next()'>返回</el-button>
    </div>
</template>

<script>
import request from "@/request";
import global from '@/components/Global';

  export default {
    name:'generate',

    props:{
      vis : Boolean,
    },

    data() {
      return {
       
      }
    },



    methods: {

     
      mytable(){
        return 'background-color:#f1f3fa; color:rgba(0, 0, 0, 0.85);font-weight: 500;text-align:center;'
      },
      mytableCell(){
        return 'text-align:center;'
      },

      back() {
        this.$emit("back",'cd','g');
      },
      next(){
        this.$emit("next",'home','g');
      }

    },

    computed: {
      setvis: function () {
          return this.vis;
      },
    },
    
  }
</script>

<style scoped>

</style>