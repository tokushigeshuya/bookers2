class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :name, uniqueness: true

          has_many :books, dependent: :destroy
          has_one_attached :profile_image

     def get_image
        unless profile_image.attached?
         file_path = Rails.root.join('app/assets/images/no_image.jpg')
         profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        profile_image
     end

end
