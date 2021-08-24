<template>
  <div class="mt-5 col-12 col-md-6 pb-5 border-end">
    <div class="card-box col-11 col-md-10 mt-5">
      <div class="title text-center"> You’re a step away from a life changing experience</div>
      <div class="row mt-4">
        <div class="col-6 sub-title">
          Let’s Make 2021 Your Best Year Ever
        </div>
        <div class="col-6 text-end sub-title">
          <span class="price-cross-line"> $597 per month</span>
          <span> $197 per month </span>
        </div>
      </div>

      <hr>

      <div class="mt-4">
        <label for="card-element">
          Credit Card Details
        </label>
        <div v-if="error" class="text-danger mt-3"> {{error}}</div>
        <div id="card-element" class="row m-0 align-items-center mt-2 border py-2 px-3">
          <!-- a Stripe Element will be inserted here. -->
        </div>
      </div>

      <div class="row mt-3 justify-content-center" v-if="isPaying">
        <div class="spinner">
          <div class="spinner-blade" v-for="i in 12">
          </div>
        </div>
      </div>

      <div class="col-12 mt-4 btn-box">
        <button class="btn rounded-0 bg-green w-100  h-100 text-white" :class="{disabled: isPaying}" @click="pay">
          <span> PAY TO GET STARTED INSTANTLY </span>
          <img :src="nextArrowImg" class="next-arrow">
        </button>
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
import nextArrowImg from '../../images/next-arrow.png'

import { mapState } from 'vuex';

export default {
  components: {

  },

  data: function () {
    return {
      cardLogos: cardLogos,
      stripePowered: stripePowered,
      secureLogo: secureLogo,
      secureContent: secureContent,
      stripe: Stripe(process.env.STRIPE_PUBLISHABLE_KEY),
      cardElement: null,
      error: '',
      nextArrowImg: nextArrowImg,
      isPaying: false,
    }
  },

  methods: {

    initStripeElements() {
      var elements = this.stripe.elements()
      this.cardElement = elements.create('card', { hidePostalCode: true });
      this.cardElement.mount('#card-element');        
    },

    pay() {
      var context = this;
      this.isPaying = true;
      this.stripe.createToken(this.cardElement).then(function(result) {
        if (result.error) {
          context.error = result.error.message;
          context.isPaying = false;
        } else {
          context.error = '';
          context.stripeTokenHandler(result.token.id);
        }
      });
    },

    stripeTokenHandler(token) {
      let params = this.buildParams(token);
      this.$http.put('/users.json', params)
        .then(response => {
          this.updateSuccessfull(response);
          this.isPaying = false;
        }).catch(error => {
          this.updateFailed(error);
          this.isPaying = false;
      });
    },

    updateSuccessfull(response) {  
      this.$router.push({ name: 'home' })
    },

    updateFailed(error) {
      this.error = error.response.data.message;
    },

    buildParams(token) {
      return {
        user: {
          business_status: this.userSettings.businessStatus,
          challenges: [...this.userSettings.challenges.keys()].filter(i => this.userSettings.challenges[i]),
          concerns: [...this.userSettings.concerns.keys()].filter(i => this.userSettings.concerns[i]),
          criterias: [...this.userSettings.criterias.keys()].filter(i => this.userSettings.criterias[i]),
        },
        token: token,
      }
    },

  },

  computed: {
    ...mapState(['userSettings']),
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
    font-size: 14px;
  }

  .btn-box {
    height: 60px;
  }

  #card-element {
    height: 50px;
  }

  $spinner-color: #69717d !default;

  .spinner {
    font-size: 25px;
    position: relative;
    display: inline-block;
    width: 1em;
    height: 1em;
  }

  .spinner-blade {
    position: absolute;
    left: .4629em;
    bottom: 0;
    width: .074em;
    height: .2777em;
    border-radius: .5em;
    background-color: transparent;
    transform-origin: center -.2222em;
    animation: spinner-fade 1s infinite linear;

    $animation-delay: 0s;
    $blade-rotation: 0deg;

    @for $i from 1 through 12 {
      &:nth-child(#{$i}) {
        animation-delay: $animation-delay;
        transform: rotate($blade-rotation);
        $blade-rotation: $blade-rotation + 30;
        $animation-delay: $animation-delay + .083;
      }
    }
  }

  @keyframes spinner-fade {
    0% {
      background-color: $spinner-color;
    }

    100% {
      background-color: transparent;
    }
  }

  .price-cross-line {
    background: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='110' height='7'> <path fill='red' fill-rule='evenodd' d='M.49 5.879L109.898.122l.052.998L.101 6.877l.389-.998z'/></svg>");
    background-repeat:no-repeat;
    background-position:center center;
  }

}

</style>
