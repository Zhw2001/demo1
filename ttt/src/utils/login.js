import request from '@/utils/request'
import { composeTree, addRoute } from '@/router/action.js'

function getInfo( token, account, router ){
    setToken( token )
    request.get( '/api_S/admin/info'+'?account='+ account ).then(res => {
        let userdata = res.data
        localStorage.setItem('userInfo',JSON.stringify(userdata))
        changeRole(userdata.adminRoleList[0].role_id)
        let aside = JSON.parse(localStorage.getItem('aside'))
        let routes = addRoute(aside)
        router.addRoute(routes)
        request.get( '/api_S/admin/get_ur_id?uid='+ userdata.uid + '&role_id=' + userdata.adminRoleList[0].role_id ).then( res => {
            request.get( '/api_S/admin/get_course_list?ur_id='+res.data ).then( res => {
                localStorage.setItem("course_list", JSON.stringify(res.data))
                router.push('/')
            })
        })
    })
}

function setToken(token){
    localStorage.setItem('Authorization', token)
}

function changeRole(role_id){
    let user = JSON.parse(localStorage.getItem('userInfo'))
    let role = {} 
    for(let x = 0; x < user.adminRoleList.length; x++){
        if(user.adminRoleList[x].role_id === role_id){
            role = user.adminRoleList[x]
            break
        }
    }
    let authList = role.adminAuthList
    localStorage.setItem('role',JSON.stringify(role))
    let aside = composeTree(authList)
    localStorage.setItem('aside', JSON.stringify(aside))
}

export { getInfo, setRoutes, changeRole }