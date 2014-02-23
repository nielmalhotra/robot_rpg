class RobotsController < AngularViewsController
  def index
  end

  def create
    @robot = Robot.new
    @robot.name = params[:name]
    @robot.save
  end
end
