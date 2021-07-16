<template>
  <div class="reply-container">
    <div class="row">
      <div class="col-2 col-sm-1">
        <img :src="defaultChatIcon">
      </div>
      <div class="col-10 col-sm-11 ps-4">
        <div class="reply-content">
          <div class="reply-owner"> Miki Smith </div>
          <span class="reply-text mt-3"> I really enjoyed the class, your stories and the dope customer service </span>
          <div class="reply-action mt-2">
            <a href="#" @click.prevent=""> Like </a>
            <span class="circle"> </span>
            <span class="active-time ms-3"> 1 month ago </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import defaultChatIcon from '../../images/default-chat-icon.png'
export default {

  data: function () {
    return {
      defaultChatIcon: defaultChatIcon,
    }
  },

  methods: {
  }
}
</script>

<style scoped lang="scss">
.reply-container {
  .reply-content {
    background-color: #fbfcfd;
    padding: 10px;
  }

  .reply-owner {
    font-size: 16px;
    font-weight: bold;
    color: #000000;
  }

  .reply-action {
    a {
      text-decoration: none;
      color: #89c731;
    }

    .circle {
      height: 5px;
      width: 5px;
      background-color: #89c731;
      border-radius: 50%;
      display: inline-block;
      margin-left: 10px;
    }

    .active-time {
      color: #666666;
    }
  }
}

</style>
