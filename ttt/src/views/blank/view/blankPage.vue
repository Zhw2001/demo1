<template>
 <div class="home-container">
    <div class="card">
      <div class="card-body">
          <div class="top">
            <template v-for="(aside, i) in asideList1" >
              <router-link :to='"/" + aside.path' :key="i">
                  <div class="top-daohan">
                    <img :src='require(`@/assets/img/${aside.pic}`)'>
                    <span>{{aside.title}}</span>
                  </div>
              </router-link>
            </template>
            <router-link to='/myCourseList'>
              <div class="top-daohan">
                <img src='@/assets/img/WDKC.png'>
                <span>我的课程</span>
              </div>
            </router-link>
          </div>
          <div v-if="asideList2.length > 0" style="height: 2vw;margin: 2vw 0vw 2vw 0vw;"></div>
          <div v-if="asideList2.length > 0" class="top">
            <template v-for="(aside, i) in asideList2" >
              <router-link :to='"/" + aside.path' :key="i">
                  <div class="top-daohan">
                    <img :src='require(`@/assets/img/${aside.pic}`)'>
                    <span>{{aside.title}}</span>
                  </div>
              </router-link>
            </template>
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
      asideList: [],
      asideList1: [],
      asideList2: []
    }
  },
  created(){
    let temp_array = []
    let temp = JSON.parse(localStorage.getItem("aside"));
    for( let i of temp){
      if(i.children){
        for( let j of i.children){
          temp_array.push(j)
        }
      }
    }
    this.asideList = temp_array
    for(let i = 0; i < 3; i++){
      if(!temp_array[i]){
        break;
      }
      this.asideList1.push(temp_array[i])
    }
    for(let i = 3; i < temp_array.length; i++){
      if(!temp_array[i]){
        break;
      }
      this.asideList2.push(temp_array[i])
    }
    console.log(this.asideList1,this.asideList2)
  }
}
</script>

<style scoped>
a {
  text-decoration: none;
}
.router-link-active {
  text-decoration: none;
}
.myicon{
  flex-direction: column;
  display: flex;
  justify-content:flex-start;
}
.top{
  height: 8vw;
  width: 100%;
  flex: 0 1 auto;
  display: flex;
  justify-content: space-around;
  margin: 2vw 0vw 2vw 0vw;
  /* border: 1px solid black; */
}
.top-daohan{
  height: 100%;
  width: 8vw;
  display: flex;
  justify-content: flex-end;
  flex-direction: column;
  /* border: 1px solid black; */
}
.top-daohan img{
  flex: 1 1 auto;
  height: 8vw;
  width: 100%;
  /* border: 1px solid black; */
}
.top-daohan span{
  flex: 1 1 auto;
  text-align: center;
  margin-top: 0.5vw;
  font-size: 1vw;
  /* border: 1px solid black; */
}

</style>
