<template>
  <ul class="post-list list-group">
    <post-item :post="{title: 12}"></post-item>
  </ul>
</template>

<script>
import postItem from './post-item';

export default {
  components: {
    postItem
  }
}
</script>