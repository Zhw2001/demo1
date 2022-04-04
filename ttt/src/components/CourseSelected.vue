<template>
  <div
    style="display:flex;justify-content:flex-start ;flex-direction:row;"
  >
    <span
      style="font-size:0.8vw;flex:0 1 auto;line-height:1.8vw;margin:0px 10px;"
      >当前选则的课程:</span
    >
    <el-tag effect="plain" style="font-size:0.8vw;flex:0 1 auto;line-height:1.8vw;margin:0vw 0.5vw 0vw 0vw;">{{my_course}}</el-tag>
    <div class = "btnRow" style="flex:0 1 auto;margin:0px 10px;">
      <el-button
        type="primary"
        v-if="this.$route.path !== '/myCourseList'"
        size="small"
        @click="handleCourseChange()"
        >切换课程</el-button
      >
    </div>
  </div>
</template>

<script>

export default {
  name:'CourseSelected',
  props: {
    course: String
  },

  data(){
    return{
      my_course:''
    }
  },
  methods: {
    handleCourseChange() {
      this.$router.push("/myCourseList");
    },
  },
  created(){
    this.my_course = this.course
  },
  watch: {
    course: function (val) {
      this.my_course = val
    }
  }
}
</script>

<style scoped>

</style>
