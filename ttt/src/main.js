// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI)
import '@/assets/css/global.css'
import App from './App'
import { router } from './router'
import * as echarts from 'echarts';
import request from '@/utils/request.js'
import setCss from '@/utils/setCss.js'
import 'default-passive-events'

Vue.prototype.$echarts = echarts

Array.prototype.remove = function(val) { 
  var index = this.indexOf(val); 
  if (index > -1) { 
  this.splice(index, 1); 
  } 
};

Vue.config.productionTip = false
Vue.prototype.$request = request
Vue.prototype.$setCss = setCss
new Vue({
  el: '#app',
  router,
  render: h => h(App)
/*   render: function (createElement) {
      return createElement(App);
  } */
})//.$mount('#app')//手动挂载到index id="app"