import request from '@/utils/request'
import { composeTree, addRoute } from '@/router/action.js'

function getInfo( token, account, router ){
    setToken( token )
    request.get( '/api_S/admin/info'+'?account='+ account ).then(res => {
        let data = res.data
        localStorage.setItem('userInfo',JSON.stringify(data))
        localStorage.setItem('role', JSON.stringify(data.adminRoleList[0]))
        let authList = data.adminRoleList[0].adminAuthList
        let aside = composeTree(authList)
        localStorage.setItem('aside', JSON.stringify(aside))
        let routes = addRoute(aside)
        router.addRoute(routes)
        router.push('/')
    })
}

function setToken(token){
    localStorage.setItem('Authorization', token)
}


export { getInfo, setRoutes }