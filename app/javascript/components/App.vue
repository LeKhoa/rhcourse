<template>
  <div id="main_app">
    <Header />
    <Welcome v-if="step == 0"
      @continue="nextStep"
    />
    <Home v-if="step == 1" /> 
  </div>
</template>

<script>
import Header from './base/Header.vue'
import Welcome from './welcome/Welcome.vue'
import Home from './home/Home.vue'

export default {
  components: {
    Header, Welcome, Home
  },

  data: function () {
    return {
      step: 0,
    }
  },

  methods: {
    nextStep() {
      this.step++;
    }
  }
}
</script>

<style scoped>

</style>
