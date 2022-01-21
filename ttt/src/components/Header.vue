<template>
    <div class="head">
        <div class='left'>后台管理</div>
        <div style='flex: 1'></div>
        <div class='right'>
          <el-dropdown @command="handleCommand">
            <span class="el-dropdown-link"><label>{{authority}}</label><i class="el-icon-arrow-down el-icon--right"></i>
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
            authority:'',
        }
    },
    methods: {
        handleCommand(command){
            if(command === 'out'){
                console.log(command);
                this.out();
            }
        },
        out(){
            localStorage.removeItem('Authorization');
            this.$router.push('/login');
        }
    },
    created(){
        if(localStorage.getItem('AuthorityName') !== undefined){
        console.log(localStorage.getItem('AuthorityName'));
        this.authority=localStorage.getItem('AuthorityName');
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
    width: 100px;
}
.head .right .el-dropdown-link {
    cursor: pointer;
    color: #001931;
  }
.head .right .el-icon-arrow-down {
    font-size: 12px;
  }
</style>