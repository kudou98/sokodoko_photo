class User::GuestsController < ApplicationController
  def new_guest
     user = User.find_or_initialize_by(email: 'guest@example.com')
   if user.new_record?
     user.name = "ゲスト"
     user.password = SecureRandom.urlsafe_base64
   end
   user.save!
     # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
   sign_in user
   redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
