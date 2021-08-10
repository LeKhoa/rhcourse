<template>
  <div class="content row me-0">
    <Payment />
    <Stories />
  </div>
</template>

<script>

import Payment from './Payment.vue'
import Stories from './Stories.vue'

export default {
  components: {
    Payment, Stories
  },

  data: function () {
    return {
    }
  },

  methods: {

  },

  mounted() {

  }
}
</script>

<style scoped lang="scss">
.content {
  padding-left: 10%;
}

</style>
