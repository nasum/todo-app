import axios from 'axios'
import $ from 'jquery'

axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content')

export default class Todo {
  constructor () {
    this.list = [],
    this.error = {
      title: '',
      description: '',
      expired_at: ''
    }
  }

  putTodo (data) {
    axios({
      method: 'post',
      url: 'todos',
      data: data
    }).then((response) => {
      const todo = response.data.todo
      const error = response.data.error

      if(error.title || error.expired_at){
        this.error.title = error.title
        this.error.description = error.description
        this.error.expired_at = error.expired_at
      } else {
        this.list.push(todo)
      }
    })
  }

  fetchTodoList () {
    axios({
      method: 'get',
      url: 'todos',
      responseType:'json'
    }).then((response) => {
      response.data.forEach((todo) => {
        this.list.push(todo)
      })
    })
  }
}
