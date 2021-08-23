<template>
  <div id="page-2">
    <div class="col-md-6 col-sm-8 col-10 mt-5 mx-auto text-center">
      <div class="checked-circle mx-auto">
        <img :src="checkedStepImg" class="w-100 h-100">
      </div>
      <div class="title mt-5"> Welcome to Rohan. You’re signed up. </div>
      <p class="px-3 mt-3">
        Every business owner's journey is different. To personalize your recommendations and
        make sure you find what you need to grow your company, Rohan has a few questions to
        ask. <br> So let's get started!
      </p>

      <div class="col-5 col-sm-5 mx-auto btn-box mt-5">
        <button class="btn btn-dark w-100 h-100" @click="nextStep"> Let's Go!</button>
      </div>

      <JoinText />
      <BottomBrand />
    </div>
  </div>
</template>

<script>

import checkedStepImg from '../../images/checked-green.png'

import BottomBrand from './BottomBrand.vue'
import JoinText from './JoinText.vue'

export default {
  components: {
    BottomBrand, JoinText,
  },

  data: function () {
    return {
      checkedStepImg: checkedStepImg,
    }
  },

  methods: {
    nextStep: function() {
      this.$emit('next');
    }
  }
}
</script>

<style scoped lang="scss">

</style>
