class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # how do we link this to venues#index?
  end
end
