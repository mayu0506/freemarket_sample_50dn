require 'rails_helper'
describe ProductsController do
  before :each do
    @user = create(:user)
    @product = create(:product)
  end
  describe 'GET #index' do
    let!(:products){ create_list(:product, 3) }
    before do
      get :index
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "renders the :show template" do
      get :show, params: { id: @product }
      expect(response).to render_template :show
    end
  end

  describe 'get #change' do
    it "change" do
      get :change, params: {id: @product}
      expect(response).to render_template :change
    end
  end

  describe 'delete #destroy' do
    it 'データベースから要求されたユーザーが削除されること' do
      login_user(@user)
      expect{
        delete :destroy, params:{id: @product}
      }.to change(Product,:count).by(-1)
    end
    it 'users#listにリダイレクトされること'do
        login_user(@user)
        delete :destroy, params:{id: @product}
        expect(response).to redirect_to list_user_path(@user)
      end
  end
end
