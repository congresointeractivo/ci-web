Rake::TaskManager.class_eval do
  def remove_task(task_name)
    @tasks.delete(task_name.to_s)
  end
end

Rake.application.remove_task 'db:test:prepare'

namespace :db do
  namespace :test do 
    task :prepare do |t|
      # rewrite the task to not do anything you don't want
    end
  end
end

namespace :db do
  namespace :test do
    # task :load => :environment do
    #   puts "Loading database:"
    #   File.open("data/monitor_ciudadano_dump.sql", "r") { |f|
    #     dump = f.read
    #     debugger
    #     sql_connection = ActiveRecord::Base.connection
    #     
    #     begin
    #       sql_connection.execute(dump)
    #     rescue Error => e
    #       debugger
    #       puts e.message
    #     end
    #   }
    #   
    #   puts "Loaded database"
    # end
  end
end
        