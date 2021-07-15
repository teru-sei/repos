require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できるとき' do
      it 'nickname, email, passwordが存在すれば登録できる' do

      end
      it 'passwordが6文字以上なら登録できる' do

      end
      it 'profileが空であっても登録できる' do
        
      end
    end
    context 'ユーザー登録できないとき' do
      it 'nicknameが空では登録できない' do

      end
      it 'emailが空では登録できない' do
        
      end
      it 'emailに@が含まれていないと登録できない' do
        
      end
      it '重複したemailが存在するとき登録できない' do
        
      end
      it 'passwordが空では登録できない' do
        
      end
      it 'passwordが5文字以下なら登録できない' do
        
      end
      it 'profileが100文字以上だと登録できない' do
        
      end
    end
  end
end
