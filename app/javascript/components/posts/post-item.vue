<template>
  <li class="post-item list-group-item">
    {{post.title}}
  </li>
</template>

<script>

export default {
  props: {
    post: Object
  }
}
</script>