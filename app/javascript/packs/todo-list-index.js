/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> and
// <%= stylesheet_pack_tag 'hello_vue' %> to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue'
import TodoList from './todo-list.vue'

import Todos from './models/todos'

document.addEventListener('DOMContentLoaded', () => {
  let todos = new Todos

  new Vue({
    el: '#todo-list',
    data: function(){
      return {
        todos: []
      }
    },
    components: {
      TodoList: TodoList
    },
    mounted: function () {
      todos.fetchTodoList(this.todos)
    }
  })
})
