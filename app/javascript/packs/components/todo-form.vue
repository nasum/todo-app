<template>
  <div class="todo-form">
    <form v-on:submit.prevent="sendTodo">
      <div class="todo-form__group">
        <div class="todo-form__input-area">
          <label for='title'>title</label>
          <input name="title" type='text' v-model='title'>
        </div>
        <div class="todo-form__error-area" v-if="error.title">
          <ul>
            <li v-for="message, index in error.title ">{{ message }}</li>
          </ul>
        </div>
      </div>
      <div class="todo-form__group">
        <div class="todo-form__input-area">
          <label for='description'>description</label>
          <textarea name='description' v-model='description'></textarea>
        </div>
        <div class="todo-form__error-area" v-if="error.description">
          <ul>
            <li v-for="message, index in error.description ">{{ message }}</li>
          </ul>
        </div>
      </div>
      <div class="todo-form__group">
        <div class="todo-form__input-area">
          <label for='expired_at'>expired_at</label>
          <input name='expired_at' type='date' v-model='expired_at'>
        </div>
        <div class="todo-form__error-area" v-if="error.expired_at">
          <ul>
            <li v-for="message, index in error.expired_at ">{{ message }}</li>
          </ul>
        </div>
      </div>
      <div class="todo-form__group">
        <div class="todo-form__input-area todo-form__submit-area">
          <input type='submit' class='todo-form__submit-button'>
        </div>
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
  }
}
</script>

<style lang="scss" scoped>
@import '../style/colors';

.todo-form {
  background-color: #ffffff;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0,0,0,.26);
  box-sizing: border-box;
  width: 600px;
  margin: 0 auto;
  padding: 10px;

  &__group {
    padding: 5px 0;
  }

  &__input-area {
    label {
      display: inline-block;
      width: 27%;
      vertical-align: top;
    }

    input {
      box-sizing: border-box;
      border-color: $secondary_color;
      border-radius: 5px;
      display: inline-block;
      outline: none;
      padding: 5px;
      width: 70%;
    }

    textarea {
      box-sizing: border-box;
      border-color: $secondary_color;
      border-radius: 5px;
      display: inline-block;
      outline: none;
      padding: 5px;
      width: 70%;
    }
  }

  &__submit-area {
    text-align: center;
  }

  &__submit-button {
    background-color: $accent_color;
    border: 0px;
    border-radius: 2px;
    box-shadow: 0 2px 5px rgba(0,0,0,.26);
    color: $accent_text_color;
    cursor: pointer;
    display: inline-block;
    padding-left: 16px;
    padding-right: 16px;
    width: auto;
  }
}

</style>
