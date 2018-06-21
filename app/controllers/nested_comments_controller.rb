class NestedCommentsController < ApplicationController
	before_action :set_post
	before_action :set_comment, except: [:new, :create]
  before_action :set_parent_comment

	def index
    @comment = @comment.comment
	end

	def new
    @comment = @comment.Comment.new()
	end

	def create
		@comment = @comment.comments.build({user: current_user}.merge(comment_params))
		if @comment.save
			redirect_to post_path(@post), notice: 'Comment was successfully created.'
		else
			render :new
		end
	end

	def show

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
    	@comment = Comment.find(params[:id])
    end

    def set_parent_comment
      @parent_comment = Comment.find(params[:comment_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
     	params.require(:comment).permit(:content,:user,:post)
    end

    def set_post
      return unless params[:post_id]
    	@post = Post.find(params[:post_id])
    end


end
