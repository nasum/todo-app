import axios from 'axios'
import $ from 'jquery'
import _ from 'lodash'

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
    return axios({
      method: 'post',
      url: 'todos',
      data: data
    }).then((response) => {
      const todo = response.data.todo
      const error = response.data.error

      if(error.title.length > 0 || error.expired_at.length > 0){
        this.setError(error.title, error.description, error.expired_at)
      } else {
        this.setError()
        this.list.unshift(todo)
      }
    })
  }

  doneTodo (id) {
    return axios({
      method: 'patch',
      url: `todos/${id}`,
      responseType:'json'
    })
  }

  fetchTodoList () {
    return axios({
      method: 'get',
      url: 'todos',
      responseType:'json'
    }).then((response) => {
      this.list.splice(0, this.list.length)
      response.data.forEach((todo) => {
        this.list.unshift(todo)
      })
    })
  }

  setError(title="", description="", expired_at=""){
    this.error.title = title
    this.error.description = description
    this.error.expired_at = expired_at
  }
}
