class Tripitem < ApplicationRecord
  belongs_to :trip, optional: true
end
