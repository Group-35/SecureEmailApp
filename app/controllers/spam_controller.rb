class SpamController < ApplicationController

	before_action :authenticate_user!

	  def index
	    @spam = Spam.where(belong_to: current_user.id)
	    @blacklisted_contacts = []
	    @spam.each do |e|
	      @blacklisted_contacts << User.find(e.bad_user)
	    end
	  end

	  def new
	    @spam = Spam.new
	  end

	  def create
	    new_contact = User.find_by(username: params[:spam][:bad_user])
	    puts new_contact.id
	    Spam.create(belong_to: current_user.id, bad_user: new_contact.id)
	    redirect_to :controller => 'home', :action => 'index'
	  end

	  def destroy
	  	user = User.find(params[:id])
	  	spam = Spam.find_by(bad_user: user.id)

	  	Spam.destroy(spam.id)

	  	redirect_to :controller => 'spam', :action => 'index'

	  end

end
