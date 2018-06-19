import VueRouter from 'vue-router';
import Vue from 'vue/dist/vue.esm';

import asideApp from '../components/aside';
import { setupAlerts, ROUTES } from '../scripts';

Vue.use(VueRouter);

const router = new VueRouter({
  routes: ROUTES
})

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#vue-application',
    components: {
      asideApp
    },
    router
  })

  // functions 
  setupAlerts();
})
