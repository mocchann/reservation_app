class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_peaple, presence: true
  validate :start_end_check
  
  def start_end_check
    errors.add(:end_date, "は開始日より前の日付は登録できません") unless self.start_date < self.end_date
  end
  
end
