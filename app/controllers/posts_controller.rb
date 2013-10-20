class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def create
    @post = Post.new(params[:post])
      if @post.save 
         redirect_to posts_path, :notice => "your post was saved"
        else 
         render "new"
        end
  end
  
  def new
    @post = Post.new
  end
  
  
  def show
    @posts = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
   @post = Post.find(params[:id])
   if @post.update_attributes(params[:post])
     redirect_to  posts_path,:notice => "post edited"
   else
     render "edit"
   end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path,:notice => "post deleted"
  end
  
end
