module Olala
  class LabelsController < ApplicationController

    before_filter :check_admin_right
    protect_from_forgery :except => :create

    def check_admin_right
      unless admin_signed_in?
        raise 'Access denied'
      end
    end

    def create
      params.permit(:label, :content)
      label = Label.find_or_create_by_label params[:label]
      label.content = params[:content] if params[:content]
      label.save
      expire_fragment 'home'
      render text: 'ok'
    end
  end
end