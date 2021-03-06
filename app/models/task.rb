class Task < ApplicationRecord

  belongs_to :user
  belongs_to :category
  has_rich_text :description
  validate :deadline_not_past

  scope :near_deadline, -> { where("completed = false and deadline <= '#{Date.today}'") }

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
  def deadline_not_past
    return if (deadline.nil? or deadline.today?)

    if self.new_record?
      return errors.add(:deadline, "is already past") if deadline.past?
    end

    unless self.new_record?
      old_deadline, new_deadline = self.deadline_change

      return if old_deadline.nil?

      return if ((new_deadline == old_deadline) and !new_deadline.past?)

      return errors.add(:deadline, "is already past") if new_deadline.past?
    end
  end

end
