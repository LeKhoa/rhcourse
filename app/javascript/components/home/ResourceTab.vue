<template>
  <div id="resource_tab">
    <label class="title"> Resources </label>
    <ul class="mt-3">
      <li>Download Rohan's PDF files
        <ul class="pdf-list">
          <li>
            <a href="#">Lorem ipsum dolor sit amet.pdf</a>
          </li>
          <li> 
            <a href="#">Consectetur adipiscing elit.pdf </a>
          </li>
          <li> 
            <a href="#">Sed do eiusmod tempor </a>
          </li>
        </ul>
      </li>
      <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor</li>
      <li>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip</li>
      <li>Sed ut perspiciatis, unde omnis iste natus error sit </li>
      <li>Quae ab illo inventore veritatis et quasi architecto
        <div>- Lorem ipsum dolor sit amet</div>
        <div>- Aspernatur aut odit aut fugit</div>
        <div>- Sed quia consequuntur magni dolores</div>
        <div>- Qui ratione voluptatem sequi nesciunt</div>
        <div>- Neque porro quisquam est</div>
      </li>
    </ul>
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
