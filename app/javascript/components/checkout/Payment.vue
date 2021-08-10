<template>
  <div class="mt-5 col-12 col-md-6 pb-5 border-end">
    <div class="card-box col-11 col-md-10 mt-5">
      <div class="title text-center"> You are a step away from lorem ipusm! </div>
      <div class="row mt-4">
        <div class="col-7 sub-title">
          Let’s Make 2021 Your Best Year Ever
        </div>
        <div class="col-5 text-end sub-title">
          $197 per month
        </div>
      </div>

      <hr>

      <div class="mt-4">
        <label for="card-element">
          Credit Card Details
        </label>
        <div id="card-element" class="col-12 mt-1 border p-2">
          <!-- a Stripe Element will be inserted here. -->
        </div>
      </div>

      <div class="col-12 mt-4 btn-box">
        <button class="btn btn-lg rounded-0 bg-green w-100  h-100 text-white" @click="pay"> PAY TO GET STARTED INSTANTLY </button> 
      </div>

      <div class="my-4 text-center">
        <img :src="cardLogos" class="mt-1"/>
        <img :src="stripePowered" class="ms-2 mt-1" />
      </div>
      <hr>
      <div class="mt-5 row justify-content-center">
        <div class="col-2">
          <img :src="secureLogo" class="w-100"/>
        </div>
        <div class="col-6">
          <img :src="secureContent" class="w-100"/>
        </div>
      </div>

    </div>
  </div>
</template>

<script>

import cardLogos from 'images/card-logos.png'
import stripePowered from 'images/stripe-powered.png'
import secureLogo from 'images/secureLogo@2x.png'
import secureContent from 'images/secure-content.png'

export default {
  components: {

  },

  data: function () {
    return {
      cardLogos: cardLogos,
      stripePowered: stripePowered,
      secureLogo: secureLogo,
      secureContent: secureContent,
      stripe: Stripe("pk_test_51Ipa6tC9SFRSMa9chAYD3g7IEjA6nlOROYUePlY7TdhbU2YpTFCB3K2k9mnALDTUXtwzSowJ9UlW8W2GSMPL3K3W00vD83OB7j"),
      cardElement: null,
    }
  },

  methods: {

    initStripeElements() {
      var elements = this.stripe.elements()
      this.cardElement = elements.create('card');
      this.cardElement.mount('#card-element');        
    },

    pay() {
      this.$router.push({ name: 'home' })
    }
  },

  mounted() {
    this.initStripeElements();
  }
}
</script>

<style scoped lang="scss">
.card-box {
  .title {
    font-size: 27px;
  }
  .sub-title {
    font-size: 12px;
    font-weight: bold;
  }
  .btn-box {
    height: 60px;
  }

}

</style>
