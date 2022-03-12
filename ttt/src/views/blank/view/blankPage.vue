<template>
 <div class="home-container">
    <div class="card">
      <div class="card-body">
        <div class="card-card">
          <div class="top">
            <router-link to="/eaInput">
                <div class="top-daohan">
                  <img src="@/assets/img/1.png"/>
                  <span>考试/考核信息</span>
                </div>
            </router-link>
            <router-link to="/cgdInput">
            <div class="top-daohan">
              <img src="@/assets/img/2.png"/>
              <span>课程成绩录入</span>
            </div>
            </router-link>
            <router-link to="/cdInput">
            <div class="top-daohan">
              <img src="@/assets/img/3.png"/>
              <span>达成度评价信息</span>
            </div >
            </router-link>
            <router-link to="/cInfo">
            <div class="top-daohan">
              <img src="@/assets/img/4.png"/>
              <span>历史课程信息</span>
            </div>
            </router-link>
            <router-link to="/cAD">
            <div class="top-daohan">
              <img src="@/assets/img/1.png"/>
              <span>历史课程目标明细</span>
            </div>
            </router-link>
          </div>
          <!-- 底部 -->
          <div class="buttom">
            <router-link to="/userInfo">
            <div class="buttom-daohan">
              <img src="@/assets/img/1.png"/>
              <span>用户信息</span>
            </div>
            </router-link>
            <router-link to="/userRole" >
            <div class="buttom-daohan">
              <img src="@/assets/img/2.png"/>
              <span>用户角色</span>
            </div>
            </router-link>
            <router-link to="/userRoleMenu">
            <div class="buttom-daohan">
              <img src="@/assets/img/3.png"/>
              <span>用户权限</span>
            </div >
            </router-link>
            <router-link to="/userCourse">
            <div class="buttom-daohan">
              <img src="@/assets/img/4.png"/>
              <span>分配课程</span>
            </div>  
            </router-link>
            <router-link to="/myCourseList">
            <div class="buttom-daohan">
              <img src="@/assets/img/4.png"/>
              <span>我的课程</span>
            </div>  
            </router-link>
          </div>
        </div>
      </div>
    </div>
 </div>
</template>


<script>

export default {
  name: "Blank",
  data() {
    return {
    }
  },
}
</script>

<style scoped>
a {
  text-decoration: none;
}
.router-link-active {
  text-decoration: none;
}
.card-card{
  height: 530px;
  width: 100%;
}
.top{
  height: 200px;
  width: 100%;
  display: flex;
  justify-content: space-around;
  /* border: 1px solid black; */
}
.top-daohan{
  height: 100%;
  width: 200px;
  /* border: 1px solid black; */
}
.top-daohan img{
  height: 160px;
  width: 200px;
  /* border: 1px solid black; */
}
.top-daohan span{
  font-size: 20px;
  font-weight: bold;
  margin-left: 40px;
  /* border: 1px solid black; */
}

.buttom{
  height: 200px;
  width: 100%;
  margin-top: 120px;
  display: flex;
  justify-content: space-around;
  /* border: 1px solid black; */
}
.buttom-daohan{
  height: 100%;
  width: 200px;
  /* border: 1px solid black; */
}
.buttom-daohan img{
  height: 160px;
  width: 200px;
  /* border: 1px solid black; */
}
.buttom-daohan span{
  padding:12px 0px;
  font-size: 20px;
  font-weight: bold;
  margin-left: 40px;
  /* border: 1px solid black; */
}
</style>
