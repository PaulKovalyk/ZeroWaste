# frozen_string_literal: true

module Admins
  class AdminsController < ApplicationController
    before_action :set_admin

    def edit_password; end

    def update_password
      if @admin.update_with_password(pass_params)
        redirect_to('/admins/users')
      else
        render :edit_password
      end
    end

    private

    def pass_params
      params.require(:admin).permit(:current_password, :password, :password_confirmation)
    end

    def set_admin
      @admin = Admin.find_by(id: params.fetch(:admin_id))
    end
  end
end
  