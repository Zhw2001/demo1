import { constRoutes } from './routes'
import { addRoute } from './action.js'
import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

const router = new Router({
  mode:'history',
  routes:constRoutes
})

// 导航守卫
// 使用 router.beforeEach 注册一个全局前置守卫，判断用户是否登陆
router.beforeEach((to, from, next) => {
  console.log(to)
  console.log(from)
  if (to.path === '/login'||to.path === '/regist') {
    next()
  } else {
    let token = localStorage.getItem('Authorization');
    if (token === null || token === '') {
      next('/login')
    } else {
      if(!to.name) {
        const aside = JSON.parse(localStorage.getItem('aside'))
        let routes = addRoute(aside)
        router.addRoute(routes)
        router.replace(from.path)
      }
      next()
    }
  }
})

router.afterEach

export { router }