class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  

  def after_sign_in_path_for(resource)
    posts_path
  end
  
  
  def set_search
    @query = { title_or_content_cont: params[:q] }
    @search = Post.ransack(@query)
    @search_posts = @search.result.order(created_at: :desc).page(params[:page])
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
