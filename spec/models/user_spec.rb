require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できるとき' do
      it 'nickname, email, passwordが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上なら登録できる' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'profileが空であっても登録できる' do
        @user.profile = ''
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録できないとき' do
      it 'nicknameが空のとき登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空のとき登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'email.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複したemailが存在するとき登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空のとき登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下のとき登録できない' do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'profileが100文字以上のとき登録できない' do
        @user.profile = 'a' * 101
        @user.valid?
        expect(@user.errors.full_messages).to include("Profile is too long (maximum is 100 characters)")
      end
    end
  end
end
