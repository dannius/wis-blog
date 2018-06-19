<template>
  <div class="aside">
    <router-link to="/" exact class="btn btn-link aside__article-btn">последние статьи</router-link>
    <category-list>
      <category-item
        v-for="category in categories"
        :key="category.id"
        :category="category"
        @onDestroyCategory="destroyCategory($event)"
      >
      </category-item>
    </category-list>
    <category-form @onGetCategory="pushCategory($event)" v-if="isOwnership"></category-form>
  </div>
</template>

<script>
import { categoryList, categoryItem, categoryForm } from './categories';
import { http, Storage } from '../scripts';

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
    pushCategory(category) {
      this.categories.push(category)
    },
    destroyCategory(category) {
      this.categories = this.categories.filter((cat) => cat.id !== category.id);
    }
  },
  created() {
    Storage.setCurrentUser(this.currentUser);
    Storage.setSelectedUser(this.selectedUser);

    http.get(`users/${this.selectedUser.id}/categories`)
      .then(({ data }) => {
        this.categories = data;
      })
  },
  computed: {
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