<template>
  <div class="todo-list">
    <todo-form @sendTodo="sendTodo" :error="error"></todo-form>
    <div class="todo-list__list-area">

      <transition-group name="list" tag="ul">
        <li class="todo-list__item"
            v-for="todo, index in todoList"
            key="{{index}}"
            @dblclick="doneTodo(todo)">
          <div class="todo-list__item-title">
            {{ todo.title }}
          </div>
          <div class="todo-list__item-expired">
            expired_at : {{ todo.expired_at }}
          </div>
        </li>
      </transition-group>
    </div>
  </div>
</template>

<script>
import TodoForm from './todo-form'
import Todos from '../models/todos'

let todos = new Todos

export default {
  data: function(){
    return {
      todoList: todos.list,
      error: todos.error
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
    },
    doneTodo: function (data) {
      todos.doneTodo(data.id).then(() => {
        todos.fetchTodoList()
      })
    }
  },
  mounted: function () {
    todos.fetchTodoList()
  }
}
</script>

<style lang="scss" scoped>
@import '../style/colors';

.todo-list {
  padding-top: 30px;

  &__list-area {
    box-sizing: border-box;
    margin: 30px auto 0 auto;
    width: 600px;

    ul {
      padding: 0px;
    }
  }

  &__item {
    background-color: #ffffff;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0,0,0,.26);
    cursor: pointer;
    margin-bottom: 30px;
    list-style: none;
    padding: 15px;
  }

  &__item-title {

  }

  &__item-expired {
    text-align: right;
  }
}

.list-enter-active, .list-leave-active {
  transition: all 1s;
}
.list-enter, .list-leave-to {
  opacity: 0;
  transform: translateY(-30px);
}

</style>
