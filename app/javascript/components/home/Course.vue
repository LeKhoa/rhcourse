<template>
  <Welcome v-if="step == 0" @continue="nextStep" />
  <div v-if="step == 1" v-for="(section, index) in sections">
    <Main ref="mainRef" :section="section" v-if="index == sectionIndex" @nextSection="nextSection"/>
  </div>
</template>

<script>

import Welcome from './Welcome.vue'
import Main from './Main.vue'

export default {
  components: {
    Welcome, Main, 
  },

  data: function () {
    return {
      step: 0,
      sections: [],
      sectionIndex: 0,
      error: '',
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
