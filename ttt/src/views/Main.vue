<template>
  <div>
    <Header></Header>
    <div style='display:flex'>
      <Aside></Aside>
      <router-view style="flex:1"></router-view><!-- 路由跳转基于此处 -->
    </div>
  </div>
</template>

<script>
import Header from '@/components/Header'
import Aside from '@/components/Aside'
import request from '@/request'

export default {
  name: 'Main',
  components:{
    Header,
    Aside
  },
  created(){
    console.log(this.$store.state.authority.RoleName);
  },
}
</script>

<style>

</style>
