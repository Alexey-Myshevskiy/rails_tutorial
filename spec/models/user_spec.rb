require 'spec_helper'

describe User do

  before { @user = User.new(name: "Example User", email: "user@example.com", password:"passw123", password_confirmation:"passw123") }

  subject { @user }

  it { should respond_to(:name) }# отвечает ли модель на атрибут (принимает ли она его)
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should be_valid }

   describe "when name is not present" do
    before { @user.name = "Some Name" }
    it { should be_valid }
  end

    describe "when email is not present" do
    before { @user.email = "example@mail.com" }
    it { should be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 50 }
    it { should be_valid }
  end
  
  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
    it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

    it { should_not eq user_for_invalid_password }
    specify { expect(user_for_invalid_password).to be_false }
    end

    describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
    end
  end
    describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
end