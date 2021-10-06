<template>
  <div class="sign-up-form">

    <!-- Pricing -->
    <div class="row">
      <div class="col-6 fw-bold">ITEM</div>
      <div class="col-6 text-end fw-bold">PRICE</div>
      <hr>
    </div>
    <div class="row">
      <div class="col-6">Let’s Make 2021 Your Best Year Ever</div>
      <div class="col-6 text-end"> $197/month </div>
    </div>

    <!-- Signup form-->
    <div class="row mt-5">
      <div v-if="error" class="text-danger mb-3 text-center"> {{error}}</div>
      <div class="col-md-6">
        <label class="fw-bold"> NAME </label>
        <input class="form-control" placeholder="Name(*)" v-model="name">
      </div>
      <div class="col-md-6">
        <label class="fw-bold"> EMAIL </label>
        <input class="form-control" placeholder="Email(*)" v-model="email">
      </div>
    </div>

    <div class="row mt-3">
      <div class="col-md-6">
        <label class="fw-bold"> PASSWORD </label>
        <input type="password" class="form-control" placeholder="Password(*)" v-model="password">
      </div>
      <div class="col-md-6">
        <label class="fw-bold"> PHONE </label>
        <input class="form-control" placeholder="Phone" v-model="phone">
      </div>
    </div>

    <!-- Payment -->

    <div class="mt-5">
      <label class="fw-bold">CREDIT CARD</label>
      <div id="card-element" class="row m-0 align-items-center mt-2 border py-2 px-3 rounded">
        <!-- a Stripe Element will be inserted here. -->
      </div>
    </div>

    <div class="row mt-3 justify-content-center" v-if="running">
      <div class="spinner">
        <div class="spinner-blade" v-for="i in 12">
        </div>
      </div>
    </div>

    <div class="col-12 mt-4 btn-box">
      <button class="btn bg-heavy-green w-100 h-100 text-white" :class="{disabled: running}" @click="signUp">
        <span class="fw-bold"> CREATE MY ACCOUNT </span>
      </button>
    </div>

    <div class="my-4 text-center">
      <img :src="cardLogos" class="mt-1"/>
      <img :src="stripePowered" class="ms-2 mt-1" />
    </div>

    <div class="text-center mt-3"> By purchasing this product you agree to the
      <a href="https://27days2launch.com/termsofuse">terms of use and associated policies</a> 
      of 27Days2Launch 
    </div>

    <div class="mt-4 row justify-content-center">
      <div class="col-md-2 col-4">
        <img :src="secureLogo" class="w-100"/>
      </div>
      <div class="col-md-8 col-8">
        <span class="fw-bold"> SSL Secure Payment </span><br>
        <span> All orders are through a secure network. Your credit card<br>
          information is never stored in any way. We respect your privacy.
        </span>
      </div>
    </div>
  </div>
</template>

<script>

import cardLogos from 'images/card-logos.png'
import stripePowered from 'images/stripe-powered.png'
import secureLogo from 'images/secureLogo@2x.png'
import secureContent from 'images/secure-content.png'

import { mapState, mapActions } from 'vuex'

export default {
  components: {
  },

  data: function () {
    return {
      cardLogos: cardLogos,
      stripePowered: stripePowered,
      secureLogo: secureLogo,
      secureContent: secureContent,

      name: '',
      email: '',
      password: '',
      phone: '',
      error: '',
      running: false,
      stripe: Stripe(process.env.STRIPE_PUBLISHABLE_KEY),
      cardElement: null,
    }
  },

  methods: {
    ...mapActions(['setCurrentUser']),

    initStripeElements() {
      var elements = this.stripe.elements()
      this.cardElement = elements.create('card', { hidePostalCode: true });
      this.cardElement.mount('#card-element');        
    },

    handleSignUp(token) {
      var params = this.buildParams(token);

      this.$http.post('/users.json', params)
        .then(response => {
          this.running = false;
          this.signupSuccessfull(response)
        }).catch(error => {
          this.running = false;
          this.signupFailed(error.response.data.message)
      });
    },

    signUp() {
      var context = this;
      this.running = true;
      this.stripe.createToken(this.cardElement).then(function(result) {
        if (result.error) {
          context.error = result.error.message;
          context.running = false;
        } else {
          context.error = '';
          context.handleSignUp(result.token.id);
        }
      });
    },

    signupSuccessfull(response) {
      this.setCurrentUser(response.data.user);
      this.$router.replace({ name: 'welcome' });
    },

    signupFailed(error) {
      this.error = error;
      this.setCurrentUser(null)
    },

    buildParams(token) {
      return {
        user: {
          name: this.name,
          email: this.email,
          password: this.password,
          phone: this.phone,
        },
        token: token,
      }
    },
  },

  computed: {
  },

  mounted() {
    this.initStripeElements();

  }
}
</script>

<style scoped lang="scss">
  .sign-up-form {

    .bg-heavy-green {
      background-color: #56ba40;
    }

    .btn-box {
      height: 60px;
    }

    input, #card-element {
      height: 45px;
    }
  }
</style>
