<template>
  <div id="welcome">
    <div class="container welcome-wrapper">
      <div class="row">
        <div class="col-md-10 col-lg-5">
          <div class="welcome-img px-3 ms-4">
            <img :src="welcomeImg" class="h-100 w-100">
          </div>
        </div>

        <div class="col-md-12 col-lg-6 ps-5 video-container" :style="backgroundImage">
          <div class="ms-5">
            <div class="video-thumb">
              <img :src="thumbnailImg" class="h-100 w-100">
            </div>
            <div class="mt-5 text-end">
              <button class="btn btn-md btn-dark rounded-0" @click="nextStep">
                <span> Next step </span>
                <img :src="nextArrowImg" class="next-arrow">
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Header from '../base/Header.vue'

import welcomeImg from '../../images/welcome.png'
import thumbnailImg from '../../images/thumbnail.png'
import nextArrowImg from '../../images/next-arrow.png'

export default {
  components: {
    Header
  },

  data: function () {
    return {
      welcomeImg: welcomeImg,
      thumbnailImg: thumbnailImg,
      nextArrowImg: nextArrowImg,
      backgroundImage: {
        backgroundImage: 'url(' + require('images/welcome-bg.png') + ')',
        backgroundPosition: 'center',
        backgroundRepeat: 'no-repeat',
        backgroundSize: 'contain',
      }
    }
  },
  methods: { 
    nextStep: function() {
      this.$emit('continue');
    }
  }
  
}
</script>

<style scoped lang="scss">
.welcome-wrapper {
  min-height: 1000px;

  .video-container {
  
    .video-thumb {
      margin-top: 180px;
    }
  }

  .welcome-img {
    margin-top: 180px;
    max-width: 484px;
    max-height: 350px;
  }

  .next-arrow {
    width: 15px;
    height: 12px;
  }
}
</style>
