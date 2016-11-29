class Trip < ApplicationRecord
  has_many :tripitems
  belongs_to :user


end
