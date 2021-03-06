class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { maximum: 20 }
  validates :name, length: { minimum: 2 }
  validates :introduction, length: { maximum: 50 }

  attachment :profile_image

  def remember_me
    true
  end

end
