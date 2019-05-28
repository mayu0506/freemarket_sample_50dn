require 'rails_helper'

describe Product do
  describe '#create' do
    context 'can save' do
      # が存在すれば登録できること
      it "is valid a postcode, prefecture_code, city, street, user_id" do
        user = create(:user)
        product = create(:product)
        expect(build(:product)).to be_valid
      end
      it "" do
        user = create(:user)
        product = create(:product, size: nil, buyer_id: nil)
        expect(build(:product)).to be_valid
      end
    end

    context 'can not save' do
      # nameが空では登録できない
      it "is invalid without name" do
        user = create(:user)
        product = build(:product, name: nil)
        product.valid?
        expect(product.errors[:name]).to include()
      end
      # descriptionが空では登録できない
      it "is invalid without description" do
        user = create(:user)
        product = build(:product, description: nil)
        product.valid?
        expect(product.errors[:description]).to include()
      end
      # priceが空では登録できない
      it "is invalid without price" do
        user = create(:user)
        product = build(:product, price: nil)
        product.valid?
        expect(product.errors[:price]).to include()
      end
      # statusが空では登録できない
      it "is invalid without a status" do
        user = create(:user)
        product = build(:product, status: nil)
        product.valid?
        expect(product.errors[:status]).to include()
      end
      # who_to_payが空では登録できない
      it "is invalid without who_to_pay" do
        user = create(:user)
        product = build(:product, who_to_pay: nil)
        product.valid?
        expect(product.errors[:who_to_pay]).to include()
      end
      # origin_of_deliveryが空では登録できない
      it "is invalid without origin_of_delivery" do
        user = create(:user)
        product = build(:product, origin_of_delivery: nil)
        product.valid?
        expect(product.errors[:origin_of_delivery]).to include()
      end
      # deliverying_dateが空では登録できない
      it "is invalid without deliverying_date" do
        user = create(:user)
        product = build(:product, deliverying_date: nil)
        product.valid?
        expect(product.errors[:deliverying_date]).to include()
      end
      # user_idが空では登録できない
      it "is invalid without user_id" do
        user = create(:user)
        product = build(:product, user_id: nil)
        product.valid?
        expect(product.errors[:user_id]).to include()
      end

      # 商品出品カテゴリーが出来次第チェック
      # # category_idが空では登録できない
      # it "is invalid without category_id" do
      #   user = create(:user)
      #   product = build(:product, category_id: nil)
      #   product.valid?
      #   expect(product.errors[:category_id]).to include()
      # end
    end
  end
end
