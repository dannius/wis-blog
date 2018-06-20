<template>
  <div class="aside">
    <router-link to="/" exact class="btn btn-link aside__article-btn">последние статьи</router-link>
    <category-list>
      <category-item
        v-for="category in categories"
        :key="category.id"
        :category="category"
      >
      </category-item>
    </category-list>
    <div v-if="isOwnership">
      <category-form></category-form>
      <router-link to="/posts/new" class="btn btn-link">Создать пост</router-link>
    </div>
  </div>
</template>

<script>
import { categoryList, categoryItem, categoryForm } from './categories';
import { http, Storage } from '../scripts';
import { mapActions, mapState } from 'vuex';

export default {
  props: {
    currentUser: Object,
    selectedUser: Object
  },
  methods: {
    ...mapActions({
      setCategories: 'setCategories',
    })
  },
  created() {
    //TODO: use vuex
    Storage.setCurrentUser(this.currentUser);
    Storage.setSelectedUser(this.selectedUser);

    http
      .get(`users/${this.selectedUser.id}/categories`)
      .then(({ data }) => this.setCategories({ categories: data }))
  },
  computed: {
    ...mapState({
      categories: state => state.categories,
    }),
    isOwnership() {
      return Storage.isOwnershipAccount();
    },
  },
  components: {
    categoryList,
    categoryItem,
    categoryForm
  }
}
</script>