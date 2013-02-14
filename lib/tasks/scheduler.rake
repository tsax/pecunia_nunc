desc "This task is called by the Heroku scheduler add-on"
task :update_listing => :environment do
  puts "Updating project listing..."
  # Move project listing code into a model
  # Call the model method here
  # Make sure it updates a db
  #NewsFeed.update
  puts "done."
end

task :send_daily_listing => :environment do
  #User.send_reminders
  puts "Sending daily project listing..."
  puts "done."
end