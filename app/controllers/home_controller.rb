class HomeController < ApplicationController
  def index
    @current_user_id=session["current_user_id"]
    if @current_user_id.nil?
      @log="login"
    else
      @log="logout"
    end
    @current_user=User.where(id: @current_user_id).take
    @posts=Post.all
  end
  def login
  end
  def logout
    session["current_user_id"]=nil
    redirect_to '/'
  end
  def login_check
    user=User.where(username: params[:username],password: params[:password]).take
    unless user.nil?
     session["current_user_id"]=user.id
    end
    redirect_to '/'
  end
  def new_user
  end
  def new_user_create
    new_user=User.new
    new_user.username=params[:username]
    new_user.password=params[:password]
    new_user.save
    redirect_to '/'
  end
  def create_post
    new_post=Post.new
    new_post.user_id=session["current_user_id"]
    new_post.title=params[:title]
    new_post.content=params[:content]
    new_post.save
    redirect_to '/'
  end
  def create_reple
    new_reple=Reple.new
    new_reple.post_id=params[:post_id]
    new_reple.content=params[:content]
    new_reple.save
    redirect_to '/'
  end
end
