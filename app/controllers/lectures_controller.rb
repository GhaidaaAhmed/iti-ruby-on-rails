class LecturesController < InheritedResources::Base
  before_action :authenticate_user!

  def index
    @lectures = Lecture.all
  end

  def new
    @lecture = Lecture.new
  end

  def like
  @lecture = Lecture.find(params[:id])
  @lecture.liked_by current_user
  redirect_to lecture_path
end

def unlike
  @lecture = Lecture.find(params[:id])
  @lecture.unliked_by current_user
  redirect_to lecture_path
end

  def create
    @lecture = Lecture.new(lecture_params)

    if @lecture.save
      redirect_to lectures_path
    else
      render "new"
    end
  end

  def destroy
    @lecture = Lecture.find(params[:id])
    @lecture.destroy
    redirect_to lectures_path
  end

  private

    def lecture_params
      params.require(:lecture).permit(:content, :course_id, :attachment)
    end
end

