<template>
    <div class="aside">
        <el-menu
        style="width:200px;height:calc(100vh);"
        class="aside-menu"
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
                <el-menu-item index="/course">check_or_edit</el-menu-item>
            </el-submenu>

            <el-submenu index="2" v-if="menu2">
                <template slot="title">
                    <i class="el-icon-edit" ></i>
                    <span >生成表格</span>
                </template>
                <el-menu-item index="/input">generate</el-menu-item>
            </el-submenu>

            <el-submenu index="3" v-if="menu3">
                <template slot="title">
                    <i class="el-icon-user" ></i>
                    <span>用户管理</span>
                </template>
                <el-menu-item index="/userList">user</el-menu-item>
                <el-menu-item>userRole</el-menu-item>
                <el-menu-item index="/userRoleMenu">userRoleMenu</el-menu-item>
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
    },
    created(){
        var RoleList = localStorage.getItem('Role').split(',');
        for (let i=0; i<RoleList.length; i++){
            switch(RoleList[i])
                {
                    case '教学秘书':
                        this.menu1 = true;
                        break;
                    case '任课老师':
                        this.menu1 = true;
                        this.menu2 = true;
                        break;
                    case '课程负责人':
                        this.menu1 = true;
                        this.menu2 = true;
                    case 'super admin':
                        this.menu1 = true;
                        this.menu2 = true;
                        this.menu3 = true;
                        break;
                    default:
                        this.menu1 = false;
                        this.menu2 = false;
                        this.menu3 = false;
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

/deep/ .el-menu-item:focus, .el-menu-item:hover {//二级标题穿透
    background: transparent;
    color: azure;
}

.aside{
    background: linear-gradient(135deg, #8f75da 0, #727cf5 60%);
    min-height: cal(100vh - 100px);
}

.aside .aside-menu {
    /deep/ .el-icon-arrow-down:before {//展开图标穿透
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


.aside .aside-menu {//自定义导航栏样式覆盖
    border-right: solid 1px #e6e6e6;
    list-style: none;
    position: relative;
    margin: 0;
    padding-left: 0;
    background:transparent;
}


.aside .aside-menu .el-submenu{//一级标题穿透
    /deep/ .el-submenu__title{
        background: transparent;
        color:#bdc1dd;
    }
    /deep/ .el-submenu__title:hover i{
        background: transparent;
        color:#ffffff;
    }
    /deep/ .el-submenu__title:hover span{
        background: transparent;
        color:#ffffff;
    }
}
</style>