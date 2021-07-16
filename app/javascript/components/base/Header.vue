<template>
  <div class="header">
    <div class="container-fluid">
      <div class="row h-100 py-2 ps-5 align-items-center">
        <div class="label col-lg-4 col-xl-3">
          <div> Get started on your </div>
          <div> business adventure </div>
        </div>

        <div class="col-lg-8 col-xs-9">
          <div class="d-flex flex-wrap">
            <div class="col-lg-2 col-sm-6 col-12 col-md-4 px-2">
              <img :src="checkedStepImg">
              <span> Join Rohan </span>
            </div>

            <div class="col-lg-2 col-sm-6 col-12 col-md-4 px-2">
              <img :src="checkedStepImg">
              <span> Watch Lessons </span>
            </div>
            <div class="col-lg-2 col-sm-6 col-12 col-md-4 px-2">
              <img :src="checkedStepImg">
              <span> Set up Website </span>
            </div>
            <div class="col-lg-3 col-sm-6 col-12 col-md-4 ps-2">
              <img :src="checkedStepImg">
              <span> Set up Operations </span>
            </div>
            <div class="col-lg-3 col-sm-6 col-12 col-md-4 ps-2">
              <img :src="checkedStepImg">
              <span> Get First Customer </span>
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
    }
  }
}
</script>

<style scoped lang="scss">
.header {
  background-image: url('/assets/header-bg.png');
  font-size: 15px;

  .label {
    font-size: 24px;
  }

  .step-wrapper {
    width: 20%;
  }
}

</style>
