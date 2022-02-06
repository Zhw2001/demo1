<template>
    <div class="head">
        <div class='left'></div>
        <div style='flex: 1'></div>
        <div class='right'>
          <el-dropdown @command="handleCommand">
            <span class="el-dropdown-link"><label>{{fullName}}</label><i class="el-icon-arrow-down el-icon--right"></i>
            </span>
            <el-dropdown-menu slot="dropdown">
                <el-dropdown-item >个人信息</el-dropdown-item>
                <el-dropdown-item command="out">退出登录</el-dropdown-item>
            </el-dropdown-menu>
            </el-dropdown>
        </div>
    </div>
</template>

<script>
export default {
    name:"Header",
    data(){
        return{
            role:'',
            name:'',
        }
    },
    methods: {
        handleCommand(command){
            if(command === 'out'){
                this.out();
            }
        },
        out(){
            localStorage.clear();
            this.$router.push('/login');
            
        }
    },
    created(){
        if(localStorage.getItem('AuthorityName') !== undefined && localStorage.getItem('RoleName') !== undefined  ){
            var role = new Array();
            role = localStorage.getItem('Role').split(',');
            this.name = localStorage.getItem('AuthorityName');
            this.role = role[0];
        }
    },
    computed: {
        fullName(){
            return this.role + ':' + this.name;
        }
    }
}
</script>

<style scoped>
.head
{
    height: 50px;
    line-height: 50px;
    border-bottom: 1px solid #ccc;
    display: flex;
}
.head .left
{
    width: 200px;
    padding-left: 30px;
    padding-top:2px;
    font-weight: bold;
    color: rgb(17, 0, 87); 
    font-family: "Lucida Console", "Courier New", monospace;
}
.head .right
{
    margin-right: 20px;
}
.head .right .el-dropdown-link {
    cursor: pointer;
    color: #001931;
}
.head .right .el-icon-arrow-down {
    font-size: 12px;
}
.el-icon-arrow-down:before {
    content: "\E6DF";
    color: rgb(0, 0, 0);
}
</style>