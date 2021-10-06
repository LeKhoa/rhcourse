<template>
  <div class="left">
    <div class="col-md-9 mx-auto">
      <img :src="bannerImg" class="w-100"/>
    </div>
    
    <div class="mt-5 col-md-10 mx-auto">
      <Form />
    </div>
  </div>
</template>

<script>

import Form from './Form.vue'
import bannerImg from 'images/offer.png'

import { mapState, mapActions } from 'vuex'

export default {
  components: {
    Form,
  },

  data: function () {
    return {
      bannerImg: bannerImg,
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
  .left {
    
  }
</style>
