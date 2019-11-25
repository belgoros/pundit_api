# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, :name, presence: true, uniqueness: true
  has_many :posts, dependent: :destroy

  enum role: [:local, :national, :admin]
  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :local
  end
end
