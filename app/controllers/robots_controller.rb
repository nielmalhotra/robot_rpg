class RobotsController < AngularViewsController
  def index
    render json: current_user.robots.to_json
  end

  def create
    @robot = Robot.new
    @robot.name = params[:name]
    @robot.user_id = current_user.id
    @robot.save
  end
end
