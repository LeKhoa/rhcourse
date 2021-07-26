<template>
  <div id="page-3">
    <div class="col-xl-4 col-lg-6 col-md-7 col-10 mt-5 mx-auto text-center">
      <div class="location-box mx-auto">
        <img :src="locationImg" class="w-100 h-100">
      </div>
      <div class="title mt-5"> Where are you located? </div>

      <div class="input-group mx-auto mt-3">
        <div class="input-group-prepend bg-white">
          <span class="input-group-text h-100 bg-transparent border-0">
            <img :src="searchLocation" class="search-icon" />
          </span>
        </div>
        <input class="form-control shadow-none border-0" type="search" placeholder="Search location" aria-label="Search">
      </div>

      <div class="mx-auto w-100">
        <div class="row mt-5 justify-content-center">
          <div class="col-5 col-sm-4 btn-box">
            <button class="btn back-btn w-100 h-100" @click="prevStep">
              <img :src="previousArrowImg" class="next-arrow">
              <span> Back </span>
            </button>
          </div>

          <div class="col-5 col-sm-5 btn-box">
            <button class="btn btn-md btn-dark rounded-0 w-100 h-100" @click="nextStep">
              <span> Next </span>
              <img :src="nextArrowImg" class="next-arrow">
            </button>
          </div>
        </div>
      </div>

      <JoinText />
      <BottomBrand />
    </div>
  </div>
</template>

<script>

import locationImg from '../../images/location.png'
import nextArrowImg from '../../images/next-arrow.png'
import previousArrowImg from '../../images/previous-arrow.png'
import searchLocation from '../../images/search.png'

import BottomBrand from './BottomBrand.vue'
import JoinText from './JoinText.vue'

export default {
  components: {
    BottomBrand, JoinText,
  },

  data: function () {
    return {
      locationImg: locationImg,
      nextArrowImg: nextArrowImg,
      previousArrowImg: previousArrowImg,
      searchLocation: searchLocation,
    }
  },

  methods: {
    nextStep: function() {
      this.$emit('next');
    },

    prevStep: function() {
      this.$emit('back');
    }
  }
}
</script>

<style scoped lang="scss">
#page-3 {
  .location-box {
    height: 74px;
    width: 54px;
  }

  .input-group-text {
    border-radius: 0;
    .search-icon{
      width: 17px;
      height: 17px;
    }
  }

  .input-group {
    height: 55px;
    width: 80%;
    border: solid 2px #191919;
    border-radius: 4px;
  }

  .form-control {
    padding-left: 0;
  }
}

</style>
