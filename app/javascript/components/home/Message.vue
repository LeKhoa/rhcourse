<template>
  <div class="message-container">
    <div class="row">
      <div class="col-2 col-sm-1">
        <img :src="defaultChatIcon">
      </div>
      <div class="col-10 col-sm-11 ps-4">
        <div class="message-owner"> Miki Smith </div>
        <span class="message-text mt-3"> I really enjoyed the class, your stories and the dope customer service </span>
        <div class="message-action mt-2">
          <ul>
            <li>
              <a href="#" @click.prevent=""> Like </a>
              <span class="circle"> </span>
            </li>
            <li>
              <a href="#" @click.prevent=""> Reply </a>
              <span class="circle"> </span>
            </li>
            <span class="active-time"> Last active 3 months ago </span>
          </ul>
        </div>

        <Reply class="mt-2"/>
        <Reply class="mt-2"/>

        <!-- Start add_reply -->
        <div class="add-reply-container mt-2">
          <div class="row">
            <div class="col-2 col-sm-1">
              <img :src="defaultChatIcon">
            </div>
            <div class="col-10 col-sm-11 ps-4">
              <div class="add-reply-content">
                <textarea class="w-100" rows="2" value="" placeholder="Leave a reply...">
                </textarea>
              </div>
            </div>
          </div>
        </div> 
        <!-- End add_reply -->

      </div>
    </div>
  </div>
</template>

<script>

import defaultChatIcon from '../../images/default-chat-icon.png'
import Reply from './Reply.vue'

export default {
  components: {
    Reply,
  },

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
.message-container {
  .message-owner {
    font-size: 16px;
    font-weight: bold;
    color: #000000;
  }
  .message-action ul {
    padding-left: 0;

    li {
      display: inline-block;
      padding-right: 20px;

      a {
        color: #89c731;
        text-decoration: none;
      }
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

  .add-reply-content {
    textarea {
      border: solid 1px #eceef1;
    }
  }
}

</style>
