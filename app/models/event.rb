class Event < ApplicationRecord
  validates :title, presence: true
  attr_accessor :date_range

  def all_day_event?

  end
end
