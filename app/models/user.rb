class User < ApplicationRecord
  attr_accessor :old_password, :remember_token, :activation_token
  before_create :create_activation_digest
  has_secure_password validations: false

  has_many :twits, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :password, presence: true
  validate :correct_old_password, on: :update, if: -> { password.present? }
  validates :password, confirmation: true, allow_blank: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  

  def remember_me
    self.remember_token = SecureRandom.urlsafe_base64
    update_column :remember_token_digest, digest(remember_token)
  end

  def forget_me
    update_column :remember_token_digest, nil
    self.remember_token = nil
  end

  def digest(string)
    cost = if ActiveModel::SecurePassword
              .min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end

  def remember_token_authenticated?(remember_token)
    return false unless remember_token_digest.present?

    BCrypt::Password.new(remember_token_digest).is_password?(remember_token)
  end

  private

  def correct_old_password
    return if BCrypt::Password.new(password_digest_was).is_password?(old_password)

    errors.add :old_password, 'is incorrect'
  end

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/

    errors.add :password,
               'Complexity requirement not met. Length should be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end

  private 

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

end
