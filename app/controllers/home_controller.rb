class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @emails = [Email.find_by(to_user: current_user.id)].to_a
  end
  
end
