<template>
  <div id="onboarding-5">
    <div class="row jusity-content-center">
      <div class="ryan-wrapper col-lg-6 col-xl-5 pe-0 ms-n4">
        <img :src="ryanImg" class="w-100 ryanImg"/>

        <div class="col-5 ryan-detail shadow rounded p-3 position-relative">
          <div class="name"> Ryan Knoll </div>
          <div class="role"> Founder & CEO, Tidy Casa </div>
          <img :src="strikeThroughImg">
          <div class="sale"> Over $2 million in sales </div>
        </div>
      </div>
      <div class="col-12 col-md-9 col-lg-6 col-xl-7 mt-5 px-3 pt-5 mx-auto text-center">
        <span class="title text-center"> What objections, hesitations, or concerns do you have about joining this program and changing your life?  </span>
        <div class="d-flex flex-wrap justify-content-center">
          <div class="grey-box mt-3 mx-2">
            <button class="btn w-100 h-100"> I don’t see what this will do for me</button>
          </div>

          <div class="grey-box mt-3 mx-2">
            <button class="btn w-100 h-100"> I don’t know if I will succeed </button>
          </div>

          <div class="grey-box mt-3 mx-2">
            <button class="btn w-100 h-100"> I don’t know if I can afford to start a business </button>
          </div>

          <div class="grey-box mt-3 mx-2">
            <button class="btn w-100 h-100"> I’m just too busy right now </button>
          </div>
          <div class="grey-box mt-3 mx-2">
            <button class="btn w-100 h-100"> I don’t want to start a local service business </button>
          </div>

          <div class="grey-box mt-3 mx-2">
            <button class="btn w-100 h-100"> I have no objections let’s get moving </button>
          </div>
        </div>

        <div class="col-10 col-md-8 col-lg-6 col-xl-5 mx-auto">
          <div class="row mt-5">
            <div class="col-5 col-md-4 btn-box">
              <button class="btn back-btn w-100 h-100" @click="prevStep">
                <img :src="previousArrowImg" class="next-arrow">
                <span> Back </span>
              </button>
            </div>

            <div class="col-6 col-md-6 btn-box">
              <button class="btn btn-md btn-dark rounded-0 w-100 h-100" @click="nextStep">
                <span> Next </span>
                <img :src="nextArrowImg" class="next-arrow">
              </button>
            </div>
          </div>

          <JoinText class="text-center"/>
        </div>
      </div>
    </div>

    <BottomBrand class="mt-n3"/>
  </div>
</template>

<script>

import ryanImg from '../../images/ryan.png'
import strikeThroughImg from '../../images/strikethrough.png'
import nextArrowImg from '../../images/next-arrow.png'
import previousArrowImg from '../../images/previous-arrow.png'

import BottomBrand from './BottomBrand.vue'
import JoinText from './JoinText.vue'

export default {
  components: {
    BottomBrand, JoinText
  },

  data: function () {
    return {
      ryanImg: ryanImg,
      strikeThroughImg: strikeThroughImg,
      nextArrowImg: nextArrowImg,
      previousArrowImg: previousArrowImg,
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
#onboarding-5 {
  .ryanImg {
    height: 85%;
  }
  .ryan-detail {
    background: white;
    top: -35%;
    left: 58%;

    .name {
      color: #ff9966;
      font-size: 18.5px;
    }

    .role {
      color: #000000;
      font-size: 13px;
    }

    .sale {
      color: #000000;
    }
  }
}

</style>
