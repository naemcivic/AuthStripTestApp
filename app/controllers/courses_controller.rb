class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
  end


  def show
    @course = Course.find(params[:id])
  end

  private

  def course_params
    params.require(:course).permit(:subject)
  end


end
