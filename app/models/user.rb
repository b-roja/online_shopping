class User < ApplicationRecord
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :password , presence: true
	validates :confirm_password , presence: true
	validates :mobile, presence: true, numericality: true
  has_one :image
  has_and_belongs_to_many :roles
  accepts_nested_attributes_for :image
    before_save :encrypt_password
    
    before_validation :verify_password
def  admin?
  self.roles.pluck(:name).include?("admin")
end
def check_name
  if name.blank?
    self.name="unknown"
  end 
end

   def encrypt_password
   	unless password.nil?
       self.password = Digest::MD5.hexdigest(password)
       self.confirm_password = Digest::MD5.hexdigest(confirm_password)
    end
end
    def verify_password
    	unless password.nil?
     	if password != confirm_password
           errors.add(:base, "password & confirm_password are not equal!" )
    	end
    end
    end
    def self.authenticate(email, password)
       if @user = User.where(email: email, password: Digest::MD5.hexdigest(password)).last
           @user
        else
           nil
         end
     end
end



