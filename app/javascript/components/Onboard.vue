<template>
  <div class="onboard">
    <One v-if="onboardStep == 1" @next="nextOnboardStep" @back="prevOnboardStep" />
    <Two v-if="onboardStep == 2" @next="nextOnboardStep" @back="prevOnboardStep" />
    <Three v-if="onboardStep == 3" @next="nextOnboardStep" @back="prevOnboardStep" />
    <Four v-if="onboardStep == 4" @next="nextOnboardStep" @back="prevOnboardStep" />
    <Five v-if="onboardStep == 5" @next="nextOnboardStep" @back="prevOnboardStep" />
    <Six v-if="onboardStep == 6" @next="nextOnboardStep" @back="prevOnboardStep" />
    <Seven v-if="onboardStep == 7" />
  </div>
</template>

<script>
import One from './onboard/One.vue'
import Two from './onboard/Two.vue'
import Three from './onboard/Three.vue'
import Four from './onboard/Four.vue'
import Five from './onboard/Five.vue'
import Six from './onboard/Six.vue'
import Seven from './onboard/Seven.vue'

export default {
  components: {
    One, Two, Three, Four, Five, Six, Seven
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
  }
}
</script>

<style scoped lang="scss">

</style>
