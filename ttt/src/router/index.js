import { constRoutes } from './routes'
import { addRoute } from './action.js'
import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

const router = new Router({
  mode:'history',
  routes:constRoutes
})


function setPath( url, routes ){
  var tempRoute = {}
  for(let i = 0; i < routes.children.length; i++){
    if ( url == ('/' + routes.children[i].path) ){
      tempRoute.name = routes.children[i].name
      return tempRoute
    }
  }
  tempRoute.name = 'main'
  return tempRoute
}


// 导航守卫
// 使用 router.beforeEach 注册一个全局前置守卫，判断用户是否登陆
router.beforeEach((to, from, next) => {
  console.log('to',to)
  console.log('from',from)
  if(to.path.indexOf(null) != -1 ){return false}
  if (to.path === '/login'||to.path === '/regist') {
    next()
  } else {
    let token = localStorage.getItem('Authorization');
    if (token === null || token === '') {
      next('/login')
    } else {
      if(!to.name) { //刷新的时候重新加载路由
        const aside = JSON.parse(localStorage.getItem('aside'))
        let routes = addRoute(aside)
        router.addRoute(routes)
        console.log('next',to.path)
        let tempR = setPath(to.path, routes)
        router.replace(tempR)
      }
      next()
    }
  }
})

export { router }