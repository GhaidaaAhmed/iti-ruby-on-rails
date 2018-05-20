class LecturesController < InheritedResources::Base
  before_action :authenticate_user!

  def index
    course = Course.find(params[:course_id]) 
    @lectures = course.lectures
   
  end

  def new
    @course = Course.find params[:course_id]
    @lecture = Lecture.new(:course=>@course)
  end

  def like
  @lecture = Lecture.find(params[:id])
  @lecture.liked_by current_user
  redirect_to([@lecture.course, @lecture])
end

def unlike
  @lecture = Lecture.find(params[:id])
  @lecture.unliked_by current_user
  redirect_to([@lecture.course, @lecture])
end

def dislike
  @lecture = Lecture.find(params[:id])
  @lecture.disliked_by current_user
  redirect_to([@lecture.course, @lecture])
end

def undislike
  @lecture = Lecture.find(params[:id])
  @lecture.undisliked_by current_user
  redirect_to([@lecture.course, @lecture])
end

  def create
    @lecture = Lecture.new(lecture_params)

    if @lecture.save
      redirect_to([@lecture.course, @lecture])
    else
      render "new"
    end
  end

  def destroy
    @lecture = Lecture.find(params[:id])
    @lecture.destroy
    redirect_to([@lecture.course, @lecture])
  end

  def edit
    course = Course.find(params[:course_id])
    @lecture = course.lectures.find(params[:id])
  end

  def update
    course = Course.find(params[:course_id])
    @lecture = course.lectures.find(params[:id])
      if @lecture.update_attributes(lecture_params)
        redirect_to([@lecture.course,@lecture], :notice => 'Lecture was successfully updated.') 
      else
        render :action => "edit" 
      end
  end

  def spam
    course = Course.find(params[:course_id])
    @lecture = course.lectures.find(params[:id])
    @user=current_user
    if(!@user.lectures.exists?(@lecture.id))
      @user.lectures << @lecture
      @user.save
    end
    redirect_to([@lecture.course,@lecture])
   end

  # GET /products/1/rm_fav
  def rm_spam
    course = Course.find(params[:course_id])
    @lecture = course.lectures.find(params[:id])
    @user=current_user
    @user.lectures.delete(@lecture)
    redirect_to([@lecture.course,@lecture])
   end

  private

    def lecture_params
      params.require(:lecture).permit(:content, :course_id, :attachment)
    end
end

