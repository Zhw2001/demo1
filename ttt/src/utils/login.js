import request from '@/utils/request'
import { composeTree, addRoute } from '@/router/action.js'

function getInfo( token, account, router ){
    setToken( token )
    request.get( '/api_S/admin/info'+'?account='+ account ).then(res => {
        let userdata = res.data.adminUser
        let cc_list = res.data.cc_list
        localStorage.setItem('userInfo',JSON.stringify(userdata))
        localStorage.setItem('cc_list',JSON.stringify(cc_list))
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
    let cc_list = JSON.parse(localStorage.getItem('cc_list'))
    let role = {} 
    for(let x = 0; x < user.adminRoleList.length; x++){
        if(user.adminRoleList[x].role_id === role_id){
            role = user.adminRoleList[x]
            break
        }
    }
    let authList = role.adminAuthList
    let cc = []
    for(let i of cc_list){
        if(i.role_id === role_id){
            let temp={}
            temp.cid = i.cid
            temp.cname = i.cname
            temp.classes = i.classes
            cc.push(temp)
        }
    }
    role.cc = cc
    localStorage.setItem('role',JSON.stringify(role))
    let aside = composeTree(authList)
    localStorage.setItem('aside', JSON.stringify(aside))
}

export { getInfo, setRoutes, changeRole }