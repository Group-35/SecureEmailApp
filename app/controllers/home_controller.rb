class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @emails = Email.where(to_user: current_user.id)
  end
  
end
