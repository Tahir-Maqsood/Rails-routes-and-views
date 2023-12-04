class Patient < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :email, presence: true, format: { with: /\A\S+@\S+\.\S+\z/ }
  validates :address, presence: true
end
