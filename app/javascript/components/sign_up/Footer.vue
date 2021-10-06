<template>
  <div class="footer">
    <div class="row m-0 justify-content-between align-items-center px-5 py-3">
      <div class="col-md-4 col-12 text-center">
        <span class="text-white"> © 2021 Rohan Gilkes. All rights reserved </span>
        <div>
          <a class="link-decorated" href="https://27days2launch.com/termsofuse"> Terms of Use and Associated Policies </a>
        </div>
      </div>

      <div class="col-md-4 col-12 text-center">
        <a href="#">
          <img :src="overthinkImg" class="brand-img"/>
        </a>
      </div>

      <div class="col-md-4 col-12 text-end">
        <div>
          <a class="link" href="https://27days2launch.com/affiliate"> Affiliate </a>
        </div>
        <div>
          <a class="link" href="mailto:support@27days2launch.com">support@27days2launch.com</a>
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
  .footer {
    background-color: black;
    font-size: 18px;

    .brand-img {
      width: 50%;

      @media only screen and (max-width: 575px) {
        width: 100%;
      }
    }

    .link {
      text-decoration: none;
      color: rgba(255,255,255,0.69) !important;
    }

    .link-decorated {
      color: rgba(255,255,255,0.69) !important;
    }

    .link:hover, .link-decorated:hover {
      color: white !important;
    }
  }
</style>
