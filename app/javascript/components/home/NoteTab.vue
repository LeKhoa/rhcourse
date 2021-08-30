<template>
  <div id="note_tab">
    <div v-if="error" class="text-danger"> {{error}} </div>
    <textarea class="w-100 mt-3 px-3 py-2" rows="3"
      placeholder="Add a note..."
      v-model="body"
      @keydown.enter.exact.prevent="addNote"
    >
    </textarea>
    <div class="mt-3">
      <div v-for="note in notes">
        <p> {{note.body}}</p>
        <hr>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  props: {
    section: Object,
  },

  data: function () {
    return {
      body: '',
      notes: [],
      error: '',
    }
  },

  methods: {
    addNote(e) {
      e.preventDefault();
      let params = {
        body: this.body,
      };

      this.$http.post(`/api/sections/${this.section.id}/notes`, params)
        .then(response => {
          this.createNoteSuccessfull(response.data.note);
        }).catch(error => {
          this.createNoteFailed(error);
      });
    },

    createNoteSuccessfull(note) {
      this.notes = [note, ...this.notes];
      this.body = '';
    },

    createNoteFailed(error) {
      this.error = error.response.data.message;
    },

  },

  computed: {
  },

  mounted() {
    this.$http.get(`/api/sections/${this.section.id}/notes`)
      .then(response => {
        this.notes = response.data.notes;
      }).catch(error => {
        this.error = error.response.data.message;
    });
  }
}
</script>

<style scoped lang="scss">
#note_tab {
  p {
    padding-left: 20px;
    font-size: 15px;
  }

  hr {
    color: #eceef1;
    opacity: 1;
  }

  textarea {
    border: 1px solid #eceef1;
    border-radius: 0;
  }
}

</style>
