desc "This task is called by the Heroku scheduler add-on"
task :update_listing => :environment do
  puts "Updating project listing..."
  # Move project listing code into a model
  # Call the model method here
  # Make sure it updates a db
  #NewsFeed.update
  projects = Kickstarter.by_list(:ending_soon, :pages => :all)
  projs = projects.select { |proj| proj.pledge_percent > 90.0 and proj.pledge_deadline.day == Time.now.day }
  puts "Got the projects!"
  Subscriber.all.each do |sub|
  	puts "#{sub.email}\t"
    if sub.last_email.nil? || sub.last_email.strftime("%F") < Time.now.strftime("%F")
      SubscriberMailer.daily_email(sub, projs).deliver
      sub.last_email = Time.now
      sub.save
      puts "#{sub.email}\tsent."  
    else
      puts "No email should be sent as it has already been sent for the day."
    end
	end
  puts "done."
end

task :send_daily_listing => :environment do
  #User.send_reminders
  puts "Sending daily project listing..."
  puts "done."
end