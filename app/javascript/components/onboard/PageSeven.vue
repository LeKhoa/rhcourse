<template>
  <div id="page-7">
    <div class="row justify-content-center">
      <div class="col-lg-5 col-md-9 col-10 pe-5 ms-n3">
        <img :src="videoBgImg" class="w-100"/>

        <div class="col-lg-5 col-md-9 col-10 video-thumb position-absolute me-3">
          <img :src="thumbnailImg" class="h-100 w-100">
        </div>
      </div>

      <div class="col-lg-6 col-md-9 col-12 mt-5 p-5 text-center">
        <span class="title text-center"> Watch this 5 minute video and then proceed to the final page </span>
        <div class="mt-3" stype="font-size: 18px;"> Thanks, we qualify you based on 4 criteria. Check off each box that applies. </div>
        <div class="d-flex flex-wrap mt-3 justify-content-center">
          <div class="grey-box-flex mt-3 mx-2">
            <button class="btn w-100 h-100">
              <span class="fw-bold"> Motivation </span> <br>
              <span> I'm committed to doing </span> <br> <span>the work </span>
            </button>
          </div>

          <div class="grey-box-flex mt-3 mx-2">
            <button class="btn w-100 h-100"> 
              <span class="fw-bold"> Commitment </span> <br>
              <span>  I will show up for myself </span> <br> <span> consistently  </span>
            </button>
          </div>

          <div class="grey-box-flex mt-3 mx-2">
            <button class="btn w-100 h-100"> 
              <span class="fw-bold"> Coachability </span> <br>
              <span>  I'm open new ideas, and </span> <br> <span> ready to learn and implement </span>
            </button>
          </div>

          <div class="grey-box-flex mt-3 mx-2">
            <button class="btn w-100 h-100"> 
              <span class="fw-bold"> Finances </span> <br>
              <span>  I can afford $997 setup fee (website & tech) </span> <br> <span> and $197 per month for software and support </span>
            </button>
          </div>
        </div>

        <div class="mt-4"> If you checked off all 4 boxes... </div> 

        <div class="col-10 col-sm-8 col-md-7 col-xl-5 btn-box bg-green text-center mt-2 mx-auto">
          <button class="btn btn-md rounded-0 w-100 h-100 text-white" @click=""> PAY TO GET STARTED INSTANTLY
          </button>

          <div class="mt-2"> or </div>
          <div class="btn-box">
            <button class="btn btn-md rounded-0 w-100 h-100" @click=""> BOOK A CALL
            </button>
          </div>
        </div>
      </div>
    </div>

    <BottomBrand />
  </div>
</template>

<script>

import videoBgImg from '../../images/video-bg.png'
import thumbnailImg from '../../images/thumbnail.png'

import BottomBrand from './BottomBrand.vue'

export default {
  components: {
    BottomBrand
  },

  data: function () {
    return {
      videoBgImg: videoBgImg,
      thumbnailImg: thumbnailImg,
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
#page-7 {
  .grey-box-flex {
    background: #f1f1f1;
    border-radius: 5px;
  }
  .bg-green {
    background-color: #89c731;
  }
  .video-thumb {
    top: 100px;
    left: 4%;

    @media only screen and (max-width: 991px) {
      left: 10%;
    }

    @media only screen and (max-width: 767px) {
      left: 8%;
    }
  }
}

</style>
