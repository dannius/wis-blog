import VueRouter from 'vue-router';
import Vue from 'vue/dist/vue.esm';

import asideApp from '../components/aside';
import { ROUTES, setupAlerts } from '../scripts';
import store from '../store/store';

Vue.use(VueRouter);

const router = new VueRouter({
  routes: ROUTES,
  linkActiveClass: "aside__link-active"
})

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#vue-application',
    store,
    components: {
      asideApp
    },
    router
  })

  // functions 
  setupAlerts();
})
