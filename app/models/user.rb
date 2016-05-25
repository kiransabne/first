class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  #acts_as_voter

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
		    :omniauthable, :omniauth_providers => [:facebook]


   has_many :reviews, dependent: :destroy

   validates :first_name, :last_name, presence: true
   
   def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
	user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
#		user.avatar = auth.info.avatar # assuming the user model has an image
#        user.save!
	end
  end
end

 
   
