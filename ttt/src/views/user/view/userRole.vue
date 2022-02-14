<template>
  <div class="home-container">
      <div class = "btnRow" ><el-button type='primary' @click="show">添加用户</el-button></div>
      <div class="card">
        <div class="card-body">
            <el-table
            :fit = "true"
            stripe
            :header-cell-style = "mytable"
            :cell-style = "mytableCell"
            :data="tableData"
            :default-sort = "{prop: 'id', order: 'ascending'}"
            @select="Select"
            @select-all = "SelectAll">

            <el-table-column
              type="selection"
            >
            </el-table-column>

            <el-table-column
            label="序号"
            prop="id"
            sortable>
            </el-table-column>

            <el-table-column
            prop=""
            label="角色名">
            </el-table-column>

            <el-table-column
            prop="nickname"
            label="角色介绍">
            </el-table-column>    

            <el-table-column
            prop="email"
            label="负责的课程">
            </el-table-column>

            <el-table-column
            label="操作">
            </el-table-column>

          </el-table>
        </div>
      </div>
  </div>
</template>

<script>
export default {

}
</script>

<style scoped>

</style>