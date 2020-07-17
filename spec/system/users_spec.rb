require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do
  it 'ログインしていない場合、サインページに移動する' do
    # トップページに遷移する
     visit root_path
    # ログインしていない場合、サインインページに遷移することを期待する
    expect(current_path).to eq new_user_session_path
  end

  it 'ログインに成功し、ルートパスに遷移する' do
    # 予め、ユーザーをDBに保存する
      user = User.new
      user.save
    # サインインページへ移動する
      visit new_user_session_path
    # ログインしていない場合、サインインページに遷移することを期待する
      expect(current_path).to eq new_user_session_path
    # すでに保存されているユーザーのnameとemailを入力する
      fill_in "name", with: user.name
      fill_in "email,", with: user.email
    # ログインボタンをクリックする
      find("input[name="commit"]"),click
    # ルートページに遷移することを期待する
      expect(current_path).to eq root_path
  end
  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する

    # サインインページへ移動する

    # 誤ったユーザー情報を入力する

    # ログインボタンをクリックする

    # サインインページに遷移していることを期待する

  end
end