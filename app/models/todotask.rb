class Todotask < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  belongs_to :user
  scope :order_by_end_time, -> { order(end_time: :asc) } 
end
