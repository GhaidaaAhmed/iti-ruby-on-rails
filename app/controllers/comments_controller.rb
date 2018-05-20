class CommentsController < InheritedResources::Base
  before_action :authenticate_user!, except: [:index]
  before_action :find_lecture

  def index
    @comments = @lecture.comments.order(created_at: :desc)
  end

  def new
    @comment = Comment.new(lecture_id: params[:lecture_id])
  end

  def create
    @comment = @lecture.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
  end


  def destroy
    @comment = @lecture.comments.find(params[:id])

    if @comment.user_id == @current_user_id
      @comment.destroy
      redirect_to([@lecture.comments, @comment])    
    else
      
    end
  end

  
  private

    def find_lecture
     @lecture = Lecture.find(params[:lecture_id])
    end
    def comment_params
      params.require(:comment).permit(:body)
    end
end

