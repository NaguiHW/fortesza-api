class Company < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true
end
