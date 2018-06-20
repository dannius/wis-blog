<template>
  <div class="post-form">
    <div class="form-group">
      <textarea v-model="content" class="form-control" rows="2" placeholder="Текст комментария"></textarea>
    </div>
    <button @click="saveComment()" type="button" class="btn btn-primary">Отправить</button>
  </div>
</template>

<script>
import { http } from '../../scripts';

export default {
  data() {
    return {
      content: ''
    }
  },
  props: {
    postId: Number
  },
  methods: {
    saveComment() {
      if (!this.isFormValid) {
        console.log('форма не валидна')
        return;
      }

      http
        .post(`users/nil/posts/${this.postId}/comments`,
        { comment: { content: this.content } })
        .then(({ data }) => {
          this.content = "",
          this.$emit('onGetComment', data);
        })
        .catch((err) => console.log('Something went wrong...'))
    }
  },
  computed: {
    isFormValid() {
      return !!this.content;
    }
  }
}
</script>