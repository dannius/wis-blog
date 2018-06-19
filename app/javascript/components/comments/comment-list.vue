<template>
  <div class="jumbotron p-4">
    <h4>Комментарии</h4>
    <hr class="my-3">
    <slot name="comment-form"></slot>
    <ul class="comment-list list-group">
      <slot></slot>
    </ul>
    <hr class="my-3">
  </div>
</template>

<script>
export default {

}
</script>
