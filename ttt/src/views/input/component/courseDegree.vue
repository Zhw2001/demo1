<template>
    <div v-if = 'setvis' class="home-container">
        <div class="card">
          <div class="card-body">
          <el-button @click = 'back()'>上一页</el-button>
          <el-button @click = 'next()'>下一页</el-button>
          </div>
        </div>
        
    </div>
</template>

<script>
import request from "@/request";
import global from '@/components/Global';

export default {
  name:'courseDegree',
  
  props:{
    vis : Boolean,
  },
  data() {
    return {
    }
  },
  methods: {
    back() {
      this.$emit("back",'ea','cd');
    },
    next(){
      this.$emit("next",'g','cd');
    },

    mytable(){
      return 'background-color:#f1f3fa; color:rgba(0, 0, 0, 0.85);font-weight: 500;text-align:center;'
    },
    mytableCell(){
      return 'text-align:center;'
    },

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