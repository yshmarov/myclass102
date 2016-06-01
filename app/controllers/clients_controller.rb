class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.all
  end

  def show
  #enrollment list
    @enrollments = @client.enrollments
    #@totalenrollments = @client.enrollments.count
  #attendance list and calendar
    @attendances = @client.attendances
    #@totalatt = @client.attendances.count
  #price of attendances used and expected to use
    #@totalduepaymentclient = @attendances.map(&:duepayment).sum
  #payment list
    @payments = @client.payments.order('created_at ASC')
    #@totalpay = @client.payments.count
  #sum of payments
    #@totalpaidbyclient = @payments.map(&:amount).sum

  #past and future attendances
    #@past_attendances = @attendances.order('startz ASC') #.where('startz < ?', Time.now).order('startz ASC')
    #@future_attendances = @guest.attendances.where('event.starts_at > ?', Time.now) #.order('startz ASC')
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:first_name, :middle_name, :last_name, :email, :tel1, :tel2, :dob, :sex, :address, :lead_source_id, :tenant_id)
    end
end
