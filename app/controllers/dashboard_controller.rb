class DashboardController < ApplicationController
  before_action :redirect_sign_in

  def index
    @todo = Todo.new
  end
end
