<template>
  <div class="video-container">
    <div class="mt-3 text-danger" v-if="error">{{ error }} </div>
    <span class="video-label"> {{lessons.length}} Lessons (30m) </span>

    <ul class="video-list mt-3">
      <li class="row mt-1"
        :class="{ 'watched': lesson.attributes.watched, 'watching': isWatching(lesson) }"
        v-for="(lesson, index) in lessons"
        @click="selectLesson(index, lesson)">

        <div class="col-8">
          <span class="title"> {{index}}.{{lesson.attributes.title}} </span>
        </div>
        <div class="col-4 d-flex align-items-center justify-content-end">
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
    course: Object,
  },

  data: function () {
    return {
      watchedVideoIcon: watchedVideoIcon,
      watchingVideoIcon: watchingVideoIcon,
      error: '',
      lessons: [],
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

    updateWatchedLesson() {
      for(let i=0; i < this.lessons.length; i++) {
        if(this.lessons[i].id == this.selectedLesson.id){
          return this.lessons[i].attributes.watched = true;
        }
      }
    },

    isWatching(lesson) {
      if (!this.selectedLesson)
        return false;
      return lesson.id == this.selectedLesson.id;
    }
  },

  created() {
    this.$http.get(`/courses/${this.course.id}/lessons`,)
      .then(response => {
        this.lessons = response.data.data;
      }).catch(error => {
        console.log(error);
    });
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
