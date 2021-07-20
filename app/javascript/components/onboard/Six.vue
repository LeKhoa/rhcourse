<template>
  <div id="onboarding-6">
    <div class="col-md-6 col-sm-8 col-10 mt-5 mx-auto text-center">
      <div class="checked-circle mx-auto">
        <img :src="checkedStepImg" class="w-100 h-100">
      </div>
      <div class="title mt-5"> Let's Built Something That Changes Your Life Forever! </div>
      <div class="row mt-3">
        <div class="col-6">
          <input class="form-control shadow-none rounded-0" placeholder="Name">
        </div>
        <div class="col-6">
          <input class="form-control shadow-none rounded-0" placeholder="Email">
        </div>
      </div>

      <div class="row mt-3">
        <div class="col-6">
          <div class="input-group">
            <span class="input-group-text rounded-0">+1</span>
            <input type="text" class="form-control shadow-none rounded-0 bg-white" placeholder="Phone">
          </div>
        </div>
        <div class="col-6">
          <input class="form-control shadow-none rounded-0" placeholder="Monthly Business Budget">
        </div>
      </div>

      <div class="col-6 col-sm-5 mx-auto btn-box mt-5">
        <button class="btn btn-dark w-100 h-100" @click="nextStep"> BOOK A CALL!</button>
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
#onboarding-6 {
  input {
    height: 55px;
  }
}
</style>
