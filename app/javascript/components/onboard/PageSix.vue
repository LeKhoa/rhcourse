<template>
  <div id="page-6">
    <div class="row mx-0 jusity-content-center">
      <div class="ryan-wrapper col-lg-6 col-xl-5 col-12 col-md-10 pe-5 ms-n5">
        <img :src="ryanImg" class="w-100 ryanImg"/>

        <div class="col-6 col-sm-5 ryan-detail shadow rounded px-3 py-2 position-relative">
          <div class="name"> Ryan Knoll </div>
          <div class="role">
            <span>Founder & CEO,</span> <span><u> Tidy Casa </u> </span>
          </div>
          <img :src="strikeThroughImg">
          <div class="sale fw-bold"> OVER $5 MILLION IN SALES </div>
        </div>
      </div>
      <div class="col-12 col-md-9 col-lg-6 col-xl-7 mt-5 px-0 pt-5 mx-auto text-center">
        <span class="title text-center ms-n3">What objections, hesitations, or concerns do you have about joining this program and changing your life?</span>
        <div class="d-flex flex-wrap justify-content-center px-5">
          <div class="grey-box mt-3 mx-2" v-for="(concern, index) in concernTexts">
            <button class="btn w-100 h-100" :class="{ selected: userSettings.concerns[index] }" @click="setConcerns(index)"> {{concern}}</button>
          </div>
        </div>

        <div class="col-10 col-md-8 col-lg-7 col-xl-6 mx-auto">
          <div class="row mt-5">
            <div class="col-5 col-md-4 col-lg-5 btn-box">
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

    <BottomBrand class="mt-5"/>
  </div>
</template>

<script>

import ryanImg from '../../images/ryan.png'
import strikeThroughImg from '../../images/strikethrough.png'
import nextArrowImg from '../../images/next-arrow.png'
import previousArrowImg from '../../images/previous-arrow.png'

import BottomBrand from './BottomBrand.vue'
import JoinText from './JoinText.vue'

import { mapState, mapActions } from 'vuex';

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

      concernTexts: [
        "I don’t see what this will do for me",
        "I don’t know if I will succeed",
        "I don’t know if I can afford to start a business",
        "I’m just too busy right now",
        "I don’t want to start a local service business",
        "I have no objections let’s get moving",
      ],
    }
  },

  methods: {
    ...mapActions([
      'setConcerns', // map `this.setConcerns(index)` to `this.$store.dispatch(setConcerns', index)`
    ]),

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
#page-6 {
  .ryanImg {
    height: 85%;
  }
  .ryan-detail {
    background: white;
    top: -31%;
    left: 66%;

    .name {
      color: #ff9966;
      font-size: 17px;
      @media only screen and (max-width: 575px) {
        font-size: 13px;
      }
    }

    .role {
      color: #000000;
      font-size: 12px;
      @media only screen and (max-width: 575px) {
        font-size: 9px;
      }
    }

    .sale {
      font-size: 9px;
      color: #000000;
      @media only screen and (max-width: 575px) {
        font-size: 8px;
      }
    }
  }
}

</style>
