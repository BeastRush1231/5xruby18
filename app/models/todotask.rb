class Todotask < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  belongs_to :user
  scope :order_by_end_time, -> { order(end_time: :asc) }

  enum status: { upcoming: 1, processing: 2, solved: 3 }

  include AASM

  aasm(column: 'status') do
    state :upcoming, initial: true
    state :processing, :solved

    event :todo do
      transitions from: :upcoming, to: :processing
    end

    event :finish do
      transitions from: :processing, to: :solved
    end
  end

end
