class MechsController < AngularTemplatesController
  before_filter :require_user

  def index
    render json: current_user.mechs.to_json
  end

  def create
    mech = Mech.create do |mech|
      mech.name = params[:name]
      mech.user_id = current_user.id
    end
    if mech.valid?
      render json: {success: "You have created a mech named #{mech.name}"}
    else
      raise ValidationException.new('Mech Not Created. Do it better!')
    end
  end
end
