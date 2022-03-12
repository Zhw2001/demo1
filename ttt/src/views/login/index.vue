<template>
    <div>
        <body>
            <img src="@/assets/img/loginpic2.jpg" class="bgpic" >
            <form name="form1" style="position:fixed;" >
                <div id="login-box" class="mya">
                    <div class="text-center logintitle">
                     <img src="@/assets/img/smulogo.svg" id="logo"><span class="sfrz">身份认证</span>
                    </div>
                    <p style="color:white"></p>
                    <div class="input-box">
                        <input type="text" name="account" placeholder="用户名" v-model="form.account">
                    </div>
                    <div class="input-box">
                        <input type="password" name="password" placeholder="密码" v-model="form.password">
                    </div>
                    <div class="input-box3">
                        <input type="text" name="yzm" placeholder="验证码" v-model="form.yzm">
                        <div @click="changeCode()" style="left:5px;">
                          <identify :identifyCode="identifyCode"></identify>
                        </div>
                    </div>   
                    <button type="button" @click="login()">确认登录</button>
                </div>
            </form>           
            <footer style="position:fixed;bottom:0px;"  class="py-4 d-flex justify-content-center cas-footer" width="100px" height="100px">
             <div>
              <div>校园链接：<br>
              <a href="https://www.shmtu.edu.cn">学校主页</a> |
              <a href="https://portal.shmtu.edu.cn">数字平台</a> |
              <a href="http://wf.shmtu.edu.cn">网上办事中心</a> 
              </div> 
            </div>
        </footer>
        </body>
        
    </div>
</template>

<script>
import { getInfo, setRoutes } from '@/utils/login.js'
import identify from "@/views/login/yzm"
export default{
    name:"login",
   data(){
       return {
           form:{
               account:'',
               password:'',
               nickname:'',
               admin_role_ids:'',
               enable:1
           },
           // 验证码初始值
          identifyCode: 'm6a8',// 这个就是随机生成的验证码
          // 验证码的随机取值范围
          identifyCodes: '123456789abcdefghjkmnpqrstuvwxyz',
		};
  },
   mounted() { 
      // 刷新页面就生成随机验证码
      this.identifyCode = ''
      this.makeCode(this.identifyCodes, 4)

    },
    //注册验证码组件
    components: {
      identify
    },
  
   methods:{
        login(){
           if (this.identifyCode != this.form.yzm ) {
          alert("验证码不正确");
          this.changeCode();// 改变验证码
        } else {
          // alert("验证码正确");
            this.$request.post("/api_S/admin/login",this.form).then(res =>{
                if(res.code == '0'){
                    if(true/*res.data.enable=='1'*/){
                        this.$message({
                            type:"success",
                            message: "login success"
                        })
                        getInfo( res.token, res.data.account, this.$router)                  
                    }
                    else{
                        this.$message({
                            type:"error",
                            message:"该用户不可用"
                        })
                    }
                }
                else{
                    this.$message({
                       type:"error",
                       message: res.msg
                    })
                }
            })
         }           
        },
         // 点击验证码刷新验证码
      changeCode() {
        this.identifyCode = ''
        this.makeCode(this.identifyCodes, 4)
      },
      // 生成一个随机整数  randomNum(0, 10) 0 到 10 的随机整数， 包含 0 和 10
      randomNum(min, max) {
        max = max + 1
        return Math.floor(Math.random() * (max - min) + min)
      },
      // 随机生成验证码字符串
      makeCode(data, len) {
        for (let i = 0; i < len; i++) {
          this.identifyCode += data[this.randomNum(0, data.length - 1)]
        }
      }

    }

}
</script>


<style scoped>

body{
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(45deg, rgb(245, 245, 247), rgb(242, 241, 245)) fixed;
}

.bgpic{
height:100%;
width: 100vw;
background-image: url("../../assets/img/loginpic2.jpg");
background-size:cover;
background-position:center;
position: relative;
}

#logo{
  width:80px;
  margin-top: 40px;
}

#login-box{
background-color:#f7f8f8;
text-align:center;
width:400px;
height:400px;
}

.sfrz{
  font-size: 30px;
}

#login-box h1{
padding-top:60px;
color:#180d0d;
}

#login-box .input-box{/*自定义的css风格名叫input-box*/
margin-top:15px;
}

#login-box .input-box input{
border:none;
background:none;
border-bottom:rgb(7, 62, 124) 2px solid;
padding:5px 10px;
outline:none;
color:#332e2e;
}

.input-box3{/*自定义的css风格名叫input-box*/
margin-top:15px;
display: flex;
justify-content:center; 
/* border: 1px solid; */
}

.input-box3>input{
border:none;
background:none;
width: 90px;
border-bottom:rgb(7, 62, 124) 2px solid;
padding:5px 10px; 
outline:none;
color:#353131;
}

#login-box button{
margin-top:30px;
    border: none;
    outline: none;
    margin: 2.5rem 0 0;
    width: 130px;
    height:25px;
    border-radius: 3rem;
    background: linear-gradient(90deg, rgb(7, 62, 124), rgb(7, 62, 124));
    box-shadow: 0 0 8px rgb(68, 143, 241);
    cursor: pointer;
    color: white;
}

.mya a{
  display: block;
  color: #b2d4f5e3;
  text-align: center;
  text-decoration: none;
  font-size:0.5px;
}

.mya a:hover{
color:#ffffff;
}

</style>