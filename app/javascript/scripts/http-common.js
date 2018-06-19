import axios from 'axios';

const token = document.getElementsByName('csrf-token')[0].getAttribute('content');

export const http = axios.create({
  baseURL: 'http://localhost:3000/api/',
  headers: {
    'X-CSRF-Token': token,
    'Accept': 'application/json'
  }
})
