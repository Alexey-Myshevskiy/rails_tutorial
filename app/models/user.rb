class User < ActiveRecord::Base
	before_save { self.email = email.downcase } # перевод адреса в нижний регистр перед сохранением
	validates :name,  presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  	has_secure_password # атрибут оветственный за пароли
  	validates :password, length: { minimum: 6 }
end
