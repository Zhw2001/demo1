import { allDynamicRoutes } from './routes'

function checkKey(key, authList){
    for( let i = 0; i < authList.length; i++ ){
      if ( authList[i].authority_url ==  key ) { return true }
    }
    return false
  }
  
  function composeTree (list) {
    const authList = JSON.parse(JSON.stringify(list))
    const result = []
    if (!Array.isArray(authList)) {
        return result // 不是数组返回空
    }
    const map = {}
    const temp = JSON.parse(JSON.stringify(allDynamicRoutes))
    temp.forEach(item => {
        map[item.id] = item
    })
    temp.forEach(item => {
      const parent = map[item.parent_id]
        if (parent) {
            if ( checkKey( item.key, authList ) ) { 
              (parent.children || (parent.children = [])).push(item) 
            }
        } else {
            result.push(item)
        }
    })
    return result
  }
  
  
  function addRoute(list){
    const data = JSON.parse(JSON.stringify(list))
    if (!Array.isArray(data)) {
        return result // 不是数组返回空
    }
    const result = {
      path: '/',
      name:'main',
      redirect: '/blank',
      component: () => import('@/views/Main'), // main
      children: []
    }
    let firstPage = {
      path:'/blank',
      name:'blank',
      component: () => import('@/views/blank/view/blankPage')
    }
    let coursePage = {
      path:'/myCourseList',
      name:'my_course_list',
      component: () => import('@/views/blank/view/courseList')
    }
    result.children.push(firstPage)
    result.children.push(coursePage)
    let obj = {}
    data.forEach( item => {
      if(item.children) {
        item.children.forEach( i => { 
          let temp = {}
          temp.name = i.name
          temp.path = i.path
          temp.component =  () => import( '@/views' + i.component )
          
          result.children.push(temp) 
        } )
      }
    })
    return result
  }
  




  export { addRoute, composeTree }