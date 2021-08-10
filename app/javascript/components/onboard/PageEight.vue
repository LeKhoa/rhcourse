<template>
  <div id="page-8">
    <div class="col-12 col-sm-10 col-md-9 col-xl-6 mx-auto text-center">
      <div class="mt-5 title"> Thanks, we qualify you based on 4 criteria. Check off each box that applies. </div>
      <div class="d-flex flex-wrap mt-3 justify-content-center">
        <div class="grey-box-flex mt-3 mx-2" v-for="(criteria, index) in criterias">
          <button class="btn w-100 h-100" @click="setCriterias(index)" :class="{ selected: userSettings.criterias[index] }">
            <span class="fw-bold"> {{criteria}} </span> <br>
            <div v-if="index==0">
              <span> I'm committed to doing </span> <br>
              <span>the work </span>
            </div>
            <div  v-if="index==1">
              <span>  I will show up for myself </span> <br>
              <span> consistently  </span>
            </div>
            <div v-if="index==2">
              <span >  I'm open new ideas, and </span> <br>
              <span> ready to learn and implement </span>
            </div>
            <div v-if="index==3">
              <span> I can afford $197 per month </span> <br> <span> (Course, website, tech support, software, and community) </span>
            </div>
          </button>
        </div>

      </div>

      <div class="mt-4"> If you checked off all 4 boxes... </div> 

      <div class="col-8 col-sm-7 col-md-6 col-lg-5 mt-3 mx-auto" >
        <div class="btn-box bg-green text-center mt-2">
          <button class="btn btn-md rounded-0 w-100 h-100 text-white" :class="{disabled: !isSelected}" @click="pay"> PAY TO GET STARTED INSTANTLY
          </button>
        </div>

        <div class="mt-2 text-black-50"> or </div>
        <div class="btn-box">
          <button class="btn btn-md rounded-0 w-100 h-100 text-muted" :class="{disabled: !isSelected}" @click="bookACall"> BOOK A CALL
          </button>
        </div>
      </div>
    </div>

    <BottomBrand />
  </div>
</template>

<script>

import videoBgImg from '../../images/video-bg.png'
import thumbnailImg from '../../images/thumbnail.png'

import BottomBrand from './BottomBrand.vue'
// Vuex
import { mapState, mapActions } from 'vuex';

export default {
  components: {
    BottomBrand
  },

  data: function () {
    return {
      videoBgImg: videoBgImg,
      thumbnailImg: thumbnailImg,
      criterias: [
        'Motivation', 'Commitment', 'Coachability', 'Finances',
      ],
      error: '',
    }
  },

  methods: {
    pay() {
      this.updateUser();
    },

    bookACall() {

    },

    updateUser() {
      let params = this.userParams();
      this.$http.put('/users.json', params)
        .then(response => {
          this.updateSuccessfull(response);
        }).catch(error => {
          this.updateFailed(error);
      });
    },

    updateSuccessfull(response) {  
      this.$router.push({ name: 'checkout' });
    },

    updateFailed(error) {
      this.error = error.response.data.message;
    },

    userParams() {
      return {
        user: {
          business_status: this.userSettings.businessStatus,
          challenges: [...this.userSettings.challenges.keys()].filter(i => this.userSettings.challenges[i]),
          concerns: [...this.userSettings.concerns.keys()].filter(i => this.userSettings.concerns[i]),
          criterias: [...this.userSettings.criterias.keys()].filter(i => this.userSettings.criterias[i]),
        }
      }
    },

    ...mapActions({
      setCriterias: 'setCriterias',
    }),
  },

  computed: {
    ...mapState(['userSettings']),

    isSelected() {
      return this.userSettings.criterias.some(v=> v);
    }
  }
}
</script>

<style scoped lang="scss">
#page-8 {
  .grey-box-flex {
    background: #f1f1f1;
    border-radius: 5px;
  }
}

</style>
