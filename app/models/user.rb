class User < ApplicationRecord
  validates :fullname, :email, presence: true
  validates :email, uniqueness: true
end
