class TodosController < ApplicationController
  def index
  end

  def create
    todo = current_user.todos.new(todo_params)

    if todo.valid?
      todo.save

      render json: { message: 'ok' }
    else
      render json: { message: todo.errors.full_messages }
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description, :expired_at)
  end
end
