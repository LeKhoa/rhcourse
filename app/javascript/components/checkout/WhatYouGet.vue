<template>
  <div class="what-you-get">
    <div class="col-10">
      <img :src="whatYouGetImg" class="w-100"/>
    </div>
  </div>
</template>

<script>

import whatYouGetImg from 'images/what-you-get@2x.png'

export default {
  components: {

  },

  data: function () {
    return {
      whatYouGetImg: whatYouGetImg,
    }
  },

  methods: {

  },

  mounted() {

  }
}
</script>

<style scoped lang="scss">
.what-you-get {
  margin-left: 10%;
}

</style>
