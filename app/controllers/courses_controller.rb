class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
      respond_to do |format|
        if authorize! :create, @course
         @course.save
            format.html {redirect_to @course, notice: "Course made"}
            format.js {}
          else
            format.html {render 'new', alert: "Course was not created"}
            format.js{}
        end
      end
        rescue CanCan::AccessDenied
        redirect_to action: :index
        flash[:notice] = "#{current_user.first_name} you are not authorized to complete that action"
  end


  def show
    @course = Course.find(params[:id])
  end

  private

  def course_params
    params.require(:course).permit(:subject)
  end


end
