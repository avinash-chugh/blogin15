class CommentsController < ApplicationController
  http_basic_authenticate_with name: "avinash", password: "p@ssw0rd", except: [:destroy]
  
  before_filter do 
    @post = Post.find_by_id(params[:post_id])
  end
  
  def create
    @post.comments.create(params[:comment])
    redirect_to @post
  end
  
  def destroy
    comment = Comment.find_by_id(params[:id])
    comment.destroy
    redirect_to @post
  end  
end
