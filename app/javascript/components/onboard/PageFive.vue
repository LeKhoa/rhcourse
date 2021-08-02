<template>
  <div id="page-5">
    <div class="row justify-content-center">
      <div class="elena-wrapper p-3">
        <div class="w-100 h-100 p-3">
          <img :src="elenaImg" class="w-100 h-100"/>
        </div>

        <div class="elena-detail position-relative">
          <img :src="elenaDetail" class="w-100 h-100"/>
        </div>
      </div>
      <div class="col-lg-7 col-md-9 col-12 mt-5 pt-3 text-center">
        <span class="title text-center"> What’s the biggest challenge Rohan can help you with right now?  </span>
        <div class="d-flex flex-wrap justify-content-center">
          <div class="grey-box mt-3 mx-2" v-for="(challenge, index) in challenges">
            <button class="btn w-100 h-100" :class="{ selected: userSettings.challenges[index] }" @click="setChallenges(index)"> {{challenge}}</button>
          </div>
        </div>

        <div class="col-10 col-md-8 col-lg-7 col-xl-6 mx-auto">
          <div class="row mt-5">
            <div class="col-5 col-md-5 btn-box">
              <button class="btn back-btn w-100 h-100" @click="prevStep">
                <img :src="previousArrowImg" class="next-arrow">
                <span> Back </span>
              </button>
            </div>

            <div class="col-6 col-md-7 btn-box">
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

    <BottomBrand />
  </div>
</template>

<script>

import elenaImg from '../../images/elena.png'
import elenaDetail from '../../images/elena-details.png'
import nextArrowImg from '../../images/next-arrow.png'
import previousArrowImg from '../../images/previous-arrow.png'

import BottomBrand from './BottomBrand.vue'
import JoinText from './JoinText.vue'

// Vuex
import { mapState, mapActions } from 'vuex';

export default {
  components: {
    BottomBrand, JoinText
  },

  data: function () {
    return {
      challenges: [
        "Start my business",
        "Build my team",
        "Raise capital",
        "Grow my network",
        "Build awareness",
        "Acquire customers",
        "Operate my business"
      ],
      elenaImg: elenaImg,
      elenaDetail: elenaDetail,
      nextArrowImg: nextArrowImg,
      previousArrowImg: previousArrowImg,
    }
  },

  methods: {
    ...mapActions({
      setChallenges: 'setChallenges',
    }),

    nextStep() {
      this.$emit('next');
    },

    prevStep() {
      this.$emit('back');
    },
  },

  computed: {
    ...mapState(['userSettings']),
  }
}
</script>

<style scoped lang="scss">
#page-5 {
  .elena-wrapper {
    width: 600px;
    height: 630px;
    margin-left: -120px;
    margin-top: -100px;

    @media only screen and (max-width: 575px) {
      height: 500px;
    }
  }
  .elena-detail {
    width: 230px;
    height: 108px;
    top: -190px;
    left: 370px;

    @media only screen and (max-width: 575px) {
      left: 50%;
      top: -150px;
    }
  }
}

</style>
