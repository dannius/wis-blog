import Vue from 'vue/dist/vue.esm';

import { setupAlerts } from '../scripts';

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#vue-application',
    components: { }
  })

  // functions 
  setupAlerts();
  setupAxios();
})


function setupAxios() {
  const token = document.getElementsByName('csrf-token')[0].getAttribute('content');
  console.log(token);
}
