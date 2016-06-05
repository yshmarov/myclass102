class HomeController < ApplicationController
  skip_before_action :authenticate_tenant!, :only => [ :index ]

  def index
    if current_user
      redirect_to dashboard_path
    end
  end
  def dashboard
    @events = Event.all
  end

  def settings
  end
end