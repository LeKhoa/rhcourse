<template>
  <div id="chat_tab">
    <Message />
    <Message />
  </div>
</template>

<script>

import Message from './Message.vue'
export default {

  components: {
    Message,
  },

  data: function () {
    return {
    }
  },

  methods: {
  }
}
</script>

<style scoped lang="scss">
#chat_tab {

}
</style>
