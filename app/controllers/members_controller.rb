class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  # uncomment to ensure common layout for forms
  # layout  "sign", :only => [:new, :edit, :create]
  def index
    @members = Member.all
  end
  def show
    if current_user.is_admin == false
      @member =  current_user.member
    end
    @events = @member.events
    #past & future events
    @past_events = @member.events.where('starts_at < ?', Time.now).order('starts_at ASC')
    @future_events = @member.events.where('starts_at > ?', Time.now).order('starts_at ASC')
  end
  
  def edit
    if current_user.is_admin == false
      @member =  current_user.member
    end
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
    if current_user.is_admin == true
      @member.destroy
      respond_to do |format|
        format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to members_path, notice: 'Suicide successfully prevented ;)'
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
