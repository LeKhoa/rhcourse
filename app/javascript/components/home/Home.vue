<template>
  <div class="home-page">
    <Header />
    <Welcome v-if="step == 0" @continue="nextStep" />
    <div v-if="step == 1" v-for="(section, index) in sections">
      <Main ref="mainRef" :section="section" v-if="index == sectionIndex" @nextSection="nextSection"/>
    </div>
  </div>
</template>

<script>

import Header from './Header.vue'
import Welcome from './Welcome.vue'
import Main from './Main.vue'

export default {
  components: {
    Header, Welcome, Main,
  },

  props: ['currentUser'],

  data: function () {
    return {
      step: 0,
      sections: [],
      sectionIndex: 0,
      error: '',
      my_first_course: null,
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
    this.$http.get("/courses/my_first_course")
      .then(response => {
        this.my_first_course = response.data.data;
        this.sections = this.my_first_course.attributes.sections.data;
      }).catch(error => {
        this.error = error.response;
    });

    this.registerWistiaEvent();
  }
}
</script>

<style scoped>

</style>
