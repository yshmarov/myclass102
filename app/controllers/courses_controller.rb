class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @tenant = Tenant.current_tenant
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
    #@tenant = Tenant.current_tenant
  end

  def edit
    @offices = Office.all
    @course.events.build
    @course.attendances.build
    #@tenant = Tenant.current_tenant
  end

  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :product_id, :attr1_id, :attr2_id, :attr3_id, :tenant_id, events_attributes: [:id, :starts_at, :room_id, :member_id, :tenant_id, :_destroy, attendances_attributes: [ :id, :attendance_rate_id, :client_id, :tenant_id, :_destroy ]])
    end
end
