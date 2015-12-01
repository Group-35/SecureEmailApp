class EmailsController < ApplicationController

  def new
    @email = Email.new
  end

  def create
    to_user =  User.find_by(username: params[:to_user])
    @email = Email.create(to_user: to_user.id, from_user: current_user.id, data: params[:data])
    redirect_to 'home#index'
  end

  def retrieve_email
  end
  
end
