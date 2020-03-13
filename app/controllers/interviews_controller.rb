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
    @success = 1
		@start_time = DateTime.new(params["interview"][:"start_time(1i)"].to_i,params["interview"][:"start_time(2i)"].to_i,params["interview"][:"start_time(3i)"].to_i,params["interview"][:"start_time(4i)"].to_i,params["interview"][:"start_time(5i)"].to_i,0)
		@end_time = DateTime.new(params["interview"][:"end_time(1i)"].to_i,params["interview"][:"end_time(2i)"].to_i,params["interview"][:"end_time(3i)"].to_i,params["interview"][:"end_time(4i)"].to_i,params["interview"][:"end_time(5i)"].to_i,0)
  
  
    @interview = Interview.create(start_time: @start_time,end_time: @end_time)
		participants = params["participants"].split(",")
    participant_interviews = []
    participant_interview_times = []
    participants.each do |participant|
      participant_interviews+=(InterviewParticipant.where(participant_id: participant))
    end  
    participant_interviews.each do |participant_interview|
      puts(participant_interview.interview_id)
      participant_interview_en = Interview.find(participant_interview.interview_id)
      participant_interview_times.push([participant_interview_en.start_time,participant_interview_en.end_time])
    end
    
    puts participant_interview_times.map { |x| x.join(' ') }
    
    participant_interview_times.each do |x|
      if x[1]<@end_time
      elsif x[0]>@start_time and x[0]>@end_time
      else
        flash[:danger] = "error clash of timings"
        puts("error")
        @success = 0
      end
    end
    
    
    if participants.length() < 2
      flash[:danger] = "more participants"
      puts ("yes")
      @success = 0
    end
    
    if @success == 1
      participants.each do |participant|
        interview_participants = InterviewParticipant.create(interview_id: @interview.id, participant_id: participant)
        # InterviewParticipantMailer.welcome_email(interview_participants).deliver_now
      end
      puts(@success)
      redirect_to interview_url(@interview.id)
    else
      redirect_to new_interview_url()
    end
	end
end