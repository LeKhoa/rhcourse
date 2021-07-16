<template>
  <div class="video-container mt-5">
    <div class="col-12 py-3 pe-4">
      <span class="video-label"> 5 Lessons (30m) </span>
      <ul class="video-list mt-3"> 
        <li class="row mt-3 watched">
          <div class="col-md-8">
            <span class="title"> 1.Introduction </span>
          </div>
          <div class="col-md-4 d-flex align-items-center justify-content-end">
            <img :src="watchedVideoIcon">
            <span class="ms-2"> 1:30 </span>
          </div>
        </li>

        <li class="row mt-3 watched">
          <div class="col-md-8">
            <span class="title"> 2.Cooking Your Story </span>
          </div>
          <div class="col-md-4 d-flex align-items-center justify-content-end">
            <img :src="watchedVideoIcon">
            <span class="ms-2"> 1:30 </span>
          </div>
        </li>

        <li class="row mt-3 watching">
          <div class="col-md-8">
            <span class="title"> 3.How to choose a domain </span>
          </div>
          <div class="col-md-4 d-flex align-items-center justify-content-end">
            <img :src="watchingVideoIcon">
            <span class="ms-2"> 2:05 </span>
          </div>
        </li>

        <li class="row mt-3">
          <div class="col-md-8">
            <span class="title"> 4.Making Salad Dressing </span>
          </div>
          <div class="col-md-4 text-end">
            <span class="ms-2"> 4:55 </span>
          </div>
        </li>


        <li class="row mt-3">
          <div class="col-md-8">
            <span class="title"> 5.Making Jerk Sauce </span>
          </div>
          <div class="col-md-4 text-end">
            <span class="ms-2"> 8:59 </span>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>

import defaultChatIcon from '../../images/default-chat-icon.png'
import watchedVideoIcon from '../../images/checked-step.png'
import watchingVideoIcon from '../../images/watching-icon.png'

export default {

  data: function () {
    return {
      defaultChatIcon: defaultChatIcon,
      watchedVideoIcon: watchedVideoIcon,
      watchingVideoIcon: watchingVideoIcon,
    }
  },

  methods: {
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

      img {
        width: 13px;
        height: 19px;
      }
    }
  } 
}

</style>
