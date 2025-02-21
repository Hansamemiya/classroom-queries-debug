class CoursesController < ApplicationController
  def index
    @courses = Course.all.order({ :created_at => :desc })
    render({ template: "courses/index" })
  end

  def show
    the_id = params.fetch("path_id")
    @course = Course.where({ :id => the_id }).at(0)

    if @course
      render({ template: "courses/show" })
    else
      redirect_to("/courses", { alert: "Course not found." })
    end
  end

  def create
    @course = Course.new
    @course.title = params.fetch("query_title", "").strip
    @course.term_offered = params.fetch("query_term_offered", "").strip
    @course.department_id = params.fetch("query_department_id", "").strip

    if @course.save
      redirect_to("/courses", { notice: "Course created successfully." })
    else
      redirect_to("/courses", { alert: "Course creation failed: " + @course.errors.full_messages.join(", ") })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @course = Course.where({ :id => the_id }).at(0)

    if @course
      @course.title = params.fetch("query_title", @course.title).strip
      @course.term_offered = params.fetch("query_term_offered", @course.term_offered).strip
      @course.department_id = params.fetch("query_department_id", @course.department_id).strip

      if @course.save
        redirect_to("/courses/#{@course.id}", { notice: "Course updated successfully." })
      else
        redirect_to("/courses/#{@course.id}", { alert: "Course update failed: " + @course.errors.full_messages.join(", ") })
      end
    else
      redirect_to("/courses", { alert: "Course not found." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @course = Course.where({ :id => the_id }).at(0)

    if @course
      @course.destroy
      redirect_to("/courses", { notice: "Course deleted successfully." })
    else
      redirect_to("/courses", { alert: "Course not found." })
    end
  end
end
