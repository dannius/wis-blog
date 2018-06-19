<template>
  <div class="w-100">
    <div class="card w-100 mb-4">
      <div class="card-body">
        <h3 class="card-title">{{ post.title }}</h3>
        <p class="card-text">{{post.content}}</p>
        <p class="text-right mb-1 mt-10 text-muted">Дата создания: {{formatTime(post.createdAt)}}</p>
      </div>
    </div>

    <comment-list>
      <comment-item v-for="comment in post.comments" :key="comment.id" :comment="comment"></comment-item>
    </comment-list>
  </div>
</template>

<script>
import { http, formatTime, Storage } from '../../scripts';
import { commentList, commentItem } from '../comments'

export default {
  data() {
    return {
      postId: this.$route.params.id,
      post: {}
    }
  },
  methods: {
    formatTime: (time) => formatTime(time)
  },
  created() {
    const selectedUser = Storage.getSelectedUser();

    http
      .get(`users/${selectedUser.id}/posts/${this.postId}`)
      .then(({ data }) => this.post = data)
  },
  components: {
    commentList,
    commentItem
  }
}
</script>