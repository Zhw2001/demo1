<template>
    <div :class="classObject">
        <el-menu
        class="aside-menu"
        :unique-opened = 'true'
        router
        >
            <div class="logo-div">
                <span class="logo-text">website</span>
            </div>
            

            <component  v-for = "(value) in aside_list" :key = "value.id" :index = "value.id"
            :is="( value.children && value.children.length>0 ) ? 'el-submenu':'el-menu-item'" >
                <template slot="title">
                <i :class="[value.icon]"></i>
                <span>{{value.title}}</span>
                </template>
                <template v-if="value.children && value.children.length>0">
                    <el-menu-item v-for="(v,i) in value.children" :key="v.id" :index="v.path">
                        <span slot="title">{{v.title}}</span>
                    </el-menu-item>
                </template>
            </component>

        </el-menu>
    </div>
</template>

<script>

export default {
    //name:'nav-menu',
    props:{
        clicked:Boolean,
    },
    data(){
        return{
            aside_list: [],
        }
    },
    methods: {
        change(list){
            const data = JSON.parse(list)
            return data
        }
    },
    created(){
        this.aside_list = this.change( localStorage.getItem( 'aside' ) )
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

.aside .el-menu {
    /deep/ .el-icon-arrow-down {//展开图标穿透
        content: "\E6DF";
        color: azure;
    }
    /deep/ .el-icon-arrow-down:hover {//展开图标穿透
        background: transparent;
        color:#f5a5a5;
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
    color: #ffffff;
}


.aside .el-menu {//自定义导航栏样式覆盖
    border-right: solid 1px #e6e6e6;
    list-style: none;
    position: relative;
    margin: 0;
    padding-left: 0;
    background:transparent;
}


.aside .el-menu .el-submenu{//一级标题穿透
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

.aside_click .el-menu {
    /deep/ .el-icon-arrow-down {//展开图标穿透
        display: none;
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
    color: #ffffff;
}


.aside_click .el-menu {//自定义导航栏样式覆盖
    border-right: solid 1px #e6e6e6;
    list-style: none;
    position: relative;
    margin: 0;
    padding-left: 0;
    background:transparent;
}

.aside_click .el-menu .el-submenu{//一级标题穿透
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

.aside_click .el-menu .el-submenu{//二级标题穿透
    /deep/ .el-menu{
        display: none;
    }
}



</style>