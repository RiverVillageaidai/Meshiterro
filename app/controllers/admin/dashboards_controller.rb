class Admin::DashboardsController < ApplicationController

  # app/views/layouts/admin.html.erbを適用
  layout 'admin'
  
 
  def index
    @users = User.all
  end
end
