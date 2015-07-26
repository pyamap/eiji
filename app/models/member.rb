class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
		
		before_save { self.email = email.downcase}
		#↑Email Addressを全て小文字に直している。
		attr_accessor :password, :password_confirmation
		#パスワードの認証。２回入力
		validates(:name, presence: true, length: {maximum:15})
		validates(:full_name, presence: true)
		VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
		validates :email, presence:true, format: { with: VALID_EMAIL_REGEX},
						  uniqueness: {case_sensitive:false}
		validates :password, presence: { on: :create},
			confirmation: { allow_blank: true}
		
		def password=(val)
			if val.present?
				self.hashed_password = BCrypt::Password.create(val)
			end
			@password = val
		end	

	class << self
		def search(query)
			rel = order("name")
			if query.present?
				rel = rel.where("name LIKE ? OR full_name LIKE ?",
					"%#{query}%", "%#{query}%")
			end
			rel
		end
	end
end



#	validates :name, presence: true,
#	format: { with: /¥A[A-Za-z]¥w*¥z/, allow_blank: true},
#	length: { minimum: 2, maximum: 20, allow_blank: true},
#	uniqueness: { case_sensitive: false}
#
#	validates :full_name, length: {maximum: 20}
#
#	validates :name,presence: true
#	def add_error_sample
#		#emailが空のときにエラーメッセージ表示
#		if name.empty?
#			errors.add(:name, "が空のままです")
#			errors[:base]<< "モデル全体に関係するエラーです"
#	end 