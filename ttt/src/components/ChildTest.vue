<template>
 <div>
     <h2 :class='getclass'>TEST</h2>
  <button @click='child_run'>调用父组件的方法</button>
  <div>{{hehe}}</div>
 </div>
</template>

<script>
export default {
    name:'Child',
    props: {
        hehe: {
            type: String,
        }
    },
 data() {
  return {
      msg:'child',
      act1:'true',
      act2:'true'
  }
 },
 
 methods: {
     getclass(){
         return {act1: this.act1 ,act2: this.act2};
     },
     child_run(){
         debugger
         this.$emit('run')
     }
 },
}
</script>

<style>
    .act1 {
        color:aquamarine
    }
    .act2{
        color:blueviolet
    }
</style>