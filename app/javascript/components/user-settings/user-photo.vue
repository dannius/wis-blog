<template>
  <div>
    <img class="user__image" :src="imageUrl" alt="">
    <picture-input
      ref="pictureInput"
      @change="onChanged"
      @remove="onRemoved"
      :width="0"
      removeButtonClass="ui red button"
      :height="0"
      accept="image/jpeg, image/png, image/gif"
      :customStrings="{
      upload: '',
      drag: ''}">
    </picture-input>
  </div>
</template>

<script>
import PictureInput from 'vue-picture-input';
import { http } from '../../scripts';
import { mapState } from 'vuex';

export default {
  data() {
    return {
      image: '',
      imageUrl: '',
    }
  },
  computed: {
    ...mapState({
      currentUser: state => state.currentUser,
    }),
  },
  methods: {
    onChanged() {this.$refs.pictureInput.image
      this.image = this.$refs.pictureInput.image;
      this.attemptUpload();
    },
    onRemoved() {
      this.image = '';
    },
    attemptUpload() {
      if (!this.image) {
        return;
      }

      http.patch(`users/${this.currentUser.id}`, { user: { base64: this.image } })
      .then(({ data }) => {
        this.imageUrl = data.photoUrl;
      })
      .catch((err) => console.log(err))
    }
  },
  mounted() {
    this.imageUrl = this.currentUser.photoUrl || "http://via.placeholder.com/200x230";
  },
  components: {
    PictureInput
  }
}
</script>
