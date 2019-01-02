<template>
  <div class="gallery">
    <div class="photo" v-for="filename in images" v-on:click="expand_image(filename, $event)">
      <img :src="full_path(filename)" :data-filename="filename">
    </div>
    <div class="fullscreen" v-bind:class="{ active: is_expanded }">
      <div class="fullscreen-wrap">
        <div class="fullscreen-close" v-on:click="hide()">
          <ion-icon name="close-circle-outline"></ion-icon>
        </div>
        <img class="image" :src="full_path(expanded_filename)">
        <!--
        <div class="image" v-bind:style="{ backgroundImage: `url(${full_path(expanded_filename)})`}"></div>
        -->
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['images', 'gallery_name'],

  created() {
    this.keyupListener = this.handleDocumentKeyup.bind(this);
    document.addEventListener('keyup', this.keyupListener);
  },

  destroyed() {
    document.removeEventListener('keyup', this.keyupListener);
  },

  data() {
    return {
      is_expanded: false,
      expanded_filename: null
    }
  },

  methods: {
    handleDocumentKeyup(event) {
      // Escape
      if (event.keyCode === 27) {
        this.hide();
      }
    },

    full_path(filename) {
      return `/photos/${this.gallery_name}/${filename}`;
    },
    expand_image(filename, $event) {
      const img = $event.target.querySelector('img');
      this.expanded_filename = filename;
      this.expand(img);
    },
    hide() {
      this.is_expanded = false;
      this.expanded_filename = null;
    },
    expand(img) {
      this.is_expanded = true;
    }
  }
}
</script>

<style scoped>
  .photo {
    cursor: pointer;
  }

  .photo img {
    pointer-events: none;
  }

  .fullscreen {
    display: none;
    background-color: rgba(0, 0, 0, 0.95);
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1000;
  }

  .fullscreen.active {
    display: flex;
  }

  .fullscreen-wrap {
    position: relative;
    margin: 50px;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .fullscreen-close {
    position: absolute;
    top: -5px;
    right: -5px;
    z-index: 2;
    font-size: 36px;
    color: white;
    cursor: pointer;
  }


  .fullscreen .image {
    flex: 0;
    max-height: 100%;
    width: auto;
  }

</style>