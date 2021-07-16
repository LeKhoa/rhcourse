<template>
  <div id="note_tab">

    <textarea id="add_note" class="w-100" name="add_note" rows="3" value="" placeholder="Add a note...">
    </textarea>
    <p class="mt-3"> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore </p><hr>
    <p> Lorem ipsum dolor sit amet, consectetur</p><hr>
    <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore</p><hr>
    <p> Lorem ipsum dolor sit amet, consectetur</p><hr>
    <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit </p><hr>
  </div>
</template>

<script>

export default {

  data: function () {
    return {
    }
  },

  methods: {
  }
}
</script>

<style scoped lang="scss">
#note_tab {
  p {
    padding-left: 20px;
    font-size: 15px;
  }
  textarea {
    border: 1px solid #eceef1;
    border-radius: 0;
  }
}

</style>
