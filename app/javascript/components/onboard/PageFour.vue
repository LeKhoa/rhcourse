<template>
  <div id="page-4">
    <div class="row justify-content-center">
      <div class="col-lg-5 col-md-9 col-12 p-3">
        <img :src="christinaImg" class="w-100 h-100"/>
      </div>

      <div class="col-lg-7 col-md-9 col-12 mt-5 p-5 text-center">
        <span class="title text-center"> Where are you in your business journey right now? </span>
        <div class="d-flex flex-wrap justify-content-center">
          
          <div class="grey-box mt-3 mx-2" v-for="(status, index) in businessJourneys">
            <button class="btn w-100 h-100" :class="{ selected: index == userSettings.businessStatus }" @click="setStatus(index)"> {{status}} </button>
          </div>
        </div>

        <div class="col-12 col-md-8 col-lg-7 col-xl-6 mx-auto">
          <div class="row mt-5 justify-content-center">
            <div class="col-5 col-sm-3 col-md-5 btn-box">
              <button class="btn back-btn w-100 h-100" @click="prevStep">
                <img :src="previousArrowImg" class="next-arrow">
                <span> Back </span>
              </button>
            </div>

            <div class="col-6 col-sm-4 col-md-7 btn-box">
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

import christinaImg from '../../images/christina.png'
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
      christinaImg: christinaImg,
      nextArrowImg: nextArrowImg,
      previousArrowImg: previousArrowImg,
      businessJourneys: [
        "I just started my business",
        "I’m trying to grow my business",
        "I’m not trying to grow, just maintain",
        "I’m looking to sell my company",
        "I haven’t started yet",
      ],
    }
  },

  methods: {
    ...mapActions({
      setStatus: 'setBusinessStatus',
    }),

    nextStep: function() {
      this.$emit('next');
    },

    prevStep: function() {
      this.$emit('back');
    },
  },

  computed: {
    ...mapState(['userSettings']),
  }
}
</script>

<style scoped lang="scss">
#page-4 {

}

</style>
