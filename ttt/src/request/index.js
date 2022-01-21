import axios from 'axios'

const request = axios.create({
	baseURL: '/api',  // 注意！！ 这里是全局统一加上了 '/api' 前缀，也就是说所有接口都会加上'/api'前缀在，页面里面写接口的时候就不要加 '/api'了，否则会出现2个'/api'，类似 '/api/api/user'这样的报错，切记！！！
    timeout: 5000
})


export function fetch ({ url, method, parameter, moreConfig = {} }) {
    logRequests && console.log(`fetching ${url}...`)
    return new Promise((resolve, reject) => {
      service[method](url, parameter, moreConfig)
        .then(res => {
          const val = res.data
          logRequests && console.log(`fetched ${url}.`)
          resolve(val)
        }, reject)
        .catch(reject)
    })
  }


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
        console.log(response.data);
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

