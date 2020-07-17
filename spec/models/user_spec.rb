require 'rails_helper'

describe User do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
       
    end

    it "nameが空では登録できないこと" do
      @user.name =""
      @user.valid?
      expect(user.errors.full_messages).to include("")
    end

    it "emailが空では登録できないこと" do
      @user.email =""
      @user.valid?
      expect(user.errors.full_messages).to include("")
    end

    it "passwordが空では登録できないこと" do
      @user.password =""
      @user.valid?
      expect(user.errors.full_messages).to include("")
    
    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation =""
      @user.valid?
      expect(user.errors.full_messages).to include("")
    
    end
    it "passwordが6文字以上であれば登録できること" do
      @user.password = "aaaaaa"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("")
    end
    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include()
    end
  end
end