<template>
  <div class="home-page">
    <NavBar :courses="courses"/>
    <Header />
    <router-view />
  </div>
</template>

<script>

import NavBar from './NavBar.vue'
import Header from './Header.vue'

export default {
  components: {
    NavBar, Header,
  },

  data: function () {
    return {
      courses: [],
      error: '',
    }
  },

  methods: {

  },

  mounted() {
    this.$http.get("/courses")
      .then(response => {
        this.courses = response.data.data;
        this.$router.replace({
          name: 'courses',
          params: { course_id: this.courses[0].id },
          query: { course_id: this.courses[0].id }
        })
      }).catch(error => {
        this.error = error.response;
    });
  }
}
</script>

<style scoped>

</style>
