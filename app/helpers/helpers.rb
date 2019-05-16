class Helpers < ApplicationController
  def self.current_user(session)
    User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
  end

  # def self.redirect_if_not_logged_in(session)
  #   if Helpers.is_logged_in?(session) == false
  #     redirect'/'
  #   end
  # end
end
