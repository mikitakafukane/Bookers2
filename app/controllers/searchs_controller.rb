class SearchsController < ApplicationController
  def search
    @model = params["model"]
    @method = params["method"]
    @content = params["content"]
    @records = search_for(@model,@content,@method)
  end

  private

  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif method == 'forward_match'
        User.where('name LIKE ?', content+'%')
      elsif method == 'backward_match'
        User.where('name LIKE ?','%'+content)
      else
        User.where('name LIKE ?','%'+content+'%')
      end
    elsif model =='book'
      if method == 'perfect'
        Book.where(title: content)
      elsif method == 'forward_match'
        Book.where('name LIKE ?', content+'%')
      elsif method == 'backward_match'
        Book.where('name LIKE ?','%'+content)
      else
        Book.where('name LIKE ?','%'+content+'%')
      end
    end
  end
end
