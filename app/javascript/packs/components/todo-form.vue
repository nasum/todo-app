<template>
  <div>
    <form v-on:submit.prevent="sendTodo">
      <div>
        <div>
          <label for='title'>title</label>
          <input name="title" type='text' v-model='title'>
        </div>
        <div v-if="error.title">
          <ul>
            <li v-for="message, index in error.title ">{{ message }}</li>
          </ul>
        </div>
      </div>
      <div>
        <div>
          <label for='description'>description</label>
          <textarea name='description' v-model='description'></textarea>
        </div>
        <div v-if="error.description">
          <ul>
            <li v-for="message, index in error.description ">{{ message }}</li>
          </ul>
        </div>
      </div>
      <div>
        <div>
          <label for='expired_at'>expired_at</label>
          <input name='expired_at' type='date' v-model='expired_at'>
        </div>
        <div v-if="error.expired_at">
          <ul>
            <li v-for="message, index in error.expired_at ">{{ message }}</li>
          </ul>
        </div>
      </div>
      <div>
        <input type='submit'>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  props: ['error'],
  data: function () {
    return {
      title: '',
      description: '',
      expired_at: ''
    }
  },
  methods: {
    sendTodo: function () {
      this.$emit('sendTodo', this.$data)
    }
  },
  mounted() {
    console.log('ready')
  }
}
</script>

<style scoped>
</style>
