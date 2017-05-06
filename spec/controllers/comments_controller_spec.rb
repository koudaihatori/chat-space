require 'rails_helper'


  describe CommentsController do
    let(:user){ create(:user) }
    let(:group) { create(:group) }
    let(:comment) { create(:comment) }
    let(:comments) { create_list(:comment, 5, group_id: group.id)}
    before do
      user = create(:user)
      login_user user
      # controller_macros.rb内のlogin_userメソッドを呼び出し
    end

    describe 'GET #index' do
      before do
        get :index, params: { group_id: group.id }
      end
      it "populates an array of comments" do
        # binding.pry
        expect(assigns(:comment)).to be_an_instance_of Comment
      end
      it "populates an array of group" do
        expect(assigns(:group)).to be_an_instance_of Group
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end

    describe 'POST #create' do
      it "redirect to comments#index" do
        post :create, params: { group_id: group.id, comment: attributes_for(:comment)}
        expect(response).to redirect_to group_comments_path
      end
    it "can save comment" do
      expect {
        post :create, params: { group_id: group.id, comment: attributes_for(:comment) }
      }.to change(Comment, :count).by(1)
    end
    end
  end
