class Task < ApplicationRecord

  belongs_to :user
  belongs_to :category
  validate :deadline_not_past

  validates :name,
            presence: true,
            length: { maximum: 20 }

  validates :description,
            presence: true,
            length: { maximum: 2500 }

  validates :deadline,
            presence: true

  
  private

  # deadline is an instance of ActiveSupport::TimeWithZone
  # https://api.rubyonrails.org/v6.1.0/classes/ActiveSupport/TimeWithZone.html
  def deadline_not_past
    return if deadline.nil?
    return if deadline.today?
    errors.add(:deadline, "is already past") if deadline.past?
  end

end
