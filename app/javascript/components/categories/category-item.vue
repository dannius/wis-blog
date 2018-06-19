<template>
  <li class="category-item list-group-item">
    {{category.title}}
    <ul class="category-item__post-list list-group">
      <li v-for="post in category.posts" :key="post.id" class="category-item__post-item">
        <router-link :to="`/post/${post.id}`" class="btn btn-link w-100 text-left">{{ post.title }}</router-link>
      </li>
    </ul>
  </li>
</template>

<script>
export default {
  props: {
    category: Object
  }
}
</script>
