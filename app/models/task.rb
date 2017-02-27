class Task < ApplicationRecord
  belongs_to :user

  scope :complete, -> { where(complete: true) }
  scope :incomplete, -> { where(complete: false) }

  validates :name, presence: true

  def mark_complete!
    self.update_attribute(:complete, true)
  end
end
