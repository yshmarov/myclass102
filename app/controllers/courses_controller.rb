class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_tenant, only: [:show, :edit, :update, :destroy, :new, :create]
  before_action :verify_tenant
  
  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to root_url, notice: 'Course was successfully created.' }
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
        format.html { redirect_to root_url, notice: 'Course was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :product_id, :attr1_id, :attr2_id, :attr3_id, :tenant_id)
    end
    def set_tenant
      @tenant = Tenant.find(params[:tenant_id])
    end
  
    def verify_tenant
      unless params[:tenant_id] == Tenant.current_tenant_id.to_s
        redirect_to :root, 
              flash: { error: 'You are not authorized to access any organization other than your own'}
      end
    end
end
