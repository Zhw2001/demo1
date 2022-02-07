<template>
    <div :class="classObject">
        <el-menu
        class="aside-menu"
        router
        >
            <div class="logo-div">
                <span class="logo-text">website</span>
            </div>
            <el-submenu index="1" v-if="menu1" >
                <template slot="title">
                    <i class="el-icon-data-analysis" ></i>
                    <span>查看数据</span>
                </template>
                <el-menu-item  index="/course"><span>check_or_edit</span></el-menu-item>
            </el-submenu>

            <el-submenu index="2" v-if="menu2">
                <template slot="title">
                    <i class="el-icon-edit" ></i>
                    <span >生成表格</span>
                </template>
                <el-menu-item index="/input"><span>generate</span></el-menu-item>
            </el-submenu>

            <el-submenu index="3" v-if="menu3">
                <template slot="title">
                    <i class="el-icon-user" ></i>
                    <span>用户管理</span>
                </template>
                <el-menu-item index="/user"><span>user</span></el-menu-item>
                <el-menu-item><span>userRole</span></el-menu-item>
                <el-menu-item index="/userRoleMenu"><span>userRoleMenu</span></el-menu-item>
            </el-submenu>


        </el-menu>
    </div>
</template>

<script>
export default {
    props:{
        clicked:Boolean,
    },
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
    computed: {
        classObject: function () {
            return {
                'aside': !this.clicked,
                'aside_click': this.clicked,
            }
        },
    }
}

</script>

<style lang="less" scoped>



.aside{
    flex: 0 0 256px;
    background: linear-gradient(135deg, #8f75da 0, #727cf5 60%);
}

.aside .aside-menu {
    /deep/ .el-icon-arrow-down {//展开图标穿透
        content: "\E6DF";
        color: azure;
    }
    /deep/ .el-icon-arrow-down:hover {//展开图标穿透
        background: transparent;
        color:#f5a5a5;
    }
}
.aside .aside-menu .logo-div{
    height:70px;
    padding-left:30px;
    line-height:70px;
    display:flex;
}
.aside .aside-menu .logo-div .logo-text {
    font-size: 24px;
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
    }
    /deep/ .el-submenu__title span{
        color:#ffffff;
    }
    /deep/ .el-submenu__title i{
        color:#ffffff;
    }
    /deep/ .el-submenu__title:hover i{
        color:#f5a5a5;
    }
    /deep/ .el-submenu__title:hover span{
        color:#f5a5a5;
    }
}

.aside .aside-menu .el-submenu{//二级标题穿透
    /deep/ .el-menu{//ul
        background: transparent;
    }
    /deep/ .el-menu :hover{
        background: transparent;
    }

    /deep/ .el-menu .el-menu-item{//li
        background: transparent;
    }
    /deep/ .el-menu .el-menu-item :hover{
        background: transparent;
    }

    /deep/ .el-menu .el-menu-item span{
        color:#bdc1dd;
    }
    /deep/ .el-menu .el-menu-item:hover span{
        color:#ffffff;
    }
}



.aside_click{
    flex: 0 0 80px;
    background: linear-gradient(135deg, #8f75da 0, #727cf5 60%);
}

.aside_click .aside-menu {
    /deep/ .el-icon-arrow-down {//展开图标穿透
        display: none;
    }
}
.aside_click .aside-menu .logo-div{
    height:70px;
    padding-left:30px;
    line-height:70px;
    display:flex;
}
.aside_click .aside-menu .logo-div .logo-text {
    font-size: 12px;
    font-weight: 500;
    display: inline-block;
    vertical-align: middle;
    color: #ffffff;
}


.aside_click .aside-menu {//自定义导航栏样式覆盖
    border-right: solid 1px #e6e6e6;
    list-style: none;
    position: relative;
    margin: 0;
    padding-left: 0;
    background:transparent;
}

.aside_click .aside-menu .el-submenu{//一级标题穿透
    /deep/ .el-submenu__title{
        background: transparent;
        text-align: center;
    }
    /deep/ .el-submenu__title i{
        background: transparent;
        color:#ffffff;
    }
    /deep/ .el-submenu__title:hover i{
        color:#f5a5a5;
    }
    /deep/ .el-submenu__title span{
        display: none;
    }
}

.aside_click .aside-menu .el-submenu{//二级标题穿透
    /deep/ .el-menu{
        display: none;
    }
}



</style>