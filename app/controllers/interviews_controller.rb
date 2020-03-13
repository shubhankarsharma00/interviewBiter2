require 'date'
class InterviewsController < ApplicationController
	def new
		@interview = Interview.new
	end
	def show
    @interview = Interview.find(params[:id])
    @interview_participants = InterviewParticipant.where(interview_id: params[:id])
  end
	def create
		@start_time = DateTime.new(params["interview"][:"start_time(1i)"].to_i,params["interview"][:"start_time(2i)"].to_i,params["interview"][:"start_time(3i)"].to_i,params["interview"][:"start_time(4i)"].to_i,params["interview"][:"start_time(5i)"].to_i,0)
		@end_time = DateTime.new(params["interview"][:"end_time(1i)"].to_i,params["interview"][:"end_time(2i)"].to_i,params["interview"][:"end_time(3i)"].to_i,params["interview"][:"end_time(4i)"].to_i,params["interview"][:"end_time(5i)"].to_i,0)
  
  
    @interview = Interview.create(start_time: @start_time,end_time: @end_time)
		participants = params["participants"].split(",")
		participants.each do |participant|
			InterviewParticipant.create(interview_id: @interview.id, participant_id: participant)
    end

		respond_to do |format|
      if @interview.save
        format.html { redirect_to @interview, notice: 'interview was successfully created.' }
        format.json { render :show, status: :created, location: @interview }
      else
        format.html { render :new }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
	end
end