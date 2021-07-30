<template>
  <div class="home-page">
    <Header />
    <Welcome v-if="step == 0" @continue="nextStep" />
    <Main v-if="step == 1" />
  </div>
</template>

<script>

import Header from './Header.vue'
import Welcome from './Welcome.vue'
import Main from './Main.vue'

export default {
  components: {
    Header, Welcome, Main,
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
