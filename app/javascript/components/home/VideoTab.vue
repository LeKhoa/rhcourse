<template>
  <div class="video-container">
    <div class="mt-3 text-danger" v-if="error">{{ error }} </div>
    <span class="video-label"> {{lessons.length}} Lessons ({{totalLength()}}) </span>

    <ul class="video-list mt-3">
      <li class="row mt-1"
        :class="{ 'watched': lesson.attributes.watched, 'watching': isWatching(lesson) }"
        v-for="(lesson, index) in lessons"
        @click="selectLesson(index, lesson)">

        <div class="col-9">
          <span class="title"> {{index+1}}. {{lesson.attributes.title}} </span>
        </div>
        <div class="col-3 d-flex align-items-center justify-content-end">
          <img :src="videoIcon(lesson)">
          <span class="ms-2"> {{lesson.attributes.length}} </span>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>

import watchedVideoIcon from '../../images/checked-step.png'
import watchingVideoIcon from '../../images/watching-icon.png'

export default {
  props: {
    selectedLesson: Object,
    lessons: Array,
  },

  data: function () {
    return {
      watchedVideoIcon: watchedVideoIcon,
      watchingVideoIcon: watchingVideoIcon,
      error: '',
    }
  },

  methods: {
    videoIcon(lesson){
      if (this.selectedLesson && lesson.id == this.selectedLesson.id)
        return watchingVideoIcon;
      if (lesson.attributes.watched == true)
        return watchedVideoIcon;
    },

    selectLesson(index, lesson) {
      this.$emit('selectLesson', { lesson: lesson });
    },

    isWatching(lesson) {
      if (!this.selectedLesson)
        return false;
      return lesson.id == this.selectedLesson.id;
    },

    totalLength() {
      let totalMin = 0, totalSec = 0;
      this.lessons.forEach(lesson => {
        let [min , sec] = lesson.attributes.length.split(':');
        totalMin += parseInt(min) || 0;
        totalSec += parseInt(sec) || 0;
      })
      if (totalSec >= 60) {
        totalMin += Math.floor(totalSec / 60);
        totalSec = totalSec % 60;
      }

      return `${totalMin}m ${totalSec}s`;
    }
  },

  created() {
  },

  mounted() {

  }
}
</script>

<style scoped lang="scss">
.video-container {
  .video-label {
    color: #000000;
    font-size: 18px;
    padding-left: 20px;
  }

  ul.video-list {
    list-style-type: decimal !important;
    padding-left: 0;

    li {
      padding: 10px 10px 10px 0;

      span.title {
        padding-left: 20px;
        font-size: 13.5px;
      }
    }

    li:hover, li:focus {
      background: #d8d8d8;
    }

    .watched {
      color: #b2b2b2;
      text-decoration-line: line-through;

      img {
        width: 15px;
        height: 15px;
      }
    }

    .watching {
      background: #000000;
      color: white;
      text-decoration-line: none;

      img {
        width: 13px;
        height: 19px;
      }
    }
  } 
}

</style>
