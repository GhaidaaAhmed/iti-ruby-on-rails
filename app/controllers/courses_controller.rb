class CoursesController < InheritedResources::Base
  before_action :authenticate_user!, :set_user

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    else
      render "new"
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end
  
  def set_user
    if user_signed_in?
      @user=current_user
    end
  end
  private
    def course_params
      params.require(:course).permit(:title).merge(user_id: current_user.id)
    end
end

