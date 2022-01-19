<template>
    <div>
        <el-menu
        style="width:200px; min-height: calc(100vh - 50px);"
        class="el-menu-vertical-demo"
        @open="handleOpen"
        @close="handleClose"
        router
        >
        <el-submenu index="1">
            <template slot="title">
            <i class="el-icon-s-data"></i>
            <span>查看数据</span>
        </template>
            <el-menu-item index="/table">UserData</el-menu-item>
            <el-menu-item >选项2</el-menu-item>
            <el-menu-item index="2-3">选项3</el-menu-item>
        </el-submenu>
        <el-menu-item index="/generate">
            <i class="el-icon-download"></i>
            <span slot="title">生成报表</span>
        </el-menu-item>
        <el-submenu index="3">
            <template slot="title">
            <i class="el-icon-user"></i>
            <span>UserManager</span>
        </template>
            <el-menu-item index="/table">User</el-menu-item>
            <el-menu-item>UserRole</el-menu-item>
            <el-menu-item index="2-3">UserRoleMenu</el-menu-item>

        </el-submenu>
        <el-submenu index="4">
            <template slot="title">
            <i class="el-icon-setting"></i>
            <span>SystemSetting</span>
        </template>
            <el-menu-item index="/table">AdminUser</el-menu-item>
            <el-menu-item>AdminRole</el-menu-item>
            <el-menu-item index="2-3">AdminAuthority</el-menu-item>
        </el-submenu>
        </el-menu>
    </div>
</template>

<script>
export default {
    methods: {
    handleOpen(key, keyPath) {
    console.log(key, keyPath);
    },
    handleClose(key, keyPath) {
    console.log(key, keyPath);
    }
    }
}
</script>

<style scoped>

</style>