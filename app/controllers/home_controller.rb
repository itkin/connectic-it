class HomeController < ApplicationController

  before_filter :authenticate_admin!, if: proc{ admin_namespace? and not admin_signed_in? }

  def index
  end

end
