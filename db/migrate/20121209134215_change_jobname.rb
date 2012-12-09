class ChangeJobname < ActiveRecord::Migration
  def change
  	rename_column :jobs, :jobname, :job_name
  end

end
