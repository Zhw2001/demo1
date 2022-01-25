<template>
    <div>
        <el-menu
        style="width:200px; min-height: calc(100vh - 50px);"
        class="el-menu-vertical-demo"
        @open="handleOpen"
        @close="handleClose"
        router
        >
            <el-submenu index="1" v-if="menu1">
                <template slot="title">
                    <i class="el-icon-data-analysis"></i>
                    <span>查看数据</span>
                </template>
                <el-menu-item index="/table">UserData</el-menu-item>
            </el-submenu>

            <el-submenu index="2" v-if="menu2">
                <template slot="title">
                    <i class="el-icon-edit"></i>
                    <span>生成表格</span>
                </template>
                <el-menu-item index="/input">Generate</el-menu-item>
            </el-submenu>

            <el-submenu index="3" v-if="menu3">
                <template slot="title">
                    <i class="el-icon-user"></i>
                    <span>用户管理</span>
                </template>
                <el-menu-item index="3-1">User</el-menu-item>
                <el-menu-item>UserRole</el-menu-item>
                <el-menu-item index="3-3">UserRoleMenu</el-menu-item>
            </el-submenu>

            <el-submenu index="4" v-if="menu4">
                <template slot="title">
                    <i class="el-icon-setting"></i>
                    <span>系统管理</span>
                </template>
                <el-menu-item index="4-1">AdminUser</el-menu-item>
                <el-menu-item>AdminRole</el-menu-item>
                <el-menu-item index="4-3">AdminAuthority</el-menu-item>
            </el-submenu>

        </el-menu>
    </div>
</template>

<script>
export default {
    data(){
        return{
            menu1:'',
            menu2:'',
            menu3:'',
            menu4:'',
        }
    },
    methods: {
        handleOpen(key, keyPath) {
         console.log(key, keyPath);
        },
        handleClose(key, keyPath) {
         console.log(key, keyPath);
        }
    },
    created(){
        var NameList = sessionStorage.getItem('MenuName').split(',');
        for (var i=0; i<NameList.length; i++){
            switch(NameList[i])
                {
                    case '查看数据':
                        this.menu1 = true;
                        break;
                    case '生成表格':
                        this.menu2 = true;
                        break;
                    case '用户管理':
                        this.menu3 = true;
                    break;
                    case '系统管理':
                        this.menu4 = true;
                    break;
                }
        }
    },

}
</script>

<style scoped>

</style>