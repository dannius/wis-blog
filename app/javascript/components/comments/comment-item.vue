<template>
  <li class="comment-item list-group-item">
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1">{{comment.author || "Автор"}}</h5>
      <small>{{comment.createdAt}}</small>
    </div>
    <p class="mb-1">{{comment.content}}</p>
  </li>
</template>

<script>
export default {
  props: {
    comment: Object
  }
}
</script>
