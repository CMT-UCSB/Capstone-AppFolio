class Manager < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :employees
  has_many :notes, dependent: :destroy      #notes destroyed upon account deletion
  has_many :surveys, dependent: :destroy
end
