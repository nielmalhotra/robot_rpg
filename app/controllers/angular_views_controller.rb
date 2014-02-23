class AngularViewsController < ApplicationController
  before_filter :require_user
  layout false
end
