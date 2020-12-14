require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品登録ができるとき' do
      it '全ての項目が存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end

    context '出品登録ができないとき' do
      it '商品名がなければ登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors[:name]).to include('を入力してください')
      end

      it '商品画像が一枚も無ければ登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include('を入力してください')
      end

      it '商品の説明が無いと登録できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors[:description]).to include('を入力してください')
      end

      it 'カテゴリーの情報が無いと登録できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors[:category_id]).to include('を入力してください')
      end

      it '商品の状態について情報が無いと登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors[:condition_id]).to include('を入力してください')
      end

      it '配送料についての情報が無いと登録できないこと' do
        @item.postage_type_id = nil
        @item.valid?
        expect(@item.errors[:postage_type_id]).to include('を入力してください')
      end

      it '発送元の地域の情報がなければ登録できないこと' do
        @item.shipping_area_id = nil
        @item.valid?
        expect(@item.errors[:shipping_area_id]).to include('を入力してください')
      end

      it '発送までの日数についての情報がなければ登録できないこと' do
        @item.preparation_day_id = nil
        @item.valid?
        expect(@item.errors[:preparation_day_id]).to include('を入力してください')
      end

      it '価格の範囲が¥299以下だと登録できないこと' do
        @item.price = 1
        @item.valid?
        expect(@item.errors[:price]).to include('must be greater than or equal to 300')
      end

      it '価格の範囲が¥1000000以上だと登録できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors[:price]).to include
      end

      it '販売価格は半角数字のみでないと登録できないこと' do
        @item.price = '１'
        @item.valid?
        expect(@item.errors[:price]).to include('is not a number')
      end

      it 'カテゴリーが(---)の場合は登録できないこと' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors[:category_id]).to include('must be greater than or equal to 1')
      end

      it '商品の状態が(---)の場合は登録できないこと' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors[:condition_id]).to include('must be greater than or equal to 1')
      end

      it '配送料が(---)の場合は登録できないこと' do
        @item.postage_type_id = 0
        @item.valid?
        expect(@item.errors[:postage_type_id]).to include('must be greater than or equal to 1')
      end

      it '発送元が(---)の場合は登録できないこと' do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors[:shipping_area_id]).to include('must be greater than or equal to 1')
      end

      it '発送までの日数が(---)の場合は登録できないこと' do
        @item.preparation_day_id = 0
        @item.valid?
        expect(@item.errors[:preparation_day_id]).to include('must be greater than or equal to 1')
      end
    end
  end
end
