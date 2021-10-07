<template>
  <div class="main p-5 pb-0">
    <div class="bg-white border rounded-top row m-0">
      <div class="col-md-8 border-end p-5">
        <Left />
      </div>
      <div class="col-md-4 px-5 py-3">
        <Right />
      </div>
    </div>
  </div>
</template>

<script>
import Left from './Left.vue'
import Right from './Right.vue'

import { mapState, mapActions } from 'vuex'

export default {
  components: {
    Left, Right,
  },

  data: function () {
    return {
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
  .main {
    background-color: #f3f3f3;

    @media only screen and (max-width: 575px) {
      padding: 0 !important;
    }
  }


</style>
