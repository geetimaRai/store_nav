Feature: Signing in

	Given /ˆa user visits the signin page$/ {
			visit 'signin_path'
		}
		When /ˆhe submits invalid signin information$/ {
			click_button "Sign in"
		}

		Then /ˆhe should see an error message$/ {
			page.should have_selector('div.alert.alert-error')
		}
	Given /ˆthe user has an account$/ {
     	 @user = User.new(:name => "Example User", :email => "user@example.com", :password => "foobar", :password_confirmation => "foobar")
     	 @user.save
	}
	When /ˆthe user submits valid signin information$/ {
			fill_in "Email", with: @user.email
			fill_in "Password", with: @user.password
			click_button "Sign in"
		}

		Then /ˆhe should see his profile page$/ {
			page.should have_selector('title', text: @user.name)
		}

		Then /ˆhe should see a signout link$/ {
			page.should have_link('Sign out', href: signout_path)
		}

