<template>
  <div class="payment">
    <Header />
    <Content />
    <Banner />

  </div>
</template>

<script>

import Header from './Header.vue'
import Content from './Content.vue'
import Banner from './WhatYouGet.vue'

export default {
  components: {
    Header, Banner, Content,
  },

  data: function () {
    return {

    }
  },

  methods: {

  },

  mounted() {

  }
}
</script>

<style scoped lang="scss">

</style>
