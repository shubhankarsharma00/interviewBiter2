# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# @participant1 = Participant.find(1)
# @participant2 = Participant.find(2)
# @interview = Interview.find(1)

@participant1 = Participant.create(name: "p1")
@participant2 = Participant.create(name: "p2")
@interview = Interview.create(:start_time  => DateTime.new(2009,9,1,17), :end_time    => DateTime.new(2009,9,1,19))
@interview_participant = InterviewParticipant.create(interview_id: @interview.id,participant_id: @participant1.id)
@interview_participant = InterviewParticipant.create(interview_id: @interview.id,participant_id: @participant2.id)