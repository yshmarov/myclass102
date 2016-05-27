class CoursesController < ApplicationController
  #before_action :set_course, only: [:show, :edit, :update, :destroy, :editclean]
  before_action :set_course, only: [:show, :edit, :edit_events, :edit_attendances, :update, :destroy]
  #before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
  #to see tenant info
    #@tenant = Tenant.current_tenant
    @courses = Course.all
  end

  def edit_events
    @course.events.build
    @course.attendances.build
  end

  def edit_attendances
    @course.events.build
    @course.attendances.build
  end

  def show
  #for calendar, past, future events
    @events = @course.events.order('starts_at ASC')
    @past_events = @course.events.where('starts_at < ?', Time.now).order('starts_at ASC')
    @future_events = @course.events.where('starts_at > ?', Time.now).order('starts_at ASC')
  #price of attendances
    @attendances = @course.attendances
    @totalduepaymentguest = @attendances.map(&:duepayment).sum
  #enrollment list
    @enrollments = @course.enrollments
    @totalenrollments = @course.enrollments.count
  #payments and their sum
    @payments = @course.payments
    @enrollmentpaymentz = @payments.map(&:amount).sum
    @totalpayments = @course.payments.count
  #new payment
    @payment = Payment.new
    @payment.member_id = current_user.id
  #new enrollment
    @enrollment = Enrollment.new
    @enrollment.member_id = current_user.id
  end

  def new
    @course = Course.new
  end

  def edit
    #@offices = Office.all
    #@course.events.build
    #@course.attendances.build
  end

  def create
    #@course.member_id = current_user.id
    @course = Course.new(course_params)
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    #@course.member_id = current_user.id
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

    #without enrollment
    def course_params
      params.require(:course).permit(:name, :product_id, :attr1_id, :attr2_id, :attr3_id, :tenant_id, events_attributes: [:id, :starts_at, :room_id, :member_id, :tenant_id, :_destroy, attendances_attributes: [ :id, :attendance_rate_id, :client_id, :tenant_id, :_destroy ]])
    end

    #all
    #def course_params
    #  params.require(:course).permit(:name, :product_id, :attr1_id, :attr2_id, :attr3_id, :tenant_id, events_attributes: [:id, :starts_at, :room_id, :member_id, :tenant_id, :_destroy, attendances_attributes: [ :id, :attendance_rate_id, :client_id, :tenant_id, :_destroy ]], enrollments_attributes: [:id, :client_id, :coupon_id, :member_id, :tenant_id, :_destroy])
    #end

    #only enrollment    
    #def enroll_params
    #  params.require(:course).permit(:name, :product_id, :attr1_id, :attr2_id, :attr3_id, :tenant_id, enrollments_attributes: [:id, :client_id, :coupon_id, :member_id, :tenant_id, :_destroy])
    #end
end
