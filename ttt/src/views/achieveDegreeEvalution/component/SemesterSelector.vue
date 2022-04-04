<template>
  <div
    style="display:flex;justify-content:flex-start ;flex-direction:row;margin:0px 10px;"
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
      @change="handleSemesterChange()"
    >
      <el-option
        v-for="(semester, i) in semesterList"
        :key="i"
        :label="semester"
        :value="semester"
      >
      </el-option>
    </el-select>
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
