class Admin::DashboardsController < ApplicationController

  # app/views/layouts/admin.html.erbを適用
  layout 'admin'
  
  before_action :authenticate_admin!
  def index
    @users = User.all
  end
end
