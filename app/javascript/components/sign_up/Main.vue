<template>
  <div class="main">
    <div class="row m-0">
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
    
  }
</style>
