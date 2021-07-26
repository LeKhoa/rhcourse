<template>
  <div class="bottom-brand-logo mx-auto mb-4">
    <img :src="bottomBrandLogo" class="w-100 h-100"/>
  </div>
</template>

<script>
import bottomBrandLogo from '../../images/rohan.png'

export default {
  components: {

  },

  data: function () {
    return {
      bottomBrandLogo: bottomBrandLogo,
    }
  },

  methods: {
  }
}
</script>

<style scoped lang="scss">
.bottom-brand-logo {
  margin-top: 70px;
  width: 77px;
  height: 17px;
}
</style>
