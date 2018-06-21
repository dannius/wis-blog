<template>
  <div>
    <ul v-if="isLoad && posts.length" class="post-list list-group">
      <post-item v-for="post in posts" :key="post.id" :post="post"></post-item>
    </ul>
    <div v-if="isLoad && !posts.length">
      <h2>Постов нет</h2>
    </div>
  </div>
</template>

<script>
import postItem from './post-item';
import { http } from '../../scripts';
import { mapState } from 'vuex';

export default {
  data() {
    return {
      posts: [],
      isLoad: false
    }
  },
  computed: {
    ...mapState({
      selectedUser: state => state.selectedUser,
    }),
  },
  created() {
    http
      .get(`users/${this.selectedUser && this.selectedUser.id}/posts`)
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