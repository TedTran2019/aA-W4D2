# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :cat, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validate :does_not_overlap_approved_request
  validate :time_traveller

  belongs_to :cat

  def overlapping_requests
    #CatRentalRequest.where(start_date: start_date..end_date)
    #.or(CatRentalRequest.where(end_date: start_date..end_date))
    CatRentalRequest.where.not("start_date > #{end_date} AND end_date < #{start_date}")
    .where.not(id: id)
    .where(cat_id: cat_id)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    unless overlapping_approved_requests.empty?
      errors[:one_cat_one_time] << "A cat can't be rented twice at the same time!"
    end
  end

  def time_traveller
    if start_date >= end_date
      errors[:date] << "Start date cannot be later than end date!"
    end
  end
end
