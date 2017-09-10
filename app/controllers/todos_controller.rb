class TodosController < ApplicationController
  def index
    @todos = @current_user.todos.default
    render locals: { todos: @todos }
  end

  def create
    todo = current_user.todos.new(todo_params)
    todo.save
    logger.error todo.errors.to_json
    render locals: { todo: todo }
  end

  def edit
  end

  def update
    todo = Todo.find(params[:id])
    todo.done!
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description, :expired_at)
  end
end
