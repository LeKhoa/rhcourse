<template>
  <div class="header">
    
    <div class="first">
      <div class="row h-100 me-0">
        <div class="col-5 col-md-2 mx-auto my-auto text-center">
          <img :src="rohanImg" class="brand">
        </div>
      </div>
    </div>
    
    <div class="second d-flex align-items-center" :style="backgroundImage">
      <div class="content row w-100 py-2">
        <div class="label col-lg-3 col-xl-2">
          <div> What you get </div>
        </div>

        <div class="col-lg-9 col-xs-10">
          <div class="d-flex flex-wrap justify-content-between">
            <div class="d-flex my-auto py-1">
              <div class="checked-circle">
                <img :src="checkedStepImg">
              </div>
              <span class="ps-2"> Rohan Academy </span>
            </div>

            <div class="d-flex my-auto py-1">
              <div class="checked-circle">
                <img :src="checkedStepImg">
              </div>
              <span class="ps-2"> Mentorship </span>
            </div>
            <div class="d-flex my-auto py-1">
              <div class="checked-circle">
                <img :src="checkedStepImg">
              </div>
              <span class="ps-2"> Website </span>
            </div>
            <div class="d-flex my-auto py-1">
              <div class="checked-circle">
                <img :src="checkedStepImg">
              </div>
              <span class="ps-2"> Community </span>
            </div>
            <div class="d-flex my-auto py-2">
              <div class="checked-circle">
                <img :src="checkedStepImg">
              </div>
              <span class="ps-2"> Booking Software </span>
            </div>

            <div class="d-flex my-auto py-2">
              <div class="checked-circle">
                <img :src="checkedStepImg">
              </div>
              <span class="ps-2"> Hiring Software </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import checkedStepImg from '../../images/checked-step.png'
import rohanImg from 'images/rohan@2x.png'

export default {
  data: function () {
    return {
      rohanImg: rohanImg,
      checkedStepImg: checkedStepImg,
      backgroundImage: { backgroundImage: 'url(' + require('images/header-bg.png') + ')'}
    }
  }
}
</script>

<style scoped lang="scss">
.header {
  font-size: 15px;

  .first {
    background-color: #1d1d1d;
    height: 80px;

    .brand {
      height: 25px;
    }
  }

  .second {
    min-height: 100px;
    .content {
      padding-left: 10%;
    }
  }

  .label {
    font-size: 24px;
  }

  .step-wrapper {
    width: 20%;
  }

  .white-circle-25px {
    height: 25px;
    width: 25px;
    background-color: white;
    border-radius: 50%;
    display: inline-block;
  }

  .checked-circle {
    height: 25px;
    width: 25px;
  }
}

</style>
