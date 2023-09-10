class Company < ApplicationRecord
  before_save :capitalize_name

  has_many :invoices, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true

  def capitalize_name
    self.name = self.name.capitalize
  end

  def self.invoices_for_user(user_id)
    joins(:invoices).where(invoices: { user_id: }).distinct
  end
end
