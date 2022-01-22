import request from "@/request";

export default {
    name: "authority",
    namespaced: true,//使其成为带命名空间的模块
    state: {
      RoleName: '1',
      AuthorityName: '1'
    },
    getters: {
      getState(state) {
        return state;
      },
      getRoleName(state) {
        return state.RoleName;
      },
      getAuthorityName(state) {
        return state.AuthorityName;
      }
    },
    mutations:{
      SET_ROLE_NAME(state,rolename){
        state.RoleName = rolename;
      },
      SET_AUTHORITY_ID(state,authname){
        state.AuthorityName = authname;
      }
    },
    actions:{
      GET_USER ({ commit, dispatch, state }, parameter) {
        // 获取用户信息
        return request.post("/api_S/admin/getAdminAuth",parameter).then(res =>
          {
          commit('SET_ROLE_NAME', result.data.role_name);
          commit('SET_AUTHORITY_ID', result.data.authority_name) ;
          return res;
        })
      },
    }
  }