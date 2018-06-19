<template>
  <router-link :to="`/posts/${post.id}`" class="flex-column post-item list-group-item list-group-item-action">
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1">{{post.title}}</h5>
      <small>{{formatTime(post.createdAt)}}</small>
    </div>
    <p class="mb-1">{{post.content}}</p>
  </router-link>
</template>

<script>
import { formatTime } from '../../scripts'

export default {
  props: {
    post: Object
  },
  methods: {
    formatTime: (time) => formatTime(time)
  }
}
</script>