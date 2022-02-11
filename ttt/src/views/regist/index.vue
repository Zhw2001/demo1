<template>
    <div>
        <body>
            <img src="@/assets/img/loginback.jpg" class="bgpic" >
            <form name="form1" style="position:fixed;" >
                <div id="login-box" class="mya">
                    <h1>Login</h1>
                    <p style="color:white"></p>
                    <div class="input-box">
                        <input type="text" name="account" placeholder="Account" v-model="account">
                    </div>
                    <div class="input-box">
                        <input type="password" name="password" placeholder="Password" v-model="password">
                    </div>
                    <button type="submit">regist</button>
                    <router-link :to="{name:'login'}">sign in</router-link>
                </div>
            </form>
        </body>
    </div>
</template>

<script>
import request from "@/utils/request";

export default{
    name:"regist",
   data(){
       return {
           form:{
               account:'',
               password:''
           }
       }
   },

   methods:{
       regist(){
           request.post("/api_S/user/regist",this.form).then(res =>{
               if(res.code === '0'){
                   this.$message({
                       type:"success",
                       message: "regist success"
                   })
                   this.$router.push("/");
               }else{
                   this.$message({
                       type:"error",
                       message: res.msg
                   })
               }
           })
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
    background: linear-gradient(45deg, rgb(57, 48, 119), rgb(181, 171, 245)) fixed;
}

.bgpic{
height:100%
}

#login-box{
background-color:#00000068;
text-align:center;
width:350px;
height:400px;
}

#login-box h1{
padding-top:60px;
color:#ffffff;
}

#login-box .input-box{/*自定义的css风格名叫input-box*/
margin-top:15px;
}

#login-box .input-box input{
border:none;
background:none;
border-bottom:#ffffff 2px solid;
padding:5px 10px;
outline:none;
color:#ffffff;
}

#login-box button{
margin-top:30px;
    border: none;
    outline: none;
    margin: 2.5rem 0 0;
    width: 130px;
    height:25px;
    border-radius: 3rem;
    background: linear-gradient(90deg, rgb(181, 154, 254), rgb(245, 189, 253));
    box-shadow: 0 0 8px rgb(181, 154, 254);
    cursor: pointer;
    color: white;
}

.mya a{
  display: block;
  color: #c6c4c454;
  text-align: center;
  text-decoration: none;
  font-size:0.5px;
}

.mya a:hover{
color:#ffffff;
}

</style>