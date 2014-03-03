class MechsController < AngularViewsController
  before_filter :require_user

  def index
    render json: current_user.mechs.to_json
  end

  def create
    @mech = Mech.new
    @mech.name = params[:name]
    @mech.user_id = current_user.id
    @mech.save
  end
end
