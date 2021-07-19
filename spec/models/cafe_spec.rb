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
        @cafe.purpose_id = 3
        expect(@cafe).to be_valid
      end
      it 'prefecture_idが2~48のとき登録できる' do
        @cafe.prefecture_id = 20
        expect(@cafe).to be_valid
      end
    end
    context 'カフェが新規登録できないとき' do
      it 'imageが空のとき登録できない' do
        @cafe.image = nil
        @cafe.valid?
        expect(@cafe.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空のとき登録できない' do
        @cafe.name = ''
        @cafe.valid?
        expect(@cafe.errors.full_messages).to include("Name can't be blank")
      end
      it 'addressが空のとき登録できない' do
        @cafe.address = ''
        @cafe.valid?
        expect(@cafe.errors.full_messages).to include("Address can't be blank")
      end
      it 'purpose_idが1のとき登録できない' do
        @cafe.purpose_id = 1
        @cafe.valid?
        expect(@cafe.errors.full_messages).to include("Purpose can't be blank")
      end
      it 'prefecture_idが1のとき登録できない' do
        @cafe.prefecture_id = 1
        @cafe.valid?
        expect(@cafe.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'recommendが空のとき登録できない' do
        @cafe.recommend = ''
        @cafe.valid?
        expect(@cafe.errors.full_messages).to include("Recommend can't be blank")
      end
      it 'recommendが100文字以上のとき登録できない' do
        @cafe.recommend = 'a' * 101
        @cafe.valid?
        expect(@cafe.errors.full_messages).to include('Recommend is too long (maximum is 100 characters)')
      end
    end
  end
end
