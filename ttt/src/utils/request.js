import axios from 'axios'

const request = axios.create({
    timeout: 5000
})



// request 拦截器
// 可以自请求发送前对请求做一些处理
// 比如请求头中统一加token，对请求参数统一加密等等等
request.interceptors.request.use(config => {
    config.headers['Content-Type'] = 'application/json;charset=utf-8';
    config.headers['token'] = localStorage.getItem('Authorization');  // 设置请求头
    return config
}, error => {
    return Promise.reject(error)
});

// response 拦截器
// 可以在接口响应后统一处理结果
request.interceptors.response.use(
    response => {

        let res = response.data;
        //异常处理
        if(res === 401){
            localStorage.removeItem('Authorization');
            localStorage.removeItem('AuthorityName');
            this.$router.push('/login');
        }


        // 如果是返回的文件
        if (response.config.responseType === 'blob') {
            return res
        }
        // 兼容服务端返回的字符串数据,是字符串就改为对象，是对象就直接返回
        if (typeof res === 'string') {
            res = res ? JSON.parse(res) : res
        }
        return res;
    },
    error => {
        console.log('err' + error) // for debug
        return Promise.reject(error)
    }
)

export default request

