class DefaultController < ApplicationController
  before_action :redirect_dashboard
  
  def index
  end

  private

  def redirect_dashboard
    if session[:user_id]
      redirect_to dashboard_index_path
    end
  end
end
