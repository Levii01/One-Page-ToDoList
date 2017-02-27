class Task < ApplicationRecord
  belongs_to :user
  validates :name, presence: true

  scope :complete, -> { where(complete: true) }
  scope :incomplete, -> { where(complete: false) }

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def mark_complete!
    self.update_attribute(:complete, true)
  end

  def mark_incomplete!
    self.update_attribute(:complete, false)
  end
end
