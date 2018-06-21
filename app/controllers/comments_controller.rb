class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, except: [:new, :create]

  def index
    @comment = @post.comments
  end

  def new
    @comment = @post.comments.new()
  end

  def create
    @comment = @post.comments.build({user: current_user}.merge(comment_params))
    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def show
    @new_comment = @comment.comments.new
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post), notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post), notice: 'Comment was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content,:user,:post)
    end

    def set_post
      return unless params[:post_id]
      @post = Post.find(params[:post_id])
    end

    def set_parent_comment
      return unless params[:comment_id]
      @parent_comment = @post.comments.find(params[:comment_id])
    end
end
