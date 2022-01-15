class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true
  validates :profile, length: { maximum: 200 } 
  validates :age_id, numericality: { other_than: 1 , message: "空では登録できません"} 
  validates :gender_id, numericality: { other_than: 1 , message: "空では登録できません"}
  validates :place_id, numericality: { other_than: 1 , message: "空では登録できません"}
  has_one_attached :avatar
end
