class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :creature

  validates :start_date, :end_date, presence: true
  validate :end_date_greater_than_start_date, :start_date_greater_than_today, :date_types
  validates :status, inclusion: { in: %w(pending accepted declined),
    message: "Status can only be: accepted, rejected or declined" }

  private

  def date_types
    unless start_date.class == Date.today.class && end_date.class == Date.today.class
      errors.add(:start_date, "Both dates have to be date objects")
    end

  end

  def end_date_greater_than_start_date
    if start_date >= end_date
      errors.add(:start_date, "can't be greater than end date")
    end
  end

  def start_date_greater_than_today
    if start_date < Date.today
      errors.add(:start_date, "Start day have to be greater than today")
    end
  end
end