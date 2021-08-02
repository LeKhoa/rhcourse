<template>
  <div id="page-1">
    <form>
      <div class="col-md-6 col-sm-8 col-10 mt-5 mx-auto text-center">
        <div class="checked-circle mx-auto">
          <img :src="checkedStepImg" class="w-100 h-100">
        </div>
        <div class="title mt-5"> Let's Built Something That Changes Your Life Forever! </div>
        <div class="mt-3 text-danger" v-if="error">{{ error }} </div>
        <div class="row mt-3">
          <div class="col-6">
            <input class="form-control shadow-none rounded-0" placeholder="Name" v-model="name">
          </div>
          <div class="col-6">
            <input class="form-control shadow-none rounded-0" placeholder="Email" v-model="email">
          </div>
        </div>

        <div class="row mt-3">
          <div class="col-6">      
            <div class="input-group">
              <span class="input-group-text rounded-0">+1</span>
              <input type="text" class="form-control shadow-none rounded-0 bg-white" placeholder="Phone" v-model="phone">
            </div>
          </div>
          <div class="col-6">
            <select class="form-select shadow-none rounded-0" aria-label="Default select example" v-model="budgetType">
              <option selected disabled hidden value="0"> Monthly Budget </option>
              <option value="1"> $200-$500 </option>
              <option value="2"> $500-$2,000 </option>
              <option value="3"> $2,000-$5,000 </option>
              <option value="4"> $5,000-$10,000 </option>
              <option value="5"> $10,000+ </option>
            </select>
          </div>
        </div>

        <div class="col-6 col-sm-5 mx-auto btn-box mt-5">
          <button class="btn btn-dark w-100 h-100" @click.prevent="signUp"> Let's Get Started</button>
        </div>

        <JoinText />
        <BottomBrand />
        
      </div>
    </form>
  </div>
</template>

<script>

import checkedStepImg from '../../images/checked-green.png'

import BottomBrand from './BottomBrand.vue'
import JoinText from './JoinText.vue'

// Vuex store
import { mapState, mapActions } from 'vuex';

export default {
  components: {
    BottomBrand, JoinText,
  },

  data: function () {
    return {
      checkedStepImg: checkedStepImg,
      name: '',
      email: '',
      phone: '',
      budgetType: 0,
      error: '',
    }
  },

  methods: {
    ...mapActions(['setCurrentUser']),

    signUp(e) {
      e.preventDefault();
      let params = this.userParams();
      this.$http.post('/users.json', params)
        .then(response => {
          this.signupSuccessfull(response)
        }).catch(error => {
          this.signupFailed(error)
      });
    },

    userParams() {
      return {
        user: {
          name: this.name,
          email: this.email,
          phone: this.phone,
          budget_type: parseInt(this.budgetType),
        }
      }
    },

    signupSuccessfull(response) {
      this.setCurrentUser(response.data.user)
    },

    signupFailed(error) {
      this.error = error.response.data.message;
      this.setCurrentUser(null)
    },

  },
  
  mounted() {
  },
}
</script>

<style scoped lang="scss">
#page-1 {
  input, select {
    height: 50px;
  }
}
</style>
