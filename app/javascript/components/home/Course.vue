<template>
  <div id="course">
    <div v-for="(section, index) in sections">
      <Section
        ref="mainRef"
        :section="section"
        v-if="index == sectionIndex"
      />
    </div>
    <div class="row mx-0 justify-content-center">
      <div class="col-xl-2 col-lg-3 col-md-4 col-8 col-sm-5 my-4 btn-box" v-if="sectionIndex > 0">
        <button class="btn rounded-0 w-100 h-100" @click="prevSection">
          <img :src="prevArrowImg">
          <span> Back </span>
        </button>
      </div>
      <div class="col-xl-2 col-lg-3 col-md-4 col-8 col-sm-5 my-4 btn-box" v-if="sectionIndex < (sections.length - 1)">
        <button class="btn btn-dark rounded-0 h-100 w-100" @click="nextSection">
          <span> Next section </span>
          <img :src="nextArrowImg">
        </button>
      </div>
    </div>
  </div>
</template>

<script>

import Section from './Section.vue'
import prevArrowImg from '../../images/previous-arrow.png'
import nextArrowImg from '../../images/next-arrow.png'

import { mapState, mapActions } from 'vuex'

export default {
  components: {
    Section,
  },

  data () {
    return {
      step: 0,
      sections: [],
      sectionIndex: this.lastSectionIndex() || 0,
      error: '',
      prevArrowImg: prevArrowImg,
      nextArrowImg: nextArrowImg,
      courseId: this.$route.params.id,
    }
  },

  methods: {

    lastSectionIndex() {
      return localStorage.getItem('lastSectionIndex');
    },

    nextSection() {
      if (this.sectionIndex < this.sections.length - 1)
        this.sectionIndex ++;
    },

    prevSection() {
      if (this.sectionIndex > 0)
        this.sectionIndex --;
    },

    registerWistiaEvent() {
      window._wq = window._wq || [];
      let context = this;
      _wq.push({ id: '_all', onReady: function(video) {
        // video.bind('play', function() {
        // });

        video.bind('end', function() {
          context.$refs.mainRef.updateWatchedLesson();
        });
      }});
    },

  },

  watch: {
    sectionIndex: function(val) {
      localStorage.setItem('lastSectionIndex', val);
    }
  },

  mounted() {
    this.$http.get(`/api/courses/${this.courseId}/sections`)
      .then(response => {
        this.sections = response.data.data;
        this.registerWistiaEvent();
      }).catch(error => {
        this.error = error.response;
    });
  }
}
</script>

<style scoped>

</style>
