<template>
    <div class="home-container">
        <div style="margin: 10px 0">
            <el-form :inline="true" :model="formInline" class="demo-form-inline">
            <el-form-item label="填写人">
                <el-input v-model="formInline.user" placeholder="填写人"></el-input>
            </el-form-item>
            <el-form-item label="负责课程类型">
                <el-select v-model="formInline.region" placeholder="TYPE">
                <el-option label="理论课" value="l"></el-option>
                <el-option label="实验课" value="s"></el-option>
                <el-option label="课程设计" value="k"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="onSubmit"><i class="el-icon-search"></i></el-button>
            </el-form-item>
            <el-form-item style="margin-left: 850px;" label="下载模板">
                <el-button type="primary" @click="onSubmit"><i class="el-icon-download"></i></el-button>
            </el-form-item>
            </el-form>
        </div>
        <div></div>
        <el-table       
            :data="tableData"
            border
            style="width: 100%"
            :default-sort = "{prop: 'id', order: 'descending'}"
        >
            <el-table-column
            type="index"
            label="ID"
            sortable>
            </el-table-column>
            <el-table-column
            prop="account"
            label="账户">
            </el-table-column>
            <el-table-column
            prop="nickname"
            label="昵称">
            </el-table-column>
            <el-table-column
            prop="admin_role_ids"
            label="角色组">  
            </el-table-column>          
            <el-table-column
            prop="email"
            label="邮箱">
            </el-table-column>
            <el-table-column
            prop="phone"
            label="手机">
            </el-table-column>
            <el-table-column
            prop="enable"
            label="是否启用">
            </el-table-column>
            <el-table-column width="180" align="center" label="操作">
                <template slot-scope="scope">
                    <el-button
                    size="mini"
                    @click="handleEdit(scope.row)">编辑</el-button>
                    <el-button
                    size="mini"
                    type="danger"
                    @click="handleDelete(scope.$index,scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>

    </div>
</template>

<script>
  export default {
    data() {
      return {
        formInline: {
          user: '',
          region: ''
        }
      }
    },
    methods: {
      onSubmit() {
        console.log('submit!');
      }
    }
  }
</script>

<style scoped>
.home-container {
    padding: 10px;
    padding-top: 5px;
}
</style>