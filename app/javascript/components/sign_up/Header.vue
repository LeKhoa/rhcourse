<template>
  <div class="header">
    <div class="row m-0 justify-content-between align-items-center px-5 py-3">
      <div class="col-md-5">
        <a href="#">
          <img :src="overthinkImg" class="brand-img"/>
        </a>
      </div>

      <div class="col-md-7">
        <div class="row align-items-center">
          <div class="col-md-6">
            <span> Offer Automatically Expires 10/06/2021 </span>
          </div>

          <div class="col-md-6">
            <!-- COUNTING -->
            <div class="row align-items-center">
              <div class="counting col-md-8">
                <div class="row">
                  <div class="col-3 px-0 hours text-center">
                    <div class="count-box py-2"> 2 </div>
                    <span> HOURS </span>
                  </div>

                  <div class="col-3 px-0 minutes text-center">
                    <div class="count-box py-2"> 14 </div>
                    <span> MINUTES </span>
                  </div>

                  <div class="col-3 px-0 seconds text-center">
                    <div class="count-box py-2"> 4 </div>
                    <span> SECONDS </span>
                  </div>
                </div>
              </div>

              <div class="col-md-4">
                <button class="btn btn-md btn-dark border-white">
                  <a class="link" href="/users/sign_in"> Login </a>
                </button>
              </div>
            </div>
            <!-- COUNTING -->
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import { mapState, mapActions } from 'vuex'
import overthinkImg from 'images/overthink.svg'

export default {
  components: {

  },

  data: function () {
    return {
      overthinkImg: overthinkImg,
    }
  },

  methods: {

  },

  computed: {
  },

  mounted() {

  }
}
</script>

<style scoped lang="scss">
  .header {
    background-color: black;
    font-size: 18px;
    color: white;

    .brand-img {
      width: 25%;

      @media only screen and (max-width: 575px) {
        width: 100%;
      }
    }

    .link {
      text-decoration: none;
      color: white;
    }
    
    .counting {
      .count-box {
        background-color: white;
        color: #56ba40;
        width: 100% !important;
      }
      
      span {
        font-size: 8px;
      }

      .hours, .minutes, .seconds {
        margin-left: 3px;

        .count-box {
          font-size: 25px;
        }
      }
    }
  }
</style>
