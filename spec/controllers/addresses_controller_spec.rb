require 'rails_helper'

# describe AddressesController, type: :controller do
#   before do
#     @user = create(:user)
#     @address = create(:address)
#     login_user(@user)
#   end

#   describe 'GET #new' do

#     it "newアクションのビューが描画されるかどうか" do
#       get :new, params: { user_id: @address.user_id }
#       expect(response).to render_template :new
#     end

#     it "リクエストが成功するかどうか" do
#       get :new, params: { user_id: @address.user_id }
#       expect(response.status).to eq 200
#     end

#     it "@addressが生成されているかどうか" do
#       get :new, params: { user_id: @address.user_id }
#       expect(assigns :address).to_not be_nil
#     end
#   end

#   describe 'POST #create' do

#     context 'パラメーターが適切な場合' do
#       it "リクエストが成功するかどうか" do
#         post :create, params: { user_id: @address.user_id, address: FactoryBot.attributes_for(:address) }
#         expect(response.status).to eq 302
#       end

#       it "住所登録が適切に行われるかどうか" do
#         expect do
#           post :create, params: { user_id: @address.user_id, address: FactoryBot.attributes_for(:address) }
#         end.to change(Address, :count).by(1)
#       end

#       it "リダイレクトが成功するかどうか" do
#         post :create, params: { user_id: @address.user_id, address: FactoryBot.attributes_for(:address) }
#         expect(response).to redirect_to new_payment_path(session[:user_id])
#       end
#     end

#     context 'パラメーターが不適切な場合' do
#       it "リクエストが成功するかどうか" do
#         get :create, params: { user_id: @address.user_id, address: FactoryBot.attributes_for(:address, :invalid) }
#         expect(response.status).to eq 302
#       end

#       it "住所登録が失敗するかどうか" do
#         expect do
#           post :create, params: { user_id: @address.user_id, address: FactoryBot.attributes_for(:address, :invalid) }
#         end.to change(Address, :count).by(0)
#       end

#       it "newテンプレートが表示されるかどうか" do
#         post :create, params: { user_id: @address.user_id, address: FactoryBot.attributes_for(:address, :invalid) }
#         expect(response).to redirect_to new_address_path
#       end

#       it "エラーが表示されるかどうか" do
#         post :create, params: { user_id: @address.user_id, address: FactoryBot.attributes_for(:address, :invalid) }
#         expect(assigns(:address).errors.any?).to be_truthy
#       end
#     end
#   end
# end
