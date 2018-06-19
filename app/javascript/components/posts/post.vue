<template>
  <div class="w-100">
    <div class="card w-100 mb-4">
      <div class="card-body">
        <h3 class="card-title">{{ post.title }}</h3>
        <p class="card-text">{{post.content}}</p>
        <p class="text-right mb-1 mt-10 text-muted">Дата создания: {{post.createdAt}}</p>
      </div>
    </div>

    <comment-list>
      <comment-item v-for="comment in post.comments" :key="comment.id" :comment="comment"></comment-item>
    </comment-list>
  </div>
</template>

<script>
import { http } from '../../scripts';
import { commentList, commentItem } from '../comments'

export default {
  data() {
    return {
      postId: this.$route.params.id,
      post: {}
    }
  },
  created() {
    http.get(`users/${1}/posts/${this.postId}`)
      .then(({ data }) => {
        const { post } = data;
        this.post = post;
      })
  },
  components: {
    commentList,
    commentItem
  }
}
</script>