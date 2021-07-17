<template>
  <div id="home" class="row mt-5">
    <div class="bg-container">
      <div class="bg w-100 h-100"></div>
    </div>

    <div class="main">
      <div class="row">
        <!-- LEFT -->
        <div class="col-lg-8 col-md-7 col-12 ps-3 pe-5 mw-100" style="height: 100%;">
          <div class="row">
            <span class="title"> How to choose a domain </span>
          </div>
          <div class="video-frame mt-3">
            <img :src="thumbnailImg" class="h-100 w-100">
          </div>
        </div>
        <!-- LEFT -->

        <!-- RIGHT -->
        <div class="col-lg-4 col-md-5 mt-3 col-12 tab-container">
          <ul class="d-flex justify-content-between ps-2 pe-5" v-if="tabIndex != 0">
            <li v-for="(name, index) in tabList">
              <a href="#" @click.prevent="setTabIndex(index)" :class="{ 'tab-active': index == tabIndex }"> {{ name }} </a>
            </li>
          </ul>

          <div class="tab-content w-100 mt-5 pe-5 ps-2 overflow-scroll">
            <Videos v-if="tabIndex == 0"/>
            <Chat v-if="tabIndex == 1"/>
            <Notes v-if="tabIndex == 2"/>
            <Resources v-if="tabIndex == 3"/>
          </div>
        </div>
        <!-- RIGHT -->
      </div>
      
      <div class="text-center mt-5">
        <button class="btn btn-md btn-dark rounded-0 text-cnet" @click="nextStep">
          <span> Choose a Domain </span>
          <img :src="nextArrowImg" class="next-arrow">
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import thumbnailImg from '../../images/thumbnail.png'
import nextArrowImg from '../../images/next-arrow.png'

import Videos from './VideoTab.vue'
import Chat from './ChatTab.vue'
import Notes from './NoteTab.vue'
import Resources from './ResourceTab.vue'

export default {
  components: {
    Videos, Chat, Notes, Resources
  },

  data: function () {
    return {
      tabList: ["Videos", "Chat", "Notes", "Resources"],
      thumbnailImg: thumbnailImg,
      nextArrowImg: nextArrowImg,
      tabIndex: -1,
    }
  },

  methods: {
    setTabIndex: function(index) {
      this.tabIndex = index;
    }
  }
}
</script>

<style scoped lang="scss">
#home {
  .title {
    font-size: 35px;
  }

  .bg-container {
    width: 42%;
    height: 762px;

    .bg {
      background-image: url('/assets/video-bg.png');
      background-position: center;
      background-repeat: no-repeat;
      background-size: contain;
    }
  }
  .main {
    position: relative;
    left: 20px;
    top: -760px;

    .tab-container {
      ul {
        list-style-type: none;

        .tab-active {
          color: #a591cf;
          text-decoration: underline #a591cf;
          text-underline-offset: 10px;
          text-decoration-thickness: 6px;
        }

        .tab-content {
          padding: 10px;
        }
      }
    }
    ul > li {
      display: inline-block;

      a {
        text-decoration: none;
        font-size: 19px;
        color: #000000;
      }
    }
  }

  .tab-container {
    overflow: hidden;
    position: relative;

    @media only screen and (max-width: 767px) {
      overflow: unset;
      position: unset;
    }
  }

  .tab-content {
    position: absolute;
    height: 100%;
    @media only screen and (max-width: 767px) {
      height: unset;
      position: unset;
    }
  }
}

</style>
