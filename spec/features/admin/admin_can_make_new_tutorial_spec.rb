require 'rails_helper'

describe "As an admin" do
  before :each do
    @admin = create(:admin)
    @title = "Test Title"
    @description = "This is a description"
    @thumbnail = "https://i.ytimg.com/vi/qMkRHW9zE1c/hqdefault.jpg"

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    visit new_admin_tutorial_path
  end

  it "can create a new tutorial" do
    fill_in "Title", with: @title
    fill_in "Description", with: @description
    fill_in "Thumbnail", with: @thumbnail

    click_on "Save"

    new_tutorial = Tutorial.last

    expect(current_path).to eq("/tutorials/#{new_tutorial.id}")
    expect(page).to have_content(@title)
    expect(page).to have_content("Successfully created tutorial.")
  end

  it "errors out if form is not filled in properly" do
    fill_in "Title", with: ""
    fill_in "Description", with: ""
    fill_in "Thumbnail", with: ""

    click_on 'Save'

    expect(current_path).to eq('/admin/tutorials')
    expect(page).to have_content("Title can't be blank, Description can't be blank, and Thumbnail is invalid")

    fill_in "Title", with: @Title
    fill_in "Description", with: @description
    fill_in "Thumbnail", with: "asdl;kfj"

    click_on 'Save'

   expect(current_path).to eq('/admin/tutorials')
   expect(page).to have_content("Thumbnail is invalid")
  end
end
