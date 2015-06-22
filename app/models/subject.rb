class Subject < ActiveRecord::Base

	has_many :posts
	
	validates :name, length: {:in => 3..30}, presence: true

	before_destroy :reset_posts_subject

	scope :sorted, lambda {order(position: :asc)}

	private
	def reset_posts_subject
		self.posts.destroy
	end
end
