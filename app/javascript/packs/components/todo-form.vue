<template>
  <div>
    <form v-on:submit.prevent="sendTodo">
      <div>
        <label for='title'>title</label>
        <input name="title" type='text' v-model='title'>
      </div>
      <div>
        <label for='description'>description</label>
        <textarea name='description' v-model='description'></textarea>
      </div>
      <div>
        <label for='expired_at'>expired_at</label>
        <input name='expired_at' type='date' v-model='expired_at'>
      </div>
      <div>
        <input type='submit'>
      </div>
    </form>
  </div>
</template>

<script>
export default {
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
  }
}
</script>

<style scoped>
</style>
