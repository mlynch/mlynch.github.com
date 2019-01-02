<template>
  <div class="gallery">
    <div class="photo" v-for="filename in images">
      <img :src="full_path(filename)">
    </div>
  </div>
</template>

<script>
export default {
  props: ['images', 'gallery_name'],

  methods: {
    full_path(filename) {
      return `/photos/${this.gallery_name}/${filename}`;
    }
  }
}
</script>