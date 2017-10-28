class IssuesController < ApplicationController
	before_action :set_issue, :only => [:show, :edit, :update, :destroy]
	require 'date'

	def index
		@issues = Issue.all
	end

	def new
		@issue = Issue.new
	end
	# why @issue is singular in new method?

	def create
		@issue = Issue.new(issue_params)
		@issue.save

		redirect_to issues_url
	end

	def update
  		@issue.update_attributes(issue_params)

  		redirect_to issue_path(@issue)
	end

	def destroy	
		if @issue.due_date > Date.today
			@issue.destroy
			redirect_to issues_url
		else
			puts 'You cannot delete item that is already due!'
			render plain: "You cannot delete item that is already due!"
		end
	end


	private
	def set_issue
 		@issue = Issue.find(params[:id])
	end


	def issue_params
		params.require(:issue).permit(:title, :note, :due_date)
	end

end
