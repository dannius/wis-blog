<template>
  <div>
    <p>{{ message }}</p>
  </div>
</template>

<script>
import { HTTP } from '../scripts';

export default {
  data() {
    return {
      message: "Hello Vue!"
    }
  },
  created() {
    console.log(1)
  }
}
</script>