class HomeController < ApplicationController
  skip_before_action :authenticate_tenant!, :only => [ :index ]

  def index
    if current_user
      redirect_to dashboard_path
    end
  end
  def dashboard
    #calendar
    @events = Event.all

    #all expences
    @expences = Expence.all
    @total_expences = @expences.map(&:amount).sum

    @total_works_rendered = @events.map(&:member_event_price).sum
    @accounts_payable = @total_works_rendered - @total_expences
    #@expected_to_be_paid = @total_works_expected 


    #all payments
    @payments = Payment.all
    @total_payments = @payments.map(&:amount).sum

    #all cash collected
    @cash_collections = CashCollection.all
    @total_collected = @cash_collections.map(&:amount).sum

    @to_be_collected = @total_payments - @total_collected
    @cash = @total_collected - @total_expences

    @total_received = @to_be_collected - @total_expences

    @in_office = @payments


    @attendances = Attendance.all
    #now -all. has to be -past
  	@past_services_rendered_price = @attendances.map(&:duepayment).sum
  	@accounts_receivable = @past_services_rendered_price - @total_payments

  end

  def settings
  end
end