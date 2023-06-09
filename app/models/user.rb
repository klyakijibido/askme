class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :nickname, format: { with: /\A[a-z0-9_]{3,40}\z/ }, presence: true, uniqueness: true

  validates :email, format: { with: /\A[a-z0-9._%+-]+@[a-z0-9-]+.+.[a-z]{2,4}\z/ },  presence: true, uniqueness: true

  def downcase_nickname
    nickname.downcase!
  end
end
