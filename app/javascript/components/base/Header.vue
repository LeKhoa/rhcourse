<template>
  <div class="header" :style="backgroundImage">
    <div class="container-fluid">
      <div class="row h-100 py-2 ps-5 align-items-center">
        <div class="label col-lg-4 col-xl-3">
          <div> Get started on your </div>
          <div> business adventure </div>
        </div>

        <div class="col-lg-8 col-xs-9">
          <div class="d-flex flex-wrap">
            <div class="d-flex my-auto me-5 py-1">
              <div class="checked-circle">
                <img :src="checkedStepImg">
              </div>
              <span class="ps-2"> Join Rohan </span>
            </div>

            <div class=" d-flex my-auto me-5 py-1">
              <div class="checked-circle">
                <img :src="checkedStepImg">
              </div>
              <span class="ps-2"> Watch Lessons </span>
            </div>
            <div class="d-flex my-auto me-5 py-1">
              <span class="white-circle-25px"> </span>
              <span class="ps-2"> Set up Website </span>
            </div>
            <div class="d-flex my-auto me-5 py-1">
              <span class="white-circle-25px"> </span>
              <span class="ps-2"> Set up Operations </span>
            </div>
            <div class="d-flex my-auto py-2">
              <span class="white-circle-25px"> </span>
              <span class="ps-2"> Get First Customer </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import checkedStepImg from '../../images/checked-step.png'

export default {
  data: function () {
    return {
      message: "Wecome Rohan!",
      checkedStepImg: checkedStepImg,
      backgroundImage: { backgroundImage: "url('/assets/header-bg.png')" }
    }
  }
}
</script>

<style scoped lang="scss">
.header {
  font-size: 15px;

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
