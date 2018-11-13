class UsersController < Clearance::UsersController

  def new
    @user = User.new
    render template: "users/new"
  end

  private
    def user_params
      params.require(:user).permit(:email, :username, :password)
    end


end