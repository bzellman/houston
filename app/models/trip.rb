class Trip < ApplicationRecord
  has_many :tripitems
  # belongs_to :user

  before_create :randomize_id

  private

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000_000_000_000)
    end while Trip.where(id: self.id).exists?
  end


end
