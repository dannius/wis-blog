<template>
  <ul v-if="isLoad && posts.length" class="post-list list-group">
    <post-item v-for="post in posts" :key="post.id" :post="post"></post-item>
  </ul>
  <div v-else>
    <h2>Постов нет</h2>
  </div>
</template>

<script>
import postItem from './post-item';
import { http, Storage } from '../../scripts';

export default {
  data() {
    return {
      posts: [],
      user: null,
      isLoad: false
    }
  },
  created() {
    this.user = Storage.getSelectedUser();
    http
      .get(`users/${this.user && this.user.id}/posts`)
      .then(({ data }) => {
        this.isLoad = true;
        this.posts = data;
      })
  },
  components: {
    postItem
  }
}
</script>