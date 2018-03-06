require 'rails_helper'

RSpec.describe User, type: :model do

  before do 
    @user = User.create!({
      first_name: 'Shrek',
      last_name: 'Is Life',
      email: 'shrek@shrek.shrek',
      password: 'no_diggity',
      password_confirmation: 'no_diggity'
    })
  end

  describe 'validations' do
    context 'on a new user' do
      it 'should be invalid if the password field is empty' do
        @user.password = nil
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Password can\'t be blank')
      end

      it 'should be valid if the password field is not empty' do
        expect(@user).to be_valid
        # expect(@user.errors.full_messages).to include('Password can\'t be blank')
      end

      it 'should be invalid if the first name field is empty' do
        @user.first_name = nil
        expect(@user).to_not be_valid
        # expect(@user.errors.full_messages).to include('Password can\'t be blank')
      end

      it 'should be invalid if the last name field is empty' do
        @user.last_name = nil
        expect(@user).to_not be_valid
        # expect(@user.errors.full_messages).to include('Password can\'t be blank')
      end
    end

    context 'general cases' do
      it 'should be invalid if the password length is less than 6 chars but password confirmation still matches' do
        @user.password = '1234'
        @user.password_confirmation = '1234'
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'should be invalid if the password confirmation doesn\'t match' do
        @user.password = '123456'
        @user.password_confirmation = 'lit'
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Password confirmation doesn\'t match Password')
      end

      it 'should be invalid if the email is blank' do
        @user.email = nil
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Email can\'t be blank')
      end

      it 'should be invalid if the user exists in the database (same letter case)' do
        @user_duplicate_email = User.new({
          first_name: 'Shrek',
          last_name: 'Is Life',
          email: 'shrek@shrek.shrek',
          password: 'no_diggity',
          password_confirmation: 'no_diggity'
        })
        expect(@user_duplicate_email).to_not be_valid
        expect(@user_duplicate_email.errors.full_messages).to include('Email has already been taken')
      end
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should be not nil if a user exists with the email' do
      @auth_user = User.authenticate_with_credentials('shrek@shrek.shrek', 'no_diggity')
      expect(@auth_user).to_not be_nil
    end

    it 'should be not nil if there is whitespace and user exists' do
      @auth_user = User.authenticate_with_credentials('   shrek@shrek.shrek  ', 'no_diggity')
      expect(@auth_user).to_not be_nil
    end


    it 'should be not nil if the case is in lower or upper and user exists' do
      @auth_user = User.authenticate_with_credentials('   sHreK@sHrEk.SHrek  ', 'no_diggity')
      expect(@auth_user).to_not be_nil
    end
  end
end
