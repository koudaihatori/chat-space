require 'rails_helper'

  describe CommentsController do
    let(:user){create(:user)}
    let(:group) { create(:group) }
    let(:comments) { create_list(:comment, 5, group_id: group.id)}
    before do
      login_user user
      # controller_macros.rb内のlogin_userメソッドを呼び出し
    end

    describe 'GET #index' do
      before do
        get :index, params: { group_id: group.id }
      end
      it "populates an array of comments" do
        expect(assigns(:comments)).to eq comments
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end
  end
