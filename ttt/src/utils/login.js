import request from '@/utils/request'
import { composeTree, addRoute } from '@/router/action.js'

function getInfo( token, account, router ){
    setToken( token )
    request.get( '/api_S/admin/info'+'?account='+ account ).then(res => {
        let userdata = res.data.adminUser
        localStorage.setItem('userInfo',JSON.stringify(userdata))
        let teacher_courseList = res.data.courseList
        localStorage.setItem('teacher_course_list',JSON.stringify(teacher_courseList))
        changeRole(userdata.adminRoleList[0].role_id)
        let aside = JSON.parse(localStorage.getItem('aside'))
        let routes = addRoute(aside)
        router.addRoute(routes)
        router.push('/')
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