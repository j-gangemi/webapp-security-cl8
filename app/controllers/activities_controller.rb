class ActivitiesController < ApplicationController

  def create
    @user = User.find_by({"id" => session["user_id"]})
    if @user != nil
      @activity = Activity.new
      @activity["contact_id"] = params["contact_id"]
      @activity["activity_type"] = params["activity_type"]
      @activity["note"] = params["note"]
      @activity["user_id"] = @user["id"]
      @activity.save
      redirect_to "/contacts/#{@activity["contact_id"]}"
    else
      redirect_to "/login"
    end
  end

end
