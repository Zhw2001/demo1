<template>
    <div class="aside">
        <el-menu
        style="width:200px;height:calc(100vh);"
        class="aside-menu"
        @open="handleOpen"
        @close="handleClose"
        router
        >
            <div class="logo-div">
                <span class="logo-text">website</span>
            </div>
            <el-submenu index="1" v-if="menu1" >
                <template slot="title">
                    <i class="el-icon-data-analysis" ></i>
                    <span >查看数据</span>
                </template>
                <el-menu-item index="1-1">Course</el-menu-item>
            </el-submenu>

            <el-submenu index="2" v-if="menu2">
                <template slot="title">
                    <i class="el-icon-edit" ></i>
                    <span >生成表格</span>
                </template>
                <el-menu-item index="/input">Generate</el-menu-item>
            </el-submenu>

            <el-submenu index="3" v-if="menu3">
                <template slot="title">
                    <i class="el-icon-user" ></i>
                    <span>用户管理</span>
                </template>
                <el-menu-item index="/table">User</el-menu-item>
                <el-menu-item>UserRole</el-menu-item>
                <el-menu-item index="3-3">UserRoleMenu</el-menu-item>
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
        console.log(localStorage.getItem('MenuName'));
        var NameList = localStorage.getItem('MenuName').split(',');
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
                }
        }
    },

}
</script>

<style lang="less" scoped>


/deep/ .el-menu{
    background-color: transparent;
}

/deep/ .el-menu-item{
    color:#bdc1dd;
}

/deep/ .el-menu-item:focus, .el-menu-item:hover {
    background: transparent;
    color: azure;
}


.aside .aside-menu {
    /deep/ .el-icon-arrow-down:before {
        content: "\E6DF";
        color: azure;
    }
}
.aside .aside-menu .logo-div{
    height:70px;
    padding-left:30px;
    line-height:70px;
    display:flex;
}
.aside .aside-menu .logo-div .logo-text {
    font-size: 18px;
    font-weight: 500;
    display: inline-block;
    vertical-align: middle;
    color: #ffffff;
}


.aside .aside-menu {
    border-right: solid 1px #e6e6e6;
    list-style: none;
    position: relative;
    margin: 0;
    padding-left: 0;
    background:transparent;
}


.aside .aside-menu .el-submenu{
    /deep/ .el-submenu__title{
        background: transparent;
        color:#bdc1dd;
    }
    /deep/ .el-submenu__title:hover{
        background: transparent;
        color:#ffffff;
    }
}
</style>