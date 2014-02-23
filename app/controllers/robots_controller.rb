class RobotsController < AngularViewsController
  def index
  end

  def create
    @robot = Robot.new
    @robot.name = params[:name]
    @robot.user_id = current_user.id
    @robot.save
  end
end
