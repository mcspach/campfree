class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :tents ]

  def home
  end

  def tents
  end

end
