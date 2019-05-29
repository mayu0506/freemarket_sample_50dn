require 'rails_helper'

describe Address do
  describe '#create' do
    # postcode,prefecture_code,city,streetとuser_idが存在すれば登録できること
    it "is valid a postcode, prefecture_code, city, street, user_id" do
      user = FactoryBot.create(:user)
      expect(build(:address)).to be_valid
    end

    # postcodeが空では登録できないこと
    it "is invalid without a postcode" do
      address = build(:address, postcode: nil)
      address.valid?
      expect(address.errors[:postcode]).to include("を入力してください")
    end

    # prefecture_codeが空では登録できないこと
    it "is invalid without a prefecture_code" do
      address = build(:address, prefecture_code: nil)
      address.valid?
      expect(address.errors[:prefecture_code]).to include("を入力してください")
    end

    # cityが空では登録できないこと
    it "is invalid without a city" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end 

    # streetが空では登録できないこと
    it "is invalid without a street" do
      address = build(:address, street: nil)
      address.valid?
      expect(address.errors[:street]).to include("を入力してください")
    end 
  end
end
