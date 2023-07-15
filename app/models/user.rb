class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_nickname, :downcase_email

  validates :nickname, format: { with: /\A[a-z0-9_]{3,40}\z/ }, presence: true, uniqueness: true

  validates :email, format: { with: /\A[a-z0-9._%+-]+@[a-z0-9-]+.+.[a-z]{2,4}\z/ },  presence: true, uniqueness: true
  validates :header_color, format: { with: /\A#([a-f0-9]{3}){1,2}\z/i }

  has_many :questions, dependent: :delete_all

  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'robohash')

  private

  def downcase_nickname
    nickname.downcase!
  end

  def downcase_email
    email.downcase!
  end
end
