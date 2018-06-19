<template>
  <div class="aside">
    <router-link to="/" class="btn btn-link aside__article-btn">последние статьи</router-link>
    <category-list>
      <category-item
        v-for="category in categories"
        :key="category.id"
        :category="category"
      >
      </category-item>
    </category-list>
    <category-form></category-form>
  </div>
</template>

<script>
import { categoryList, categoryItem, categoryForm } from './categories';
import { HTTP, USER } from '../scripts';

export default {
  props: {
    currentUser: Object,
    selectedUser: Object
  },
  data() {
    return {
      categories: null
    }
  },
  methods: {
    saveUserToStorage(activeUser) {
      localStorage.setItem(USER, JSON.stringify(activeUser));
    }
  },
  created() {
    HTTP.get(`users/${this.selectedUser.id}/categories`)
      .then(({ data }) => {
        this.categories = data.categories;
      })
  },
  components: {
    categoryList,
    categoryItem,
    categoryForm
  }
}
</script>