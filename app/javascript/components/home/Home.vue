<template>
  <div class="home-page">
    <NavBar :courses="courses" :storedSectionIndex="storedSectionIndex"/>
    <Header />
    <router-view :courses="courses" :key="$route.fullPath" @updateStoredSection="updateStoredSection"/>
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
      storedSectionIndex: parseInt(localStorage.getItem('storedSectionIndex')) || 1,
    }
  },

  methods: {
    updateStoredSection() {
      this.storedSectionIndex = parseInt(localStorage.getItem('storedSectionIndex'));
    }

  },

  mounted() {
    this.$http.get('/api/courses')
      .then(response => {
        this.courses = response.data.data;
        this.$router.replace({ name: 'welcome',})
      }).catch(error => {
        this.error = error.response;
    });
  }
}
</script>

<style scoped>

</style>
