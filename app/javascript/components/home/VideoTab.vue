<template>
  <div class="video-container mt-5">
    <div class="py-3">
      <div class="mt-3 text-danger" v-if="error">{{ error }} </div>
      <span class="video-label"> {{lessons.length}} Lessons (30m) </span>
      <ul class="video-list mt-3">

        <li class="row mt-1"
          :class="{ 'watched': lesson.attributes.watched, 'watching': index == watchingIndex }"
          v-for="(lesson, index) in lessons"
          @click="selectLesson(index, lesson)">

          <div class="col-8">
            <span class="title"> {{index}}.{{lesson.attributes.title}} </span>
          </div>
          <div class="col-4 d-flex align-items-center justify-content-end">
            <img :src="videoIcon(index, lesson)">
            <span class="ms-2"> {{lesson.attributes.length}} </span>
          </div>
        </li>

      </ul>
    </div>
  </div>
</template>

<script>

import watchedVideoIcon from '../../images/checked-step.png'
import watchingVideoIcon from '../../images/watching-icon.png'

export default {

  data: function () {
    return {
      watchedVideoIcon: watchedVideoIcon,
      watchingVideoIcon: watchingVideoIcon,
      error: '',
      lessons: [],
      watchingIndex: -1,
    }
  },

  methods: {
    videoIcon(index, lesson){
      if (index == this.watchingIndex)
        return watchingVideoIcon;
      if (lesson.attributes.watched == true)
        return watchedVideoIcon;
    },

    selectLesson(index, lesson) {
      this.watchingIndex = index;
      this.$emit("selectLesson", { lesson: lesson });
      this.updateWatchedLesson(index, lesson);
    },

    updateWatchedLesson(index, lesson) {
      let params = { id: lesson.id }
      this.$http.post('/lessons/watched', params)
        .then(response => {
          this.lessons[index].attributes.watched = true;
        }).catch(error => {
          this.error = error.response;
      });
    }
  },

  created() {
    const headers = { "Content-Type": "application/json" };
    this.$http.get("/courses/my_course.json", { headers })
      .then(response => {
        this.lessons = response.data.data.attributes.lessons.data;
      }).catch(error => {
        this.error = error.response;
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
      padding: 10px 0;

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
