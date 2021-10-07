<template>
  <div class="right">
    <label class="fw-bold"> OverThink Academy </label>
    <div class="text-black-50">
      <div class="mt-3">
        <span class="fw-bold"> MILLIONAIRE ACADEMY </span><span>- Courses, case-studies, and step-by-step guides. </span>
      </div>
      <div class="mt-3">
        <span class="fw-bold"> WEBSITE THEME </span><span>- Website specifically designed and ready-to-go for local services. </span>
      </div>
      <div class="mt-3">
        <span class="fw-bold"> COMMUNITY </span><span>- Accountability and motivation from amazing folks at every levels. </span>
      </div>
      <div class="mt-3">
        <span class="fw-bold"> MENTORSHIP </span><span>- Live weekly calls to keep you on track and all your questions answered. </span>
      </div>
      <div class="mt-3">
        <span class="fw-bold"> CONVERTLABS </span><span>- Software to handle your teams, schedule, customer database, credit card payments, and more. </span>
      </div>
      <div class="mt-3">
        <span class="fw-bold"> EASYHIRE </span><span>- Software to handle attracting and onboarding partners and/or employees </span>
      </div>
    </div>

    <div class="mt-5">
      <img :src="rightImg1" class="w-100"/>
      <img :src="rightImg2" class="w-100 mt-4"/>
    </div>
  </div>
</template>

<script>

import rightImg1 from 'images/rightImg1.jpeg'
import rightImg2 from 'images/rightImg2.jpeg'

import { mapState, mapActions } from 'vuex'

export default {
  components: {
  },

  data: function () {
    return {
      rightImg1: rightImg1,
      rightImg2: rightImg2,
    }
  },

  methods: {

  },

  computed: {
  },

  mounted() {

  }
}
</script>

<style scoped lang="scss">
  .right {
    
  }
</style>
