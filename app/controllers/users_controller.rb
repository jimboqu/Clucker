class UsersController < Clearance::UsersController

  def new
    @user = User.new
    render template: "users/new"
  end

  def show
    @user = User.find(params[:id])
    @clucks = current_user.clucks
  end

  private
    def user_params
      params.require(:user).permit(:email, :username, :password)
    end


end