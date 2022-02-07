<template>
  <div class="app">
    <router-view/>     <!-- 路由跳转基于此处 -->
  </div>
</template>

<script>

export default {
  name: 'App',
  metaInfo: {
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no' }
    ]
  },
}
</script>

<style>

</style>
