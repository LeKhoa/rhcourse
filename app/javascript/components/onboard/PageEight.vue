<template>
  <div id="page-8">
    <div class="col-12 col-sm-10 col-md-9 col-xl-6 mx-auto text-center">
      <div class="mt-5 title"> Thanks, we qualify you based on 4 criteria. Check off each box that applies. </div>
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

      <div class="col-8 col-sm-7 col-md-6 col-lg-5 mt-3 mx-auto" >
        <div class="btn-box bg-green text-center mt-2">
          <button class="btn btn-md rounded-0 w-100 h-100 text-white" @click=""> PAY TO GET STARTED INSTANTLY
          </button>
        </div>

        <div class="mt-2 text-black-50"> or </div>
        <div class="btn-box">
          <button class="btn btn-md rounded-0 w-100 h-100 text-muted" @click=""> BOOK A CALL
          </button>
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
#page-8 {
  .grey-box-flex {
    background: #f1f1f1;
    border-radius: 5px;
  }

  .bg-green {
    background-color: #89c731;
  }
}

</style>
