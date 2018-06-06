class CommentsController < ApplicationController
	before_action :set_post, :set_comment

	def index
		@comment = @post.comments
	end

	def new
		@comment = Comment.new
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
     	params.require(:comment).permit(:content,:user,:post)
    end

    def set_post
    	@post = Post.find(params[:post_id])
    end

end
