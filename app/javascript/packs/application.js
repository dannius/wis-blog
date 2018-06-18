import Vue from 'vue/dist/vue.esm';
import Categories from '../components/categories';

import { setupAlerts } from '../scripts';

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#vue-application',
    components: {
      Categories
    }
  })

  // functions 
  setupAlerts();
})

