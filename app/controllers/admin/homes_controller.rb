class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
  end

  def search
    @model = params['search']['model']
    @content = params['search']['content']
    @method = params['search']['method']
    @result = search_for(@model, @content, @method)
  end


  private

  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(
          'name LIKE ?',
          content, content, content, content
        )
      else
        User.where(
          'name LIKE ?',
          "%#{content}%", "%#{content}%", "%#{content}%", "%#{content}%"
        )
      end
    else
      [] # 空配列を返す
    end
  end


end
