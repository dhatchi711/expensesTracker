class UserModel < ApplicationRecord
  devise :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :expenses, dependent: :destroy
end
