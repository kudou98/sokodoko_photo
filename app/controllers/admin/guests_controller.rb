class Admin::GuestsController < ApplicationController
  def new_guest
   user = User.find_or_create_by!(email: 'guest@example.com') do |user|
     user.name = "ゲスト"
     user.password = SecureRandom.urlsafe_base64
     user.password_confirmation = user.password
     # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
   end
   sign_in user
   redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
