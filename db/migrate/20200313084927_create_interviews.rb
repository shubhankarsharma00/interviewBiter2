class CreateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews do |t|
      t.datetime :start_time
      t.datetime :end_time
    end
  end
end
