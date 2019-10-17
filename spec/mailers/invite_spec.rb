require "rails_helper"

RSpec.describe InviteMailer, type: :mailer do
  let(:user) { create(:user) }
  let(:mail) { InviteMailer.invite(user.id, user.email, user.first_name).deliver }


   it "renders the subject" do
     expect(mail.subject).to eq("Your friend has invited you to join Brownfield of Dreams!")
   end

   it "renders the receiver email" do
     expect(mail.to).to eq([user.email])
   end

   it "renders the sender email" do
     expect(mail.from).to eq(["no-reply@brownfield.io"])
   end
end
