<template>
  <li class="list-group">
    <router-link :to="`/post/${post.id}`" class="list-group-item list-group-item-action flex-column align-items-start">
      <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">{{post.title}}</h5>
        <small>{{post.createdAt}}</small>
      </div>
      <p class="mb-1">{{post.content}}</p>
    </router-link>
  </li>
</template>

<script>

export default {
  props: {
    post: Object
  }
}
</script>