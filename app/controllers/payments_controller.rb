class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  def index
    #@payments = Payment.all
    @payments = Payment.paginate(:page => params[:page], :per_page => 2)
    #@payments = Payment.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    #render :json => @payment, :include => :enrollment => {:only => [:id]}
    render :json => @payment,
      include: { enrollment: { only: :id} }
    
    
  end

  def new
    @payment = Payment.new
  end

  def edit
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.member_id = current_user.id
    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment.enrollment.course, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment.enrollment.course, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to @payment.enrollment.course, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_payment
      @payment = Payment.find(params[:id])
    end

    def payment_params
      params.require(:payment).permit(:amount, :payment_type, :enrollment_id, :office_id, :member_id, :tenant_id)
    end
end
