class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_one_attached :image_name
  has_many :rooms, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  with_options presence: true do
      validates :name
      validates :image_name
  end
   
  def image_url
    return self.image_name.service_url if self.image_name.attached?
  end
   
   
end
