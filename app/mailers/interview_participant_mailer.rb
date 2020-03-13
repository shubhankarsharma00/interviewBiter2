class InterviewParticipantMailer < ApplicationMailer
    def welcome_email(interview_participant)
        @interview_participant = interview_participant
        @participant = Participant.find(@interview_participant.participant_id)
        @interview = Interview.find(@interview_participant.interview_id)
        @start_time = @interview.start_time 
        @end_time = @interview.end_time 
        mail(to: @participant.email, subject: 'Interview')
    end
end
