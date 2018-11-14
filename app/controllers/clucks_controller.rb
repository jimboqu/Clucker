class ClucksController < ApplicationController
  
  def create
  	cluck = current_user.clucks.create(cluck_params)
  	#error message set up as we'll not be using show. Saving the above in variable. Redirect 
    redirect_to root_path, redirect_options_for(cluck)
  end


  private

    def cluck_params
      params.require(:cluck).permit(:body)
    end

    def redirect_options_for(cluck)
      if cluck.persisted?
      	{notice: "Clucked ok"}
      else
      	{alert: "Not a Cluck!" }
      end
    end
end