<template>
  <div id="main" class="row w-100 mt-4 mb-5">
    <div class="bg-container position-absolute col-lg-6 col-md-6 col-10">
      <img :src="backgroundImage" class="w-100 h-100">
    </div>

    <div class="page-content">
      <div class="row p-4">
        <!-- LEFT -->
        <div class="col-lg-8 col-md-7 col-12 px-4 mw-100">
          <div class="row">
            <span class="title"> {{section.attributes.name}} </span>
          </div>

          <div class="video-frame mt-3">

            <!-- Wistia standard inline script 
            <script src="https://fast.wistia.com/embed/medias/1c421giono.jsonp" async></script>
            <script src="https://fast.wistia.com/assets/external/E-v1.js" async></script>
            <div class="wistia_responsive_padding" style="padding:55.94% 0 0 0;position:relative;">
              <div class="wistia_responsive_wrapper" style="height:100%;left:0;position:absolute;top:0;width:100%;">
                <div class="wistia_embed wistia_async_1c421giono videoFoam=true" style="height:100%;position:relative;width:100%">
                  <div class="wistia_swatch" style="height:100%;left:0;opacity:0;overflow:hidden;position:absolute;top:0;transition:opacity 200ms;width:100%;">
                    <img src="https://fast.wistia.com/embed/medias/1c421giono/swatch" style="filter:blur(5px);height:100%;object-fit:contain;width:100%;" alt="" aria-hidden="true" onload="this.parentNode.style.opacity=1;" />
                  </div>
                </div>
              </div>
            </div>
            -->

            <!-- Wistia fallback script -->
            <div class="wistia_responsive_padding" style="padding:55.94% 0 0 0;position:relative;">
              <div class="wistia_responsive_wrapper" style="height:100%;left:0;position:absolute;top:0;width:100%;">
                <iframe :src="wistiaVideoUrl" title="Fallback Embed Final Proof 1 Video" allow="autoplay; fullscreen" allowtransparency="true" frameborder="0" scrolling="no" class="wistia_embed" name="wistia_embed" allowfullscreen msallowfullscreen width="100%" height="100%"></iframe>
              </div>
            </div>

          </div>
        </div>

        <!-- RIGHT -->
        <div class="col-lg-4 col-md-5 mt-3 col-12 tab-container">
          <ul class="d-flex justify-content-between ps-3">
            <li v-for="key in Object.keys(tabList)">
              <a href="#" @click.prevent="setTabIndex(key)" :class="{ 'tab-active': key == tabIndex }"> {{ tabList[key] }} </a>
            </li>
          </ul>

          <div class="tab-content w-100 mt-5 px-3 overflow-scroll">
            <Videos v-if="tabList[tabIndex] == 'Videos'" @selectLesson="setLesson" :lessons="lessons" :selectedLesson="selectedLesson"/>
            <Chat v-if="tabList[tabIndex] == 'Chat'"/>
            <Notes v-if="tabList[tabIndex] == 'Notes'" :section="section" />
            <Resources v-if="tabList[tabIndex] == 'Resources'" :section="section" />
          </div>
        </div>
        <!-- RIGHT -->
      </div>
    </div>
  </div>
</template>

<script>
import thumbnailImg from '../../images/thumbnail.png'
import backgroundImage from 'images/video-bg.png'

import Videos from './VideoTab.vue'
import Chat from './ChatTab.vue'
import Notes from './NoteTab.vue'
import Resources from './ResourceTab.vue'

import { mapGetters } from 'vuex';

export default {
  components: {
    Videos, Chat, Notes, Resources
  },

  props: {
    section: Object,
  },

  data: function () {
    return {
      tabList: {
        '1': 'Videos',
        // 2: "Chat",
        '3': 'Notes',
        '4': "Resources"
      },
      thumbnailImg: thumbnailImg,
      wistiaVideoUrl: '',
      selectedLesson: null,
      lessons: [],
      tabIndex: '1',
      backgroundImage: backgroundImage,
    }
  },

  methods: {
    setTabIndex(index) {
      this.tabIndex = index;
    },

    setLesson(data = {}) {
      this.selectedLesson = data.lesson;
      this.wistiaVideoUrl =  this.setVideoUrl(this.selectedLesson.attributes.video);
    },

    setVideoUrl(url) {
      let videoHashId = url.split('/').slice(-1)[0];
      return `https://fast.wistia.net/embed/iframe/${videoHashId}`
    },

    updateWatchedLesson() {
      if (!this.selectedLesson.attributes.watched) {
        this.$http.post(`/api/sections/${this.section.id}/lessons/${this.selectedLesson.id}/watched`)
          .then(response => {
            this.updateClientLessonStatus();
          }).catch(error => {
            // this.error = error.response.data.message;
        });
      }
    },

    updateClientLessonStatus() {
      for(let i=0; i < this.lessons.length; i++) {
        if(this.lessons[i].id == this.selectedLesson.id){
          return this.lessons[i].attributes.watched = true;
        }
      }
    },

    getLessonSuccessfull(response) {
      this.lessons = response.data.data;
      this.selectedLesson = this.lessons[0];
      this.wistiaVideoUrl = this.setVideoUrl(this.selectedLesson.attributes.video);
    },

    ...mapGetters(['getDefaultWistiaVideo']),
  },

  created() {
    this.$http.get(`/api/sections/${this.section.id}/lessons`)
      .then(response => {
        this.getLessonSuccessfull(response);
      }).catch(error => {
        console.log(error);
    });
  },

  mounted() {
  }
}
</script>

<style scoped lang="scss">
#main {
  .title {
    font-size: 35px;

    @media only screen and (max-width: 575px) {
      font-size: 19px;
    }

    @media only screen and (min-width: 768px) and (max-width: 991px) {
      font-size: 30px;
    }
  }

  .bg-container {
    margin-top: -3%;
    margin-left: -13%;
  }

  .page-content {
    position: relative;

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
        color: #000000;

        @media only screen and (min-width: 576px) {
          font-size: 19px;
        }
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
