# encoding: UTF-8
#
class AccountController < ApplicationController
  before_action :authenticate_user!

  def index
  end
end
