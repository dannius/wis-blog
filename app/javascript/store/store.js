import Vue from 'vue/dist/vue.esm';
import Vuex from 'vuex';

import {
  ADD_POST_TO_CATEGORY,
  PUSH_CATEGORY,
  REMOVE_CATEGORY,
  SET_CATEGORIES,
  SET_CURRENT_USER,
  SET_SELECTED_USER
} from './mutatuon-types';

Vue.use(Vuex);

export default new Vuex.Store({
    state: {
      categories: [],
      currentUser: Object,
      selectedUser: Object,
    },
    getters: {
      isAccountOwner: ({ currentUser, selectedUser}) => () => {
        return (currentUser && currentUser.id) === (selectedUser && selectedUser.id)
      },
      isLoggedIn: ({ currentUser }) => () => currentUser && !!currentUser.id
    },
    actions: {
      setCategories({ commit }, payload) {
        commit(SET_CATEGORIES, payload);
      },
      removeCategory({ commit }, payload) {
        commit(REMOVE_CATEGORY, payload);
      },
      pushCategory({ commit }, payload) {
        commit(PUSH_CATEGORY, payload);
      },
      addPostToCategory({ commit }, payload) {
        commit(ADD_POST_TO_CATEGORY, payload);
      },
      setCurrentUser({ commit }, payload) {
        commit(SET_CURRENT_USER, payload);
      },
      setSelectedUser({ commit }, payload) {
        commit(SET_SELECTED_USER, payload);
      }
    },
    mutations: {
      [SET_CATEGORIES] (state, { categories }) {
        state.categories = categories;
      },
      [REMOVE_CATEGORY] (state, { category }) {
        state.categories = state.categories.filter((cat) => cat.id !== category.id)
      },
      [PUSH_CATEGORY] (state, { category }) {
        state.categories.push(category);
      },
      [ADD_POST_TO_CATEGORY] (state, { post }) {
        state.categories.forEach((category) => {
          if (category.id == post.categoryId) {
            category.posts.push(post);
          }
        })
      },
      [SET_CURRENT_USER] (state, { user }) {
        state.currentUser = user;
      },
      [SET_SELECTED_USER] (state, { user }) {
        state.selectedUser = user;
      }
    },
})
