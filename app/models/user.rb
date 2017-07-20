class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  has_many :todos, foreign_key: :created_by
  # Validations
  validates_presence_of :name, :email, :password_digest

  def self.find_or_create_from_auth_hash(auth)
    where(provider: auth[:provider], uid: auth[:uid]).first_or_initialize.tap do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
      user.name = auth[:name]
      user.email = auth[:email]
      user.password = "#{auth[:provider]} #{auth[:uid]}"
      user.picture = auth[:image]
      user.save!
    end
  end
end
