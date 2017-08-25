<template>
  <div class="todo-list">
    <todo-form @sendTodo="sendTodo"></todo-form>
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
      todos.putTodo({
        todo: {
          title: data.title,
          description: data.description,
          expired_at: data.expired_at
        }
      })
    }
  },
  mounted: function () {
    todos.fetchTodoList()
  }
}
</script>

<style scoped>
</style>
