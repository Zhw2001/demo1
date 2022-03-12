<template>
  <div
    style="display:flex;justify-content:flex-start ;flex-direction:row;"
  >
    <span
      style="font-size:0.8vw;flex:0 1 auto;line-height:1.8vw;margin:0px 10px;"
      >学年学期:</span
    >
    <el-select
      style="flex:0 1 auto;"
      size="small"
      v-model="mySem"
      placeholder="请选择学期"
    >
      <el-option
        v-for="(semester, i) in semesterList"
        :key="i"
        :label="semester"
        :value="semester"
      >
      </el-option>
    </el-select>
    <el-button
      size="small"
      style="flex:0 1 auto;margin:0px 10px;"
      @click="handleSemesterChange()"
      >切换学期</el-button
    >
  </div>
</template>

<script>

export default {
  name:'SemesterSelector',
  props: {
    semesterList: Array,
    semester: String
  },

  data(){
    return{
      mySem:''
    }
  },
  methods: {
    handleSemesterChange(){
      this.$emit("semesterChange", this.mySem);
    }
  },
  created(){
    this.mySem = this.semester
  }
}
</script>

<style scoped>

</style>
