require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "#create" do
  
    before do
      # @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
    end
    
    context "商品登録ができるとき" do

      it "全ての項目が存在すれば登録できること" do
        expect(@item).to be_valid
      end

      it "商品画像があること" do
        expect(@item.image).to be_valid
      end

      it "カテゴリーの情報があること" do
        expect(@item.category).to be_valid
      end

      it "商品の状態についての情報があること" do
        expect(@item.condition).to be_valid
      end
      it "配送料についての情報があること" do
        expect(@item.postage_type).to be_valid
      end
      it "発送元の地域の情報があること" do
        expect(@item.shipping_area).to be_valid
      end
      it "発送までの日数について情報があること" do
        expect(@item.preparation_day).to be_valid
      end
      it "価格の範囲が¥300~¥9999999までの間なら登録できること" do
        @item = build(:item, price: "300")
        expect(@item).to be_valid
      end
    end

    context "出品登録ができないとき" do

      it "商品名がなければ登録できない" do
        @item = build(:item, name: nil)
        @item.valid?
        expect(@item.errors[:name]).to include("を入力してください")
      end
      
      it "商品画像が一枚も無ければ登録できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("を入力してください")
      end

      it "商品の説明が無いと登録できないこと" do
        @item = build(:item, description: nil)
        @item.valid?
        expect(@item.errors[:description]).to include("を入力してください")
      end

      it "カテゴリーの情報が無いと登録できないこと" do
        @item = build(:item, category_id: nil)
        @item.valid?
        expect(@item.errors[:category_id]).to include("を入力してください")
      end

      it "商品の状態について情報が無いと登録できない" do
        @item = build(:item, condition_id: nil)
        @item.valid?
        expect(@item.errors[:condition_id]).to include("を入力してください")
      end

      it "配送料についての情報が無いと登録できないこと" do
        @item = build(:item, postage_type_id: nil)
        @item.valid?
        expect(@item.errors[:postage_type_id]).to include("を入力してください")
      end

      it "発送元の地域の情報がなければ登録できないこと" do
        @item = build(:item, shipping_area_id: nil)
        @item.valid?
        expect(@item.errors[:shipping_area_id]).to include("を入力してください")
      end

      it "発送までの日数についての情報がなければ登録できないこと" do
        @item = build(:item, preparation_day_id: nil)
        @item.valid?
        expect(@item.errors[:preparation_day_id]).to include("を入力してください")
      end
      
      it "価格の範囲が¥300~¥9999999の間でないと登録できないこと" do
        @item = build(:item, price: '1')
        @item.valid?
        expect(@item.errors[:price]).to include("must be greater than or equal to 300")
      end

      it "販売価格は半角数字のみでないと登録できないこと" do
        @item = build(:item, price: '１２３４５')
        @item.valid?
        expect(@item.errors[:price]).to include("is not a number")
      end
      
    end
     
  end
end
