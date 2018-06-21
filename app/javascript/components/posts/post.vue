<template>
  <div class="w-100" v-if="isLoad">
    <div class="card w-100 mb-4">
      <div class="card-body">
        <h3 class="card-title">{{ post.title }}</h3>
        <p class="card-text">{{post.content}}</p>
        <p class="text-right mb-1 mt-10 text-muted">Дата создания: {{formatTime(post.createdAt)}}</p>
      </div>
    </div>

    <comment-list>
      <template slot="comment-form">
        <comment-form @onGetComment="pushComment($event)" :postId="post.id"></comment-form>
      </template>
      <comment-item v-for="comment in post.comments" :key="comment.id" :comment="comment"></comment-item>
    </comment-list>
  </div>
</template>

<script>
import { http, formatTime } from '../../scripts';
import { commentList, commentItem, commentForm } from '../comments'
import { mapState } from 'vuex';

export default {
  data() {
    return {
      postId: this.$route.params.id,
      post: {},
      isLoad: false
    }
  },
  computed: {
    ...mapState({
      selectedUser: state => state.selectedUser,
    }),
  },
  methods: {
    formatTime: (time) => formatTime(time),
    pushComment(comment) {
      this.post.comments.push(comment);
    }
  },
  mounted() {
    http
      .get(`users/${this.selectedUser.id}/posts/${this.postId}`)
      .then(({ data }) => {
        this.post = data;
        this.isLoad = true;
      })
      .catch(() => this.$router.push('/'))
  },
  components: {
    commentList,
    commentItem,
    commentForm
  }
}
</script>