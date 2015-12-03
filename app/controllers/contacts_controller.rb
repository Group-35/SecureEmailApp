class ContactsController < ApplicationController

  before_action :authenticate_user!

  def index
    @contacts = Contact.where(belong: current_user.id)
    @all_contacts = []
    @contacts.each do |e|
      @all_contacts << User.find(e)
    end
  end

  def new
    @contact = Contact.new
  end

  def create
    new_contact = User.find_by(username: params[:contact][:contact])

    Contact.create(belong: current_user.id, contact: new_contact.id)
    redirect_to :controller => 'home', :action => 'index'
  end

end
