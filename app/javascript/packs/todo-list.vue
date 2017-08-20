<template>
  <div class="todo-list">
    <ul>
      <li v-for="todo in todos">
        {{ todo.title }}
      </li>
    </ul>
  </div>
</template>

<script>

export default {
  props: ['todos'],
}
</script>

<style scoped>
</style>
