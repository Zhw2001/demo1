<template>
  <div class='main'>
    <Aside :clicked = 'clicked'></Aside>
    <div class="wall-paper">
      <Header :clicked = 'clicked' @fold = "fold($event)"></Header>
      <router-view style="min-height:calc(100% - 70px);"></router-view><!-- 路由跳转基于此处 -->
    </div>
  </div>
</template>


<script>
import Header from '@/components/Header'
import Aside from '@/components/Aside'

export default {
  name: 'Main',
  data(){
    return{
      clicked:false,
    }
  },
  components:{
    Header,
    Aside,
  },
  methods:{
    fold(c){
      this.clicked = c;
    }
  },
}
</script>

<style scoped>

</style>
