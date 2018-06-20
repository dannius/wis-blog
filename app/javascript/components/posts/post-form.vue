<template>
  <div class="post-form">
    <div class="form-group">
      <label>Название поста</label>
      <input v-model="title" type="text" class="form-control">
    </div>
    <div class="form-group">
      <label>Категория поста</label>
      <select class="form-control" v-model="selectedCategoryId">
        <option v-for="category in categories" :key="category.id" :value="category.id">{{category.title}}</option>
      </select>
    </div>
    <div class="form-group">
      <label>Содержание</label>
      <textarea v-model="content" class="form-control" rows="5"></textarea>
    </div>
    <button @click="savePost()" type="button" class="btn btn-primary">Создать пост</button>
  </div>
</template>

<script>
import { http, Storage } from '../../scripts';
import { mapActions } from 'vuex';

export default {
  data() {
    return {
      categories: [],
      title: '',
      content: '',
      selectedCategoryId: -1,
      currentUser: null
    }
  },
  props: {
    post: Object
  },
  methods: {
    ...mapActions({
      addPostToCategory: 'addPostToCategory'
    }),
    savePost() {
      if (!this.isFormValid) {
        console.log('форма не валидна')
        return;
      }

      http
        .post(`users/${this.currentUser && this.currentUser.id}/posts`,
        { post: { title: this.title, content: this.content, category_id: this.selectedCategoryId } })
        .then(({ data }) => {
          this.addPostToCategory({ post: data })
          this.$router.push('/');
        })
        .catch((err) => console.log('Something went wrong...'))
    }
  },
  computed: {
    isFormValid() {
      return !!this.selectedCategoryId && !!this.title && !!this.content;
    }
  },
  created() {
    this.currentUser = Storage.getCurrentUser();

    if (!this.currentUser) {
      return;
    }

    http
      .get(`users/${this.currentUser && this.currentUser.id}/categories`)
      .then(({ data }) => this.categories = data);
  },
}
</script>