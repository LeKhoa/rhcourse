<template>
  <div class="stories mt-5 col-md-6 col-12 p-0">
    <div class="py-5 ps-5">
      <img :src="cusomerStoriesImg" class="w-100"/>
    </div>
  </div>
</template>

<script>

import cusomerStoriesImg from 'images/customer-stories.png'

export default {
  components: {

  },

  data: function () {
    return {
      cusomerStoriesImg: cusomerStoriesImg,
    }
  },

  methods: {

  },

  mounted() {

  }
}
</script>

<style scoped lang="scss">
.stories {

}

</style>
