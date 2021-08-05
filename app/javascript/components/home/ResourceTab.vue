<template>
  <div id="resource_tab">
    <label class="title"> Resources </label>
    <ul class="mt-3" v-for="(resource, index) in resources">
      <li>{{resource.attributes.title}}
        <ul class="pdf-list" v-if="resource.attributes.attachments.data">
          <li v-for="attachment in resource.attributes.attachments.data">
            <a :href="attachment.attributes.link">{{attachment.attributes.name}}</a>
          </li>
        </ul>
      </li>
      <p style="white-space: pre-line">{{resource.attributes.description}}</p>
    </ul>
  </div>
</template>

<script>

export default {

  props: {
    course: Object,
    section: Object,
  },

  data: function () {
    return {
      resources: [],
      error: '',
    }
  },

  methods: {

  },

  created() {
    this.$http.get(`/sections/${this.section.id}/resources`)
      .then(response => {
        this.resources = response.data.data;
      }).catch(error => {
        this.error = error.response;
    });
  },
}
</script>

<style scoped lang="scss">
  #resource_tab {
    .title {
      font-size: 18px;
    }

    ul {
      padding-left: 1.3rem;
    }
    ul > li {
      list-style-type: disc;
    }

    .pdf-list li a {
      color: #89c731;
    }
  }

</style>
