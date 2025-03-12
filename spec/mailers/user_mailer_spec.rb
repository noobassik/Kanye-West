require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "UserMailer" do
    before(:all) do
      @user = User.new
      @user.email = 'lucas@email.com'
      @user.generate_password if @user.encrypted_password.blank?
    end

    let(:mail) { UserMailer.send_new_user_message(@user) }

    it "renders the headers locale ru" do
      I18n.locale = :ru
      expect(mail.subject).to eq("Добро пожаловать в Propimo")
      expect(mail.to).to eq(["lucas@email.com"])
      expect(mail.from).to eq(["no.reply@propimo.com"])
    end

    it "renders the headers locale en" do
      I18n.locale = :en
      expect(mail.subject).to eq("Welcome to propimo")
      expect(mail.to).to eq(["lucas@email.com"])
      expect(mail.from).to eq(["no.reply@propimo.com"])
    end
  end
end
