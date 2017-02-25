class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:seller_center]

  def trouble
  end

  def seller_center
  end
  
end
