<template>
  <li class="category-item list-group-item">
    <div class="category-item__content">
      {{category.title}}
      <button @click="deleteCategory(category.id)" type="button" class="btn btn-danger category-item__remove-btn">
        <i class="fa fa-times" aria-hidden="true"></i>
      </button>
    </div>
    <ul class="category-item__post-list list-group">
      <li v-for="post in category.posts" :key="post.id" class="category-item__post-item">
        <router-link :to="`/posts/${post.id}`" class="btn btn-link w-100 text-left">{{ post.title }}</router-link>
      </li>
    </ul>
  </li>
</template>

<script>
import { http, Storage } from '../../scripts';
import { mapActions } from 'vuex';

export default {
  data() {
    return {
      currentUser: null
    }
  },
  props: {
    category: Object
  },
  methods: {
    ...mapActions({
      removeCategory: 'removeCategory',
    }),
    deleteCategory(id) {
      http.delete(`users/${this.currentUser.id}/categories/${id}`)
        .then(({ data }) => this.removeCategory({ category: data }))
        .catch((err) => {
          console.log('Something went wrong...');
          this.toggleForm();
          this.$router.push('/');
        })
    },
  },
  created() {
    this.currentUser = Storage.getCurrentUser();
  }
}
</script>
