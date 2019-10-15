require 'rails_helper'

describe 'A Non-Registered User' do
  it "sees an activation message in their email that directs them to a confirmation page" do
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
