class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_one_attached :image_name
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  with_options presence: true do
      validates :name
  end
   
   
    has_many :rooms, dependent: :destroy
end
