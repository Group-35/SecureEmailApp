class EmailsController < ApplicationController

  before_action :authenticate_user!

  def new
    @email = Email.new
  end

  def create

    to_user =  User.find_by(username: params[:email][:to_user])
    
    @email = Email.create(to_user: to_user.id, from_user: current_user.id, data: params[:email][:data], created_at: DateTime.now, updated_at: DateTime.now)
    redirect_to :controller => 'home', :action => 'index'
  end
  
end
