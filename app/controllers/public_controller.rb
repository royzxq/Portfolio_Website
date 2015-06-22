class PublicController < ApplicationController
  layout "public"
	before_action :setup_navigation

  def index
  end

  def show
  end

private
	def setup_navigation
		@subjects = Subject.sorted
	end
end
