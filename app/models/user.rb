class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_nickname

  validates :nickname, format: { with: /\A[a-z0-9_]{3,40}\z/ }, presence: true, uniqueness: true

  validates :email, presence: true, uniqueness: true

  private

  def downcase_nickname
    nickname.downcase!
  end
end
