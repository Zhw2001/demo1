// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import store from './store'
import { createRouter } from './router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import '@/assets/css/global.css'

const router = createRouter()
Vue.use(ElementUI);
Vue.config.productionTip = false;
new Vue({
  store,
  router,
  render: h => h(App)
}).$mount('#app')