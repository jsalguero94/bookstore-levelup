class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :requests, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :books, through: :comments

  validates :first_name, :last_name, :date_of_birth, presence: true
end
