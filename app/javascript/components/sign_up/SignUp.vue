<template>
  <div class="sign-up">
    <Header />
    <Main />
    <Footer />
  </div>
</template>

<script>
import Header from './Header.vue'
import Main from './Main.vue'
import Footer from './Footer.vue'

import { mapState, mapActions } from 'vuex'

export default {
  components: {
    Header, Main, Footer,
  },

  data: function () {
    return {
    }
  },

  methods: {

  },

  computed: {
    ...mapState(['currentUser']),
  },

  mounted() {
    if(this.currentUser)
      this.$router.replace({path: '/'})
  }
}
</script>

<style scoped lang="scss">
  .sign-up {
    
  }
</style>
