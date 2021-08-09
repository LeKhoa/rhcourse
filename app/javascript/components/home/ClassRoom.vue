<template>
  <div id="classroom">
    <div class="container p-5">
      <div class="personal row align-items-center justify-content-between">
        <div class="col-12 col-md-9">
          <div class="row">
            <div class="col-12 col-md-4">
              <img :src="userImg" class="w-100">
              <span class="title"> Aliyah Smith </span>
            </div>
            <div class="col-md-8 col-12 mt-4">
              <span class="title"> Welcome to Classroom 11</span><br>
              <span class="text-black-50"> Learn together, Create together</span>

              <div class="row mt-3">
                <div class="col-6 col-md-3">
                  <div class="sub-title"> 45 </div>
                  <span class=""> Classmates </span>
                </div>
                <div class="col-6 col-md-2">
                  <div class="sub-title"> 20 </div>
                  <span class=""> Cities </span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-12 col-md-3">
          <div class="col-9 float-end">
            <button class="btn btn-dark rounded-0 w-100">
              <img :src="fbImg">
              <span> Join Classmates</span>
            </button>
          </div>
          <div class="col-9 mt-2 float-end">
            <button class="btn btn-dark rounded-0 w-100">
              <img  :src="callImg" >
              <span> Join Alumi </span>
            </button>
          </div>
        </div>
      </div>
      <hr>
      <div class="classmates">
        <span class="mt-5 sub-title"> Classmates </span>
      </div>
    </div>
  </div>
</template>

<script>

import Header from '../home/Header.vue'
import userImg from 'images/img.png'
import fbImg from 'images/fb.png'
import callImg from 'images/call.png'

export default {
  components: {
    Header,
  },


  data: function () {
    return {
      userImg: userImg,
      fbImg: fbImg,
      callImg: callImg,
    }
  },

  methods: {

  },

  mounted() {

  }
}
</script>

<style scoped>
  .title {
    font-size: 35px;
  }

  .sub-title {
    font-size: 25px;
  }

</style>
