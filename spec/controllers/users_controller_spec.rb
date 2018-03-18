require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    before { @users = FactoryBot.create_list(:user, 2) }
    it "index" do
        get :index

        # ステータスコードのチェック
        expect(response).to have_http_status(200)

        # JSONの内容のチェック
        json = JSON.parse(response.body)
        expect(json.size).to     eq @users.count
        expect(json[0]["id"]).to eq @users[0].id
        expect(json[1]["id"]).to eq @users[1].id
    end
end
