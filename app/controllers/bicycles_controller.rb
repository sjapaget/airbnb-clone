class BicyclesController < ApplicationController
  def index
    @bicycles = policy_scope(Bicycle)
  end
end
