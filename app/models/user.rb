class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_one_attached :image_name
  has_many :rooms, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable
 
  with_options presence: true do
      validates :name
      validates :email
      validates :password
      validates :password_confirmation
      # validates :image_name
  end
  
  validate :image_name_presence
  
  def image_name_presence
    if image_name.attached?
      if !image_name.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image_name, 'にはjpegまたはpngファイルを添付してください')
      end
    else
      errors.add(:image_name, 'ファイルを添付してください')
    end
  end
  
 

  def image_url
    return self.image_name.service_url if self.image_name.attached?
  end
   
   
end
