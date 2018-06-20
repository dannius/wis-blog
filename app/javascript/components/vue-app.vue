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
    <div v-if="isAccountOwner()">
      <category-form></category-form>
      <router-link to="/posts/new" class="btn btn-link">Создать пост</router-link>
    </div>
  </div>
</template>

<script>
import { categoryList, categoryItem, categoryForm } from './categories';
import { http } from '../scripts';
import { mapActions, mapState, mapGetters } from 'vuex';

export default {
  props: {
    currentUser: Object,
    selectedUser: Object
  },
  computed: {
    ...mapState({
      categories: state => state.categories,
    }),
    ...mapGetters([
      'isAccountOwner'
    ])
  },
  methods: {
    ...mapActions({
      setCategories: 'setCategories',
      setCurrentUser: 'setCurrentUser',
      setSelectedUser: 'setSelectedUser'
    })
  },
  created() {
    this.setCurrentUser({ user: this.currentUser });
    this.setSelectedUser({ user: this.selectedUser });

    http
      .get(`users/${this.selectedUser.id}/categories`)
      .then(({ data }) => this.setCategories({ categories: data }))
  },
  components: {
    categoryList,
    categoryItem,
    categoryForm
  }
}
</script>