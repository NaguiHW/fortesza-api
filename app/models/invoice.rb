class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :company

  validates :start_date, :end_date, :amount, :expected_amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validate :validate_end_date
  validate :validate_collected_date
  validate :validate_expected_amount
  enum status: { in_progress: 0, late: 1, collected: 2 }

  def validate_end_date
    return unless end_date.to_date < start_date.to_date

    errors.add(:end_date, 'must be after start date')
  end

  def validate_collected_date
    if collected_date.present?
      return unless collected_date.to_date < start_date.to_date

      errors.add(:collected_date, 'must be after start date')
    end
  end

  def validate_expected_amount
    return unless expected_amount < amount

    errors.add(:expected_amount, 'must be greater than amount')
  end
end
