class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true

  validates :email, format: URI::MailTo::EMAIL_REGEXP

  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email.downcase)
    user&.valid_password?(password) ? user : nil
  end

  has_many :reservations, dependent: :destroy
end
