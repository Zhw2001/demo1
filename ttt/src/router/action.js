import { allDynamicRoutes } from './routes'

function StrInList(str, authList){
    for( let i = 0; i < authList.length; i++ ){
      if ( authList[i].authority_url.indexOf( str ) != -1 ) { return true }
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
    console.log(allDynamicRoutes, temp);
    temp.forEach(item => {
        map[item.id] = item
    })
    temp.forEach(item => {
      const parent = map[item.parent_id]
        if (parent) {
          console.log('parent',parent)
            if ( StrInList( item.component, authList ) ) { 
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
      component: () => import('@/views/Main'), // main
      children: []
    }
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