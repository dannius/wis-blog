<template>
  <div class="category-form">
    <div v-if="showForm" class="form-group">
      <input v-model="title" type="text" class="form-control" placeholder="Введите название категории">
      <button class="btn btn-link" @click="toggleForm()">Скрыть</button>
      <button class="btn btn-link" @click="saveCategory()">Сохранить</button>
    </div>
    <button v-else class="btn btn-link" @click="toggleForm()">Добавить категорию</button>
  </div>
</template>

<script>
import { http } from '../../scripts';
import { mapActions, mapState } from 'vuex';

export default {
  data() {
    return {
      showForm: false,
      title: ''
    }
  },
  computed: {
    ...mapState({
      currentUser: state => state.currentUser,
    }),
  },
  methods: {
    ...mapActions({
      pushCategory: 'pushCategory',
    }),
    toggleForm() {
      this.showForm = !this.showForm;
    },
    saveCategory() {
      if (!this.title) {
        return;
      }

      http.post(`users/${this.currentUser.id}/categories`, { category: { title: this.title } })
        .then(({ data }) => {
          this.title = '';
          this.toggleForm();
          this.pushCategory({category: data});
        }).catch((err) => {
          console.log('Something went wrong...');
          this.toggleForm();
        })
    }
  }
}
</script>