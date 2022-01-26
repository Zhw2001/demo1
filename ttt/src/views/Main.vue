<template>
  <div style="display:flex; flex-direction:row;">
      <Aside style="background: linear-gradient(135deg, #8f75da 0, #727cf5 60%);"></Aside>
    <div style="width:90%;">
      <Header></Header>
      <router-view style="flex:1;background:#fafbfe;height:calc(100vh);"></router-view><!-- 路由跳转基于此处 -->
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

<style>

</style>
