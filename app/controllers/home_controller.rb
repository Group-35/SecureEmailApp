class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @good_emails = Email.where(to_user: current_user.id)
    @emails = @good_emails
    @spam_users = Spam.where(belong_to: current_user.id)

    @bad_emails = []

    @emails.each do |e|
      @spam_users.each do |s|
        if (e.from_user == s.bad_user)
          @bad_emails << e
          break
        end
      end
    end

    @bad_emails.each do |b|
      @emails.delete(b)
    end

  end
  
end
