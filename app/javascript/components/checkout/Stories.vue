<template>
  <div class="stories mt-5 col-md-6 col-12 p-0 overflow-hidden">
    <!--
    <div class="py-5 ps-5 overflow-hidden">
      <img :src="cusomerStoriesImg" class="w-100 ms-5"/>
    </div>
    -->
    <div class="py-5 ps-5 me-n5">
      <div class="col-md-7 p-2">
        <img :src="storiesLabelImg" class="w-100"/>
      </div>

      <div class="row m-0 mt-4">
        <div class="col-6 ps-5 pe-0">
          <img :src="images[index % images.length]" class="w-100"/>
        </div>

        <div class="col-6 ps-5 pe-0">
          <img :src="images[(index + 1) % images.length]" class="w-100 opacity-25"/>
        </div>
      </div>

      <div class="row m-0 controller position-relative mt-n4">
        <div class="col-6 p-0">
          <button class="bg-white border-0 p-0" @click="prev">
            <img :src="prevStoryImg" class="w-100"/>
          </button>
        </div>
        <div class="col-6 ps-5 pe-0">
          <button class="bg-white border-0 p-0" @click="next">
            <img :src="nextStoryImg" class="w-100"/>
          </button>
        </div>
      </div>

      <div class="row m-0 mt-4">
        <div class="col-6 ps-5 pe-0">
          <img :src="images[(index+2) % images.length]" class="w-100"/>
        </div>

        <div class="col-6 ps-5 pe-0">
          <img :src="images[(index + 3) % images.length]" class="w-100 opacity-25"/>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import cusomerStoriesImg from 'images/customer-stories.png'

import storiesLabelImg from 'images/stories-label.png'
import storyChristina from 'images/story-christina.png'
import storyRyan from 'images/story-ryan.png'
import storyElena from 'images/story-elena.png'
import storyToria from 'images/story-toria.png'

import prevStoryImg from 'images/previous.png'
import nextStoryImg from 'images/next.png'

export default {
  components: {

  },

  data: function () {
    return {
      cusomerStoriesImg: cusomerStoriesImg,
      storiesLabelImg: storiesLabelImg,
      images: [
        storyChristina,
        storyRyan,
        storyElena,
        storyToria,
      ],
      index: 0,
      prevStoryImg: prevStoryImg,
      nextStoryImg: nextStoryImg,
    }
  },

  methods: {
    next() {
      if (this.index < this.images.length - 1)
        this.index ++;
      else
        this.index = 0;
    },

    prev() {
      if (this.index > 0)
        this.index --;
      else
        this.index = this.images.length - 1;
    }
  },

  mounted() {

  }
}
</script>

<style scoped lang="scss">
.stories {
  .opacity-25 {
    opacity: .25;
  }
}

</style>
