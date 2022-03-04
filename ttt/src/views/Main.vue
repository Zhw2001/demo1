<template>
  <div class="main">
    <Aside :clicked="clicked"></Aside>
    <div class="wall-paper">
      <Header :clicked="clicked" @fold="fold($event)"></Header>
      <div style="display:flex;flex-direction:column;justify-content:space-around;">
      <el-breadcrumb style="padding:20px 20px 0px 20px;flex: 1 1 auto;" separator="/">
        <el-breadcrumb-item :to="{ path: '/' }"><i class="el-icon-s-home"></i></el-breadcrumb-item>
      </el-breadcrumb>
      <router-view style="flex:1 1 auto;"></router-view><!-- 路由跳转基于此处 -->
      </div>
    </div>
  </div>
</template>


<script>
import Header from "@/components/Header";
import Aside from "@/components/Aside";

export default {
  name: "Main",
  data() {
    return {
      clicked: false,
    };
  },
  created() {
  },
  components: {
    Header,
    Aside
  },
  methods: {
    fold(c) {
      this.clicked = c;
    }
  }
};
</script>

<style scoped>
</style>
