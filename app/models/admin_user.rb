class AdminUser < ActiveRecord::Base

	has_secure_password
	EMAIL_REGEX = /\A.+@.+\z/i

	validates :first_name, presence: true, length:{:in => 2..20}
	validates :last_name, presence: true, length:{:in => 2..20}
	validates :username, presence: true, length:{:in => 2..20}, uniqueness: true
	# validates :email, presence: true, length:{:in => 2..20}, format: EMAIL_REGEX, confirmation:true

	scope :sorted, lambda{order(username: :asc)}

	def name
		"#{first_name} #{last_name}"
	end

end
