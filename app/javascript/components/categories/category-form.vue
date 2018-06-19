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
import { http, Storage } from '../../scripts';

export default {
  data() {
    return {
      showForm: false,
      title: '',
      currentUser: null,
    }
  },
  methods: {
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
          this.$emit('onGetCategory', data);
        }).catch((err) => {
          console.log('Something went wrong...');
          this.toggleForm();
        })
    }
  },
  created() {
    this.currentUser = Storage.getCurrentUser();
  }
}
</script>