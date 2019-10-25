# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, :name, presence: true, uniqueness: true
  has_many :posts, dependent: :destroy
end
