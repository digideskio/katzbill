class Account < ActiveRecord::Base
  has_many :payments
  has_many :bills
  has_many :paychecks
  has_many :users

  before_validation :generate_token

  validates :token, uniqueness: true, presence: true

  private

  def generate_token
    self.token = SecureRandom.hex(10) unless token?
  end
end
