import request from '@/utils/request'
import { composeTree, addRoute } from '@/router/action.js'

function getInfo( token, nickname, account ){
    setToken( token )
    getUserInfo( nickname, account)
}

function setToken(token){
    localStorage.setItem('Authorization', token)
}

function getUserInfo( nickname, account ){
    request.get( '/api_S/admin/get_Role'+'?account='+ account ).then(res => {
        get_Role_Cids( res.data );
    })
}

function get_Role_Cids(data){
    const roleList = data.adminRoleList;
    const userInfo = {}
    userInfo.roles = []
    userInfo.uid = data.uid
    userInfo.account = data.account
    userInfo.nickname = data.nickname
    userInfo.password = data.password
    userInfo.phone = data.phone
    userInfo.email = data.email
    userInfo.description = data.description
    for(let i of roleList){
        let temp = {}
        temp.roleName = i.role_name
        temp.roleDescription = i.role_description
        temp.cids = i.cidList.split[',']
        userInfo.roles.push(temp);
    }
    localStorage.setItem('userInfo',JSON.stringify(userInfo));
}

function setRoutes(router){
    request.get("/api_S/auth/list").then(res => {
        let data = res.data
        let aside = composeTree(data)
        localStorage.setItem('aside', JSON.stringify(aside))
        let routes = addRoute(aside)
        router.addRoute(routes)
        router.push('/')
    })
}


export { getInfo, setRoutes }