class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def create
    @post=Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:text))
      if @comment.save
        redirect_to post_path(@post), notice: 'Comment was successfully created.'
      else
     render 'new'
      end
  end

  def edit
    @post=Post.find(params[:post_id])
    @comment= @post.comments.find(params[:id])
    
  end

  def update
    @post=Post.find(params[:post_id])
    @comment= @post.comments.find(params[:id])
    if @comment.update(params[:comment].permit(:text))
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post=Post.find(params[:post_id])
    @comment= @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end
    def comment_params
      params.require(:comment).permit(:text, :post_id, :user_id)
    end
end
