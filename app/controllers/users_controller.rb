class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @user = current_user
  end
end
