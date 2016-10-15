class Bankcard < ApplicationRecord
  belongs_to :user

  validates :number, :name, :expires_on, presence: true
end
