import axios from 'axios'
import $ from 'jquery'

axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content')

export default class Todo {
  fetchTodoList(todos){
    axios({
      method:'get',
      url: 'todos',
      responseType:'json'
    })
      .then((response) => {
        response.data.forEach((todo) => {
          todos.push(todo)
        })
      })
  }
}
