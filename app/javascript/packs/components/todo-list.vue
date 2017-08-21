<template>
  <div class="todo-list">
    <todo-form></todo-form>
    <ul>
      <li v-for="todo in todoList">
        {{ todo.title }}
      </li>
    </ul>
  </div>
</template>

<script>
import TodoForm from './todo-form'
import Todos from '../models/todos'

let todos = new Todos

export default {
  data: function(){
    return {
      todoList: todos.todos
    }
  },
  components: {
    'todo-form': TodoForm
  },
  methods: {
    sendTodo: function (data) {
      console.log(data)
    }
  },
  mounted: function () {
    todos.fetchTodoList()
  }
}
</script>

<style scoped>
</style>
