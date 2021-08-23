<template>
  <div class="stories mt-5 col-md-6 col-12 p-0 overflow-hidden">
    <div class="py-5 ps-5 me-n5">
      <div class="col-md-7 p-2">
        <img :src="storiesLabelImg" class="w-100"/>
      </div>

      <div class="row m-0 mt-4">
        <div class="col-6 ps-5 pe-0">
          <div class="wistia_responsive_padding" style="padding:55.94% 0 0 0;position:relative;">
            <div class="wistia_responsive_wrapper" style="height:100%;left:0;position:absolute;top:0;width:100%;">
              <iframe :src="wistiaVideos[index % wistiaVideos.length].url" title="Welcome Video" allow="autoplay; fullscreen" allowtransparency="true" frameborder="0" scrolling="no" class="wistia_embed" name="wistia_embed" allowfullscreen msallowfullscreen width="100%" height="100%"></iframe>
            </div>
          </div>
          <div class="mt-3 text-center"> {{wistiaVideos[index % wistiaVideos.length].title}} </div>
        </div>

        <div class="col-6 ps-5 pe-0">
          <div class="wistia_responsive_padding opacity-25" style="padding:55.94% 0 0 0;position:relative;">
            <div class="wistia_responsive_wrapper" style="height:100%;left:0;position:absolute;top:0;width:100%;">
              <iframe :src="wistiaVideos[(index+1) % wistiaVideos.length].url" title="Welcome Video" allow="autoplay; fullscreen" allowtransparency="true" frameborder="0" scrolling="no" class="wistia_embed" name="wistia_embed" allowfullscreen msallowfullscreen width="100%" height="100%"></iframe>
            </div>
          </div>
          <div class="mt-3 text-center"> {{wistiaVideos[(index+1) % wistiaVideos.length].title}} </div>
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
          <div class="wistia_responsive_padding" style="padding:55.94% 0 0 0;position:relative;">
            <div class="wistia_responsive_wrapper" style="height:100%;left:0;position:absolute;top:0;width:100%;">
              <iframe :src="wistiaVideos[(index+2) % wistiaVideos.length].url" title="Welcome Video" allow="autoplay; fullscreen" allowtransparency="true" frameborder="0" scrolling="no" class="wistia_embed" name="wistia_embed" allowfullscreen msallowfullscreen width="100%" height="100%"></iframe>
            </div>
          </div>
          <div class="mt-3 text-center"> {{wistiaVideos[(index+2) % wistiaVideos.length].title}} </div>
        </div>

        <div class="col-6 ps-5 pe-0">
          <div class="wistia_responsive_padding opacity-25" style="padding:55.94% 0 0 0;position:relative;">
            <div class="wistia_responsive_wrapper" style="height:100%;left:0;position:absolute;top:0;width:100%;">
              <iframe :src="wistiaVideos[(index+3) % wistiaVideos.length].url" title="Welcome Video" allow="autoplay; fullscreen" allowtransparency="true" frameborder="0" scrolling="no" class="wistia_embed" name="wistia_embed" allowfullscreen msallowfullscreen width="100%" height="100%"></iframe>
            </div>
          </div>
          <div class="mt-3 text-center"> {{wistiaVideos[(index+3) % wistiaVideos.length].title}} </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import storiesLabelImg from 'images/stories-label.png'

import prevStoryImg from 'images/previous.png'
import nextStoryImg from 'images/next.png'

export default {
  components: {

  },

  data: function () {
    return {
      storiesLabelImg: storiesLabelImg,
      wistiaVideos: [
        {
          url: 'https://fast.wistia.net/embed/iframe/g5pnf59ala',
          title: 'Christina - Multiple 6 figure business and travels the world'
        },
        {
          url: 'https://fast.wistia.net/embed/iframe/avk9twrrbn',
          title: 'Ryan - $1 million in the first 24 months after trying everything'
        },
        {
          url: 'https://fast.wistia.net/embed/iframe/pukozq6xf0',
          title: 'Elena - 600,000 in the first 18 months as an immigrant'
        },
        {
          url: 'https://fast.wistia.net/embed/iframe/j38ihh83m5',
          title: 'Toria - $150,000 in the first 12 months with zero experience'
        },
      ],
      index: 0,
      prevStoryImg: prevStoryImg,
      nextStoryImg: nextStoryImg,
    }
  },

  methods: {
    next() {
      if (this.index < this.wistiaVideos.length - 1)
        this.index ++;
      else
        this.index = 0;
    },

    prev() {
      if (this.index > 0)
        this.index --;
      else
        this.index = this.wistiaVideos.length - 1;
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
