<template>
  <div class="welcome container">
    <div class="bg-layer">
      <div class="row align-items-center justify-content-center">
        <div class="col-5 mx-auto">
          <img :src="welcomeImg1" class="w-100">
        </div>

        <div class="col-7 mx-auto">
          <img :src="welcomeImg2" class="w-100">
        </div>
      </div>
    </div>

    <div class="row justify-content-end position-relative mb-5 me-2">
      <div class="col-7 video-frame ps-5">
        <div class="wistia_responsive_padding" style="padding:55.94% 0 0 0;position:relative;">
          <div class="wistia_responsive_wrapper" style="height:100%;left:0;position:absolute;top:0;width:100%;">
            <iframe :src="wistiaWelcomeVideo" title="Welcome Video" allow="autoplay; fullscreen" allowtransparency="true" frameborder="0" scrolling="no" class="wistia_embed" name="wistia_embed" allowfullscreen msallowfullscreen width="100%" height="100%"></iframe>
          </div>
        </div>
      </div>

      <div class="mt-5 text-end">
        <button class="btn btm-sm btn-md btn-lg btn-dark rounded-0" @click="nextStep">
          <span> Next step </span>
          <img :src="nextArrowImg" class="next-arrow">
        </button>
      </div>
    </div>

  </div>
</template>

<script>
import nextArrowImg from '../../images/next-arrow.png'

import welcomeImg1 from '../../images/welcome.png'
import welcomeImg2 from 'images/welcome-bg.png'

import { mapState, mapActions } from 'vuex';

export default {
  props: {
    courses: Array,
  },

  components: {
  },

  data: function () {
    return {
      nextArrowImg: nextArrowImg,
      welcomeImg1: welcomeImg1,
      welcomeImg2: welcomeImg2,
      wistiaWelcomeVideo: process.env.VUE_APP_WISTIA_WELCOME_VIDEO_URL || 'https://fast.wistia.net/embed/iframe/2t0aesntyr',
    }
  },
  methods: {
    nextStep: function() {
      this.$router.replace({
        name: 'courses',
        params: { id: this.courses[0].id }
      })
    }
  },

}
</script>

<style scoped lang="scss">
.welcome {
  .bg-layer {
    position: absolute;
    left: 10%;
    right: 10%;
  }

  .video-frame {
    margin-top: 14%;
  }

  .next-arrow {
    width: 15px;
    height: 12px;
  }
}
</style>
