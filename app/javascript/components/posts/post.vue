<template>
  <div class="post">
    post
  </div>
</template>

<script>

export default {
  data() {
    return {
      postId: this.$route.params.id,
    }
  },
  created() {
    console.log(this.postId);
  }
}
</script>