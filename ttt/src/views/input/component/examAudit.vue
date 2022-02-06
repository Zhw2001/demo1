<template>
    <div v-if = 'setvis'>
      <el-button @click = 'Close()'></el-button>
    </div>
</template>

<script>
import request from "@/request";
import global from '@/components/Global';

  export default {
    name:'examAudit',

  props:{
        vis : Boolean,
    },

    data() {
      return {

      }
    },
    methods: {
      Close() {
        this.$emit("close");
      },
    },

    computed: {
        setvis: function () {
            return this.vis;
        },
    },

  }
</script>

<style scoped>

</style>