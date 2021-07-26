<template>
  <div id="home_page">
    <Header />
    <Welcome v-if="step == 0" @continue="nextStep" />
    <Menu v-if="step == 1" />
  </div>
</template>

<script>

import Header from './Header.vue'
import Welcome from './Welcome.vue'
import Menu from './Menu.vue'

export default {
  components: {
    Header, Welcome, Menu,
  },

  props: ['currentUser'],

  data: function () {
    return {
      step: 0,
    }
  },

  methods: {
    nextStep() {
      this.step++;
    }
  },

  mounted() {
  }
}
</script>

<style scoped>

</style>
