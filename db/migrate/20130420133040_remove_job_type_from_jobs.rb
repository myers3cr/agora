class RemoveJobTypeFromJobs < ActiveRecord::Migration
  def up
    remove_column :jobs, :job_type
  end

  def down
    add_column :jobs, :job_type, :string
  end
end
