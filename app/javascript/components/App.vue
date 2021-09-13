<template>
  <router-view />
</template>

<script>

// Home
import Home from './home/Home.vue'

//Onboarding
import OnBoard from './onboard/Onboard.vue'

import { mapState, mapActions } from 'vuex';

export default {
  components: {
    Home, OnBoard,
  },

  props: ['dataCurrentUser'],

  data: function () {
    return {
      step: 0,
    }
  },

  methods: {
    ...mapActions(['setCurrentUser']),

    nextStep() {
      this.step++;
    },
  },

  computed: {
    ...mapState(['currentUser','userSettings', 'concerns']),

    isOnboarded() {
      if (this.currentUser === null)
        return false;
      return Object.keys(this.currentUser.settings).length != 0
    }
  },

  mounted() {
    this.setCurrentUser(this.dataCurrentUser);
    if (!this.isOnboarded) {
      this.$router.push({ name: 'onboard' })
    }
  }
}
</script>

<style scoped>

</style>
