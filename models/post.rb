class Post < ActiveRecord::Base

	belongs_to :subject

	validates :title, length:{:in => 2..40}, presence:true
	validates :context, presence:true

	scope :sorted, lambda{order(title: :asc)}
end
