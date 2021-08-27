<template>
  <div id="page-7">
    <div class="bg col-10 col-md-9 col-lg-6 ms-5">
      <img :src="videoBgImg" class="w-100"/>
    </div>

    <div class="position-absolute page-content col-11 text-center mx-auto">
      <div class="col-12 col-md-10 col-xl-6 title mx-auto title mx-auto"> Watch this 5 minute video and then proceed to the final step </div>
      <div class="row align-items-center px-5">
        <!-- Left -->
        <div class="col-12 col-md-10 col-lg-7 mx-auto mt-5">
          <div class="wistia_responsive_padding" style="padding:55.94% 0 0 0;position:relative;" v-if="wistiaVideoUrl">
            <div class="wistia_responsive_wrapper" style="height:100%;left:0;position:absolute;top:0;width:100%;">
              <iframe :src="wistiaVideoUrl" title="Welcome Video" allow="autoplay; fullscreen" allowtransparency="true" frameborder="0" scrolling="no" class="wistia_embed" name="wistia_embed" allowfullscreen msallowfullscreen width="100%" height="100%"></iframe>
            </div>
          </div>
        </div>
        <!-- Right -->

        <div class="col-12 col-md-10 col-lg-5 mt-5">
          <div class="row justify-content-center">
            <div class="col-8 col-sm-5 col-xl-4 btn-box">
              <button class="btn back-btn w-100 h-100" @click="prevStep">
                <img :src="previousArrowImg" class="next-arrow">
                <span class="text-black-50"> Back </span>
              </button>
            </div>

            <div class="col-8 col-sm-5 btn-box">
              <button class="btn btn-md btn-dark rounded-0 w-100 h-100" @click="nextStep">
                <span class="text-white"> Final step </span>
                <img :src="nextArrowImg" class="next-arrow">
              </button>
            </div>
          </div>
          <JoinText />
        </div>
        <!-- Right -->
      </div>

      <BottomBrand />
    </div>
  </div>
</template>

<script>

import videoBgImg from '../../images/video-bg.png'
import thumbnailImg from '../../images/thumbnail.png'
import nextArrowImg from '../../images/next-arrow.png'
import previousArrowImg from '../../images/previous-arrow.png'

import JoinText from './JoinText.vue'
import BottomBrand from './BottomBrand.vue'

export default {
  components: {
    JoinText, BottomBrand
  },

  data () {
    return {
      videoBgImg: videoBgImg,
      thumbnailImg: thumbnailImg,
      previousArrowImg: previousArrowImg,
      nextArrowImg: nextArrowImg,
      wistiaVideoUrl: process.env.VUE_APP_WISTIA_ONBOARD_VIDEO_URL,
    }
  },

  methods: {
    nextStep() {
      this.$emit('next');
    },

    prevStep() {
      this.$emit('back');
    },
  },

  mounted() {
    console.log(process.env.VUE_APP_WISTIA_ONBOARD_VIDEO_URL);
  },
}
</script>

<style scoped lang="scss">
#page-7 {
  .page-content {
    top: 10%;
    left: 0;
    right: 0;
    margin: 0 auto;
  }

  .grey-box-flex {
    background: #f1f1f1;
    border-radius: 5px;
  }
}

</style>
