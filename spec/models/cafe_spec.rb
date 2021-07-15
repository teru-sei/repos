require 'rails_helper'

RSpec.describe Cafe, type: :model do
  before do
    @cafe = FactoryBot.build(:cafe)
  end

  describe 'カフェ新規登録' do
    context 'カフェ新規登録ができるとき' do
      it 'image,name,address,purpose_id,prefecture_id,recommendが存在するとき登録できる' do
        expect(@cafe).to be_valid
      end
      it 'purpose_idが2~4のとき登録できる' do
        
      end
      it 'prefecture_idが2~48のとき登録できる' do
        
      end
    end
    context 'カフェが新規登録できないとき' do
      it 'imageが空のとき登録できない' do

      end
      it 'nameが空のとき登録できない' do
        
      end
      it 'addressが空のとき登録できない' do
        
      end
      it 'purpose_idが1のとき登録できない' do
        
      end
      it 'prefecture_idが1のとき登録できない' do
        
      end
      it 'recommendが空のとき登録できない' do
        
      end
      it 'recommendが100文字以上のとき登録できない' do
        
      end
    end
  end
end
