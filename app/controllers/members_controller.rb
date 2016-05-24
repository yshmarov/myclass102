class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  # uncomment to ensure common layout for forms
  # layout  "sign", :only => [:new, :edit, :create]
  def index
    @members = Member.all
  end
  def show
    @events = @member.events

    #all past & future events
    @past_events = @member.events.where('starts_at < ?', Time.now).order('starts_at ASC')
    @future_events = @member.events.where('starts_at > ?', Time.now).order('starts_at ASC')

    #price of all events>
    @total_member_event_price = @member.products.sum(:member_price)

    #price of past & future events>
    @total_member_event_price_past = @past_events.map(&:member_event_price).sum
    @total_member_event_price_future = @future_events.map(&:member_event_price).sum

    #count all past & future events
    @past_events_count = @past_events.count(:id)
    @future_events_count = @future_events.count(:id)

    #@paid_to_member = @member.expences.sum(:amount)
  end
  
  def edit
  end
  
  def new()
    @member = Member.new()
    @user   = User.new()
  end

  def create()
    @user   = User.new( user_params )
    # ok to create user, member
    if @user.save_and_invite_member() && @user.create_member( member_params )
      flash[:notice] = "New member added and invitation email sent to #{@user.email}."
      redirect_to members_path
    else
      flash[:error] = "errors occurred!"
      @member = Member.new( member_params ) # only used if need to revisit form
      render :new
    end
  end

  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_member
    @member = Member.find(params[:id])
  end

  def member_params()
    params.require(:member).permit(:first_name, :last_name)
  end

  def user_params()
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
