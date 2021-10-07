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

    subscribed() {
      if (this.currentUser === null)
        return false;
      if(this.currentUser.sub_status)
        return true;

      return Object.keys(this.currentUser.settings).length != 0
    }
  },

  mounted() {
    this.setCurrentUser(this.dataCurrentUser);
    if (!this.subscribed) {
      this.$router.push({ name: 'sign_up' })
    }
  }
}
</script>

<style scoped>

</style>
