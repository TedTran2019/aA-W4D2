# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  COLORS = %w(black white brown orange)
  SEX = %w(m f)
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS }
  validates :sex, inclusion: { in: SEX }

  def self.colors 
    COLORS
  end

  def age
    time_ago_in_words(birth_date)
  end

  has_many :cat_rental_requests,
  dependent: :destroy
end
