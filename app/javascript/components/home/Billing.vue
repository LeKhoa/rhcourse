<template>
  
  <div class="card-box col-md-6 col-11 border rounded p-5 mx-auto my-5">
    <div class="">
      <div v-if="error" class="text-center text-danger mt-3 fw-bold"> {{error}}</div>
      <div v-if="message" class="text-center text-success mt-3 fw-bold"> {{message}}</div>
      <div class="mt-3">
        <span> Subscription status: </span> 
        <span class= "fw-bold" 
          :class="{'text-success': status == 'active', 'text-danger': status != 'active'}"> {{status}} 
        </span>
        <br>
      </div>
      <hr>
      <div v-if="card">
        <label class="text-success fw-bold"> Card Details </label> <br>
        <div class="row mt-3">
          <div class="col-md-2 col-4">
            <span> Number: </span> 
          </div>
          <div class="col-md-10 col-8">
            <span class="fw-bold"> **** **** **** {{card.last4}} </span>
          </div>
        </div>

        <div class="row">
          <div class="col-md-2 col-4">
            <span> Expire: </span>
          </div>
          <div class="col-md-10 col-8">
            <span class="fw-bold">{{card.exp_month < 10 ? '0' + card.exp_month : card.exp_month }}/{{card.exp_year}}</span>
          </div>
        </div>
    
        <div class="row">
          <div class="col-md-2 col-4">
            <span> Brand: </span>
          </div>
          <div class="col-md-10 col-8">
            <span class="fw-bold">{{card.brand}}</span>
          </div>
        </div>
        <hr>
      </div>
      
      <div class="mt-3" v-if="inactive"> 
        <label class="text-success fw-bold"> Update card information </label>
        <div id="card-element" class="row m-0 align-items-center mt-2 border py-2 px-3">
          <!-- a Stripe Element will be inserted here. -->
        </div>

        <div class="row mt-3 justify-content-center" v-if="handling">
          <div class="spinner">
            <div class="spinner-blade" v-for="i in 12">
            </div>
          </div>
        </div>

        <div class="row justify-content-center">
          <div class="col-md-6 col-12 mt-4 btn-box">
            <button v-if="status && status != 'active' && status != 'virtual_active' " 
              class="btn rounded-0 btn-dark w-100 h-100 text-white" @click="reSubcribe()"
              :class="{disabled: handling}">
              <span> RESUBCRIBE</span>
            </button>

            <button v-else class="btn rounded-0 btn-dark w-100 h-100 text-white" @click="updateCard()"
              :class="{disabled: handling}">
              <span v-if="card"> UPDATE CARD</span>
              <span v-else> ADD CARD</span>
            </button>
          </div>
        </div>

        <div class="my-4 text-center">
          <img :src="cardLogos" class="mt-1"/>
          <img :src="stripePowered" class="ms-2 mt-1" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import cardLogos from 'images/card-logos.png'
import stripePowered from 'images/stripe-powered.png'

import { mapState, mapActions } from 'vuex';

export default {
  components: {

  },

  data () {
    return {
      card: null,
      cardElement: null,
      error: '',
      message: '',
      stripe: Stripe(process.env.STRIPE_PUBLISHABLE_KEY),
      cardLogos: cardLogos,
      stripePowered: stripePowered,
      handling: false,
    }
  },

  methods: {
    initStripeElements() {
      var elements = this.stripe.elements()
      this.cardElement = elements.create('card', { hidePostalCode: true });
      this.cardElement.mount('#card-element');        
    },

    updateCard() {
      this.handling = true;
      var context = this;
      this.clearLog();
      this.stripe.createToken(this.cardElement).then(function(result) {
        if (result.error) {
          context.error = result.error.message;
          this.handling = false;
        } else {
          context.error = '';
          context.handleUpdateCard(result.token.id);
        }
      });
    },

    handleUpdateCard(token) {
      let params = { token: token }
      this.$http.put('/api/users/update_card', params)
        .then(response => {
          if(this.card)
            this.message = 'Update card successfull'
          else
            this.message = 'Add card successfull'
          this.card = response.data.card;
          this.handling = false;
        }).catch(error => {
          this.error = error.response.data.message;
          this.handling = false;
      });
    },

    reSubcribe() {
      var context = this;
      this.handling = true;
      this.clearLog();
      this.stripe.createToken(this.cardElement).then(function(result) {
        if (result.error) {
          context.error = result.error.message;
          this.handling = false;
        } else {
          context.error = '';
          context.handleReSubcribe(result.token.id);
        }
      });
    },

    handleReSubcribe(token) {
      let params = { token: token }
      this.$http.put('/api/users/resubcribe', params)
        .then(response => {
          this.message = 'Resubcribe successfull'
          this.card = response.data.card;
          this.handling = false;
        }).catch(error => {
          this.error = error.response.data.message;
          this.handling = false;
      });
    },

    clearLog() {
      this.message = '';
      this.error = '';
    },

  },

  computed: {
    ...mapState(['currentUser']),

    status() {
      return this.currentUser.sub_status;
    },

    inactive() {
      if(this.status == 'active')
        return false;
      return true;
    }
  },

  mounted() {
    if (this.inactive) {
      this.initStripeElements();
    }
    this.$http.get(`/api/users/retrieve_card`)
      .then(response => {
        this.card = response.data.card;
      }).catch(error => {
        this.error = error.response.data.message;
    });
  }
}
</script>

<style scoped lang="scss">
  #card-element {
    height: 50px;
  }
</style>
