class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
    	t.string :title
    	t.string :note
    	t.date :due_date
    	t.boolean :open_close_flag
      	t.timestamps
    end
  end
end