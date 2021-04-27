class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_peaple, presence: true
  validate :judge_end_date
  
  def judge_end_date
    if self.end_date && self.start_date && self.end_date < self.start_date ||
    end
  end
  
end
