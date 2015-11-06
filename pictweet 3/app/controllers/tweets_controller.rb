class TweetsController < ApplicationController
before_action :move_to_index, except: :index

  def index
    @tweets = Tweet.order('id DESC').page(params[:page]).per(5)


  end
  def new
    
  end

  def create
      Tweet.create(name: params[:name], image: params[:image], text: params[:text], user_id: current_user.id)
    end



  private
  
  def move_to_index
    
    redirect_to action: :index unless user_signed_in?
  end
end
