<template>
  <div id="course">
    <Welcome v-if="step == 0" @continue="nextStep" />
    <div v-if="step == 1">
      <div v-for="(section, index) in sections">
        <Section
          ref="mainRef"
          :section="section"
          v-if="index == sectionIndex"
        />
      </div>
      <div class="row mx-0 justify-content-center">
        <div class="col-md-2 col-10 col-sm-5 my-4" v-if="sectionIndex > 0">
          <button class="btn btn-lg btn-dark rounded-0 w-100" @click="prevSection">
            <img :src="prevArrowImg">
            <span> Previous section </span>
          </button>
        </div>
        <div class="col-md-2 col-10 col-sm-5 my-4" v-if="sectionIndex < (sections.length - 1)">
          <button class="btn btn-lg btn-dark rounded-0 w-100" @click="nextSection">
            <span> Next section </span>
            <img :src="nextArrowImg">
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import Welcome from './Welcome.vue'
import Section from './Section.vue'
import prevArrowImg from '../../images/previous-arrow.png'
import nextArrowImg from '../../images/next-arrow.png'

export default {
  components: {
    Welcome, Section,
  },

  data: function () {
    return {
      step: 0,
      sections: [],
      sectionIndex: 0,
      error: '',
      prevArrowImg: prevArrowImg,
      nextArrowImg: nextArrowImg,
    }
  },

  methods: {
    nextStep() {
      this.step++;
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
    }
  },

  mounted() {
    this.$http.get(`/courses/${this.$route.params.course_id}/sections`)
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
