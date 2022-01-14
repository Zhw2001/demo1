<template>
 <div >
   <Child @run='run' :hehe="hehe" ref="child"></Child>
 </div>
</template>
 
<script>
// 1.引入子组件
import ChildTest from './ChildTest.vue';
 
export default {
    name:"Father",
    components: {
    "Child": ChildTest
  },
 data() {
  return {
   msg: '我是一个组件',
   hehe: 'xx'
  }
 },
 methods: {
  run() {
   alert(this.msg);
   console.log(this.$ref.child)
  }
 },
 // 页面刷新时请求数据
 mounted() {
 }
}
</script>