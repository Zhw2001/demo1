<template>
  <div style="display:flex; flex-direction:row;">
      <Aside></Aside>
    <div style="min-width:1336px;">
      <Header></Header>
      <router-view style="min-height:800px;background:rgb(238 238 238);"></router-view><!-- 路由跳转基于此处 -->
    </div>
  </div>
</template>


<script>
import Header from '@/components/Header'
import Aside from '@/components/Aside'


export default {
  name: 'Main',
  components:{
    Header,
    Aside,
  },
  methods:{
  },
}
</script>

<style scoped>

</style>
