<template>
  <ul class="post-list list-group">
    <post-item v-for="post in posts" :key="post.id" :post="post"></post-item>
  </ul>
</template>

<script>
import postItem from './post-item';
import { http, Storage } from '../../scripts';

export default {
  data() {
    return {
      posts: [],
      user: null
    }
  },
  created() {
    this.user = Storage.getSelectedUser();
    http.get(`users/${this.user && this.user.id}/posts`)
      .then(({ data }) => {
        const { posts } = data;
        this.posts = posts;
      })
  },
  components: {
    postItem
  }
}
</script>