require 'rails_helper'

describe 'A Non-Registered User' do
  it "sees an activation message in their email that directs them to a confirmation page" do
    email = 'jimbob@aol.com'
    first_name = 'Jim'
    last_name = 'Bob'
    password = 'password'
    password_confirmation = 'password'

    visit '/'

    click_on 'Sign In'

    expect(current_path).to eq(login_path)

    click_on 'Sign up now.'

    expect(current_path).to eq(new_user_path)

    fill_in 'user[email]', with: email
    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on'Create Account'

    


    # As a non-activated user
    # When I check my email for the registration email
    # I should see a message that says "Visit here to activate your account."
    # And when I click on that link
    # Then I should be taken to a page that says "Thank you! Your account is now activated."
    # expect(current_path).to eq(activation_path)

  end

  it "sees 'Status: Active' on their dashboard" do
    # And when I visit "/dashboard"
    # Then I should see "Status: Active"

  end
end
