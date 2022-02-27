<template>
    <div class="head">
        <div class='left'><el-button type="text" @click="fold()"><i :class="classObject"></i></el-button></div>
        <div style='flex: 1'></div>
        <div class='right'>
            <el-dropdown @command="RoleCommand">
                <span class="el-dropdown-link"><label>{{role.role_name}}&nbsp;:&nbsp;</label></span>
                <el-dropdown-menu slot="dropdown">
                    <el-dropdown-item command="change" >切换角色</el-dropdown-item>
                    <el-dropdown-item command="detail" >角色详情</el-dropdown-item>
                </el-dropdown-menu>
            </el-dropdown>
            <el-dropdown @command="NameCommand">
                <span class="el-dropdown-link"><label>{{name}}</label></span>
                <el-dropdown-menu slot="dropdown">
                    <el-dropdown-item >个人信息</el-dropdown-item>
                    <el-dropdown-item command="out" >退出登录</el-dropdown-item>
                </el-dropdown-menu>
            </el-dropdown>
        </div>
        <el-dialog :visible.sync="roleChange" width="15%">
            <el-form>
                <el-form-item label="角色">
                <el-select :value="role_id" placeholder="请选择角色" @change = "handleRoleChange">
                    <el-option
                    v-for = "item in roles"
                    :key = "item.value"
                    :label = "item.label"
                    :value = "item.value">
                    </el-option>
                </el-select>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="roleChange = false">取 消</el-button>
                <el-button type="primary" @click="setRole">确 定</el-button>
            </div>
        </el-dialog>
    </div>
</template>

<script>
import { changeRole } from '@/utils/login.js'

export default {
    name:"Header",
    data(){
        return{
            roleChange: false,
            clicked: false,
            role: {}, //当前角色信息
            name:'',
            roles: [], //角色选项表
            role_id:'', //选中的角色
        }
    },
    methods: {
        setRole(){
            if(this.role.role_id == this.role_id || !this.role_id ) { 
                this.roleChange = false
                return
            }else{
                changeRole(this.role_id)
                location.reload()
            }
        },
        handleRoleChange(v){
            this.role_id = v;
        },
        RoleCommand(command){
            if(command === 'change'){
                this.show();
            }
            if(command === 'detail'){
                this.detail();
            }
        },
        NameCommand(command){
            if(command === 'out'){
                this.out();
            }
        },
        out(){
            localStorage.clear()
            location.reload()
            this.$router.push('/login')
            
        },
        fold () {
            this.clicked = ! this.clicked;
            this.$emit("fold",this.clicked);
        },
        show(){
            this.roleChange = true
        },
        detail(){
            this.$message({
            type: 'info',
            message: this.role.role_description
            });
        },
        getRoles(adminRoleList){
            for(let i of adminRoleList){
                let temp = {}
                temp.value = i.role_id
                temp.label = i.role_name
                this.roles.push(temp)
            }
        }
    },
    created(){
        if( localStorage.getItem('userInfo') ){
            const user = JSON.parse(localStorage.getItem('userInfo'))
            console.log(user)
            this.name = user.nickname
            this.role = JSON.parse(localStorage.getItem('role'))
            this.getRoles(user.adminRoleList)
        }
    },
    computed: {
        classObject: function () {
            return {
            'el-icon-s-unfold': !this.clicked,
            'el-icon-s-fold': this.clicked,
            }
        }
    }
}
</script>

<style lang="less" scoped>
.head
{
    width:100%;
    height: 70px;
    line-height: 70px;
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

/deep/ .el-icon-s-fold{
    font-size: 25px;
}

/deep/.el-icon-s-unfold{
    font-size: 25px;
    color: black;
}

</style>