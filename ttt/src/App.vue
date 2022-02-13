<template>
  <div class="app">
    <router-view ></router-view>     <!-- 路由跳转基于此处 -->
  </div>
</template>

<script>
import { setRoutes } from '@/utils/login.js'

export default {
  name: 'App',
  created () {
    setRoutes( this.$router )
  },
}

</script>

<style>

</style>
