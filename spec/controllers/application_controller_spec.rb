require 'rails_helper'

describe ApplicationController do
  before :each do
    @controller = ApplicationController.new
  end

  it "four_oh_four renders a Not Found page" do
    expect { @controller.four_oh_four }.to raise_error(ActionController::RoutingError)
  end
end
