# frozen_string_literal: true

# Controller class to manage Users
class UsersController < ApplicationController
  def index
    users = User.all
    render jsonapi: users
  end
end
