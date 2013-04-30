Given /^I am not in any of the same groups as the duscussion author$/ do

end

# When /^I click on the discussion author$/ do
#   find(".user-name").click()
# end

# Then /^I should see the user profile page$/ do
#   page.should have_css(".users.show")
# end

# Then /^I should see the users email$/ do
#
# end

Given /^I am in one of the same groups as another user$/ do
  @other_user = FactoryGirl.create(:user)
  @group = FactoryGirl.create(:group)
  @group.add_member!(@other_user)
  @group.add_member!(@user)
end

Given /^I am not in any of the same groups as the other user$/ do
  @other_user = FactoryGirl.create(:user)
  @group = FactoryGirl.create(:group)
  @group.add_member!(@user)
end

When /^I visit the other user's profile page$/ do
  visit(user_path(@other_user))
end

Then /^I should see the other user's profile information$/ do
  page.should have_css(".users.show")
  page.should have_content(@other_user.email)
end

Then /^I should not see the other user's profile information$/ do
  page.should_not have_css(".users.show")
  page.should_not have_content(@other_user.email)
end

Then /^I should be redirected to root$/ do
  page.should_not have_css(".users.show")
  page.should =~ /You must be member of the group to view this. If you are a member, please sign in./
end
