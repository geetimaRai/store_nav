require 'spec helper'

describe "Authentication" do
	subject { page }

describe "signin" do
before { visit signin_path }

describe "with invalid information" do
let(:user) { FactoryGirl.create(:user) }
before { sign in user }
it { should have selector('title', text: user.name) }
it { should have link('Profile', href: user path(user)) }
it { should have link('Settings', href: edit user path(user)) }
it { should have link('Sign out', href: signout path) }
it { should not have link('Sign in', href: signin path) }

describe "followed by signout" do
before { click link "Sign out" }
it { should have link('Sign in') }


describe "after visiting another page" do
before { click_link "Home" }
it { should_not have_selector('div.alert.alert-error') }
end
end
end
end

describe "authorization" do
describe "for non-signed-in users" do
let(:user) { FactoryGirl.create(:user) }
describe "in the Users controller" do
describe "visiting the edit page" do
before { visit edit user path(user) }
it { should have selector('title', text: 'Sign in') }
end
describe "submitting to the update action" do
before { put user path(user) }
specify { response.should redirect to(signin path) }
end
end
end
end
end