<template>
  <div class="home-page">
    <Header />
    <Welcome v-if="step == 0" @continue="nextStep" />
    <Main v-if="step == 1" :course="courses[0]"/>
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
      courses: [],
    }
  },

  methods: {
    nextStep() {
      this.step++;
    }
  },

  mounted() {
    this.$http.get("/courses")
      .then(response => {
        this.courses = response.data.data;
      }).catch(error => {
        this.error = error.response;
    });
  }
}
</script>

<style scoped>

</style>
