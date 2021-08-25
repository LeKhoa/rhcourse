<template>
  <div id="classroom">
    <div class="container py-4 px-5">
      <div class="personal row align-items-center justify-content-between">
        <div class="col-12 col-lg-9">
          <div class="row">
            <div class="col-10 col-sm-5 col-md-4 text-center pt-4 pe-4">
              <div class="avatar mx-auto">
                <img :src="imageUrl" class="w-100 h-100 rounded-circle">
              </div>
              <h1 class="mt-3"> {{currentUser.name}} </h1>
            </div>
            <div class="col-12 col-sm-7 col-md-8 mt-5">
              <h1> Welcome to Classroom 11</h1>
              <span class="text-black-50"> Learn together, Create together</span>

              <div class="row mt-3">
                <div class="col-6 col-md-3">
                  <h2> 45 </h2>
                  <span> Classmates </span>
                </div>
                <div class="col-6 col-md-2">
                  <h2> 20 </h2>
                  <span> Cities </span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-12 col-lg-3 mt-3">
          <div class="col-12 col-sm-7 col-lg-12 float-end">
            <button class="btn btn-dark rounded-0 text-start w-100">
              <img :src="fbImg">
              <span class="ms-2"> Join Classmates</span>
            </button>
          </div>
          <div class="col-12 col-sm-7 col-lg-12 mt-2 float-end">
            <button class="btn btn-dark rounded-0 text-start w-100">
              <img  :src="callImg" >
              <span class="ms-2"> Join Alumi </span>
            </button>
          </div>
        </div>
      </div>
      <hr>
      <div class="classmates mt-3">
        <h2> Classmates </h2>
        <div class="mt-3"> </div>

        <div class="d-flex flex-wrap justify-content-center">
          <div class="mx-3 mt-3 text-center" v-for="member in classmates">
            <div class="member-avatar">
              <img :src="member.attributes.image_url || defaultAvatar" class="w-100 h-100 rounded-circle">
            </div>
            <div class="mt-3">{{member.attributes.name}} </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import Header from '../home/Header.vue'
import defaultAvatar from 'images/default-avatar.png'
import fbImg from 'images/fb.png'
import callImg from 'images/call.png'

import { mapState } from 'vuex'

export default {
  components: {
    Header,
  },


  data: function () {
    return {
      fbImg: fbImg,
      callImg: callImg,
      defaultAvatar: defaultAvatar,
      classmates: [],
      error: '',
    }
  },

  methods: {

  },

  computed: {
    ...mapState(['currentUser']),
    imageUrl() {
      return this.currentUser.image_url || this.defaultAvatar;
    }
  },

  mounted() {
    this.$http.get(`/courses/${this.$route.params.course_id}/classmates`)
      .then(response => {
        this.classmates = response.data.data;
      }).catch(error => {
        this.error = error.response;
    });
  },
}
</script>

<style scoped lang="scss">
  .title {
    font-size: 35px;
  }

  .sub-title {
    font-size: 25px;
  }

  .avatar {
    width: 200px;
    height: 200px;
  }

  .member-avatar {
    width: 100px;
    height: 100px;

    @media only screen and (max-width: 575px) {
      width: 60px;
      height: 60px;
    }
  }

</style>
