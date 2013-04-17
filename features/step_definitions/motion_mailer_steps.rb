Given /^there is a group and a discussion$/ do
  @group = FactoryGirl.create :group
  @discussion = FactoryGirl.create :discussion, :group => @group
end

When /^I create a motion$/ do
  @motion = FactoryGirl.create :motion, :discussion => @discussion
end

Then /^group users should recieve an email$/ do
  last_email = ActionMailer::Base.deliveries.last
  # raise last_email.body.inspect
  last_email.subject.should =~ /New proposal/
  last_email.body.should =~ /Body/
end

When /^I send a dumb ass mailer$/ do
  UserMailer.dumb_email.deliver
end

Then /^a dumb ass email should be sent$/ do
  last_email = ActionMailer::Base.deliveries.last
  last_email.subject.should =~ /Dumb email/
  last_email.body.should =~ /Body/
end
