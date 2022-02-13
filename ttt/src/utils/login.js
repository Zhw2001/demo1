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
    localStorage.setItem( 'AuthorityName', nickname )
    request.get( '/api_S/admin/get_Role'+'?account='+ account ).then(res => {
        getRole( res.data );
    })
}

function getRole(userList){
    userList = userList.adminRoleList;
    var roleList = new Array();
    for(let i of userList){
        roleList.push(i.role_name);
    }
    localStorage.setItem('Role',roleList);
}

function setRoutes(router){
    request.get("/api_S/auth/list").then(res => {
        let data = res.data
        let aside = composeTree(data)
        let routes = addRoute(aside)
        router.addRoute(routes)
        localStorage.setItem('aside',JSON.stringify(aside))
    })
}

export { getInfo, setRoutes }