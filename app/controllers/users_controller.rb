class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      cookies[:auth_token] = @user.auth_token
      redirect_to unassigned_tickets_path, :notice => "Signed up!"
    else
      render "new"
    end
  end

end
