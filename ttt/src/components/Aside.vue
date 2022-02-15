<template>
    <div :class="classObject">
        <el-menu
        class="el-menu-vertical-demo"
        :unique-opened = 'true'
        :collapse="clicked"
        router
        >
            <div class="logo-div">
                <span class="logo-text">website</span>
            </div>
            
            <component v-if ='hasChildren(value) != ""' 
             v-for = "(value) in aside_list" :key = "value.id" :index = ' null + value.id '
            :is="( value.children && value.children.length>0 ) ? 'el-submenu':'el-menu-item'" >
                <template :slot = "hasChildren(value)">
                <i :class="[value.icon]"></i>
                <span>{{value.title}}</span>
                </template>
                <template v-if="value.children && value.children.length > 0">
                    <el-menu-item v-for="(v) in value.children" :key="v.id" :index="v.path">
                        <span>{{v.title}}</span>
                    </el-menu-item>
                </template>
            </component>

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
            aside_list: []
        }
    },
    methods: {
    },
    created(){
        console.log('createAside')
        this.aside_list = JSON.parse( localStorage.getItem( 'aside' ) )
    },
    computed: {
        classObject: function () {
            return {
                'aside': !this.clicked,
                'aside_click': this.clicked,
            }
        },
        hasChildren() {
            return function (value) {
                if (value.children && value.children.length > 0){
                    return "title"
                }
                return ""
            }
        }
    },
}

</script>

<style lang="less" scoped>

.el-menu-vertical-demo:not(.el-menu--collapse) {
    width: 256px;
}

.aside{
    flex: 0 0 256px;
    background: linear-gradient(135deg, #e9d3ff 0, #b4bfff 60%);
    transition: all 1s;
    -webkit-transition: all 1s;
}

.aside {
    /deep/ .el-menu {
        border-right: none;
        list-style: none;
        position: relative;
        margin: 0;
        padding-left: 0;
        background:transparent;
    }
}


.aside .el-menu .logo-div{
    height:70px;
    padding-left:30px;
    line-height:70px;
    display:flex;
}
.aside .el-menu .logo-div .logo-text {
    font-size: 24px;
    font-weight: 500;
    display: inline-block;
    vertical-align: middle;
    color: #000000;
}



.aside .el-menu .el-submenu{//一级标题穿透
    /deep/ .el-submenu__title{
        background: transparent;
    }
    /deep/ .el-submenu__title i{
        color:#000000;
    }
    /deep/ .el-submenu__title:hover i{
        color:#d15637;
    }
    /deep/ .el-submenu__title span{
        color:#000000;
    }
    /deep/ .el-submenu__title:hover span{
        color:#fb5a1a;
    }
}

.aside .el-menu .el-submenu{//二级标题穿透
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
        color:#6c6c70;
    }
    /deep/ .el-menu .el-menu-item:hover span{
        color:#000000;
    }
}



.aside_click{
    flex: 0 0 80px;
    background: linear-gradient(135deg, #e9d3ff 0, #b4bfff 60%);
    transition: all 1s;
    -webkit-transition: all 1s;
}

.aside_click{
    /deep/ .el-menu {
        border-right: none;
        list-style: none;
        position: relative;
        margin: 0;
        padding-left: 0;
        background:transparent;
    }
}

.aside_click .el-menu .logo-div{
    height:70px;
    padding-left:30px;
    line-height:70px;
    display:flex;
}
.aside_click .el-menu .logo-div .logo-text {
    font-size: 12px;
    font-weight: 500;
    display: inline-block;
    vertical-align: middle;
    color: #000000;
}


.aside_click .el-menu .el-submenu{//一级标题穿透
    /deep/ .el-submenu__title{
        background: transparent;
    }
    /deep/ .el-submenu__title i{
        color:#000000;
    }
    /deep/ .el-submenu__title:hover i{
        color:#d15637;
    }
    /deep/ .el-submenu__title span{
        color:#000000;
    }
    /deep/ .el-submenu__title:hover span{
        color:#fb5a1a;
    }
}

.aside_click .el-menu .el-submenu{//二级标题穿透
    /deep/ .el-menu{
        display: none;
    }
}



</style>