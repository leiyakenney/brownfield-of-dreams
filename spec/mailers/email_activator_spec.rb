require "rails_helper"

RSpec.describe EmailActivatorMailer, type: :mailer do
  #pending "add some examples to (or delete) #{__FILE__}"
  let(:user) { create(:user) }
  let(:mail) { EmailActivatorMailer.notify(user).deliver }


   it "renders the subject" do
     expect(mail.subject).to eq("Brownfield Activation Email")
   end

   it "renders the receiver email" do
     expect(mail.to).to eq([user.email])
   end

   it "renders the sender email" do
     expect(mail.from).to eq(["no-reply@brownfield.io"])
   end
 end
