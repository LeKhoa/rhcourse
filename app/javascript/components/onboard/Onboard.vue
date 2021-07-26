<template>
  <div class="onboard">
    <div v-if="currentUser == null">
      <PageOne v-if="onboardStep == 1" @next="nextOnboardStep" @back="prevOnboardStep" />
      <PageTwo v-if="onboardStep == 2" @next="nextOnboardStep" @back="prevOnboardStep" />
      <PageThree v-if="onboardStep == 3" @next="nextOnboardStep" @back="prevOnboardStep" />
      <PageFour v-if="onboardStep == 4" @next="nextOnboardStep" @back="prevOnboardStep" />
      <PageFive v-if="onboardStep == 5" @next="nextOnboardStep" @back="prevOnboardStep" />
      <PageSix v-if="onboardStep == 6" @next="nextOnboardStep" @back="prevOnboardStep" />
      <PageSeven v-if="onboardStep == 7" @next="nextOnboardStep" @back="prevOnboardStep" />
      <PageEight v-if="onboardStep == 8" />
    </div>

    <div v-else>
      <PageTwo v-if="onboardStep == 1" @next="nextOnboardStep" @back="prevOnboardStep" />
      <PageThree v-if="onboardStep == 2" @next="nextOnboardStep" @back="prevOnboardStep" />
      <PageFour v-if="onboardStep == 3" @next="nextOnboardStep" @back="prevOnboardStep" />
      <PageFive v-if="onboardStep == 4" @next="nextOnboardStep" @back="prevOnboardStep" />
      <PageSix v-if="onboardStep == 5" @next="nextOnboardStep" @back="prevOnboardStep" />
      <PageSeven v-if="onboardStep == 6" @next="nextOnboardStep" @back="prevOnboardStep" />
      <PageEight v-if="onboardStep == 7" />
    </div>
  </div>
</template>

<script>
import PageOne from './PageOne.vue'
import PageTwo from './PageTwo.vue'
import PageThree from './PageThree.vue'
import PageFour from './PageFour.vue'
import PageFive from './PageFive.vue'
import PageSix from './PageSix.vue'
import PageSeven from './PageSeven.vue'
import PageEight from './PageEight.vue'

import { mapState, mapActions } from 'vuex'

export default {
  components: {
    PageOne, PageTwo, PageThree, PageFour, PageFive, PageSix, PageSeven, PageEight
  },

  data: function () {
    return {
      onboardStep: 1,
    }
  },

  methods: {
    nextOnboardStep: function() {
      this.onboardStep ++;
    },

    prevOnboardStep: function() {
      this.onboardStep --;
    }
  },

  computed: {
    ...mapState(['currentUser']),
  },

  mounted() {

  }
}
</script>

<style scoped lang="scss">

</style>
