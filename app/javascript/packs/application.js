import Vue from 'vue/dist/vue.esm';
import asideApp from '../components/aside';

import { setupAlerts } from '../scripts';

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#vue-application',
    components: {
      asideApp
    }
  })

  // functions 
  setupAlerts();
})
