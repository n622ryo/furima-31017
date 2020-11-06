require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)  # Userのインスタンス生成
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "nicknameとemail、passwordとpassword_confirmation、first_name、last_name、first_name_reading、last_name_reading、birthdayが存在すれば登録できる" do
      expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "a11111"
        @user.password_confirmation = "a11111"
        expect(@user).to be_valid
      end
      it "passwordが半角英数字であれば登録できる" do
        @user.password = "a11111"
        @user.password_confirmation = "a11111"
        expect(@user).to be_valid
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.first_name = "阿部"
        expect(@user).to be_valid
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.last_name = "直樹"
        expect(@user).to be_valid
      end
      it "first_name_readingが全角（カタカナ）であれば登録できる" do
        @user.first_name_reading = "アベ"
        expect(@user).to be_valid
      end
      it "last_name_readingが全角（カタカナ）であれば登録できる" do
        @user.last_name_reading = "ナオキ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
       @user.nickname = ""  # nicknameの値を空にする
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
       @user.email = ""  # emailの値を空にする
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
       @user.password = ""  # passwordの値を空にする
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "a1111"
        @user.password_confirmation = "a1111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが英語のみであれば登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが数字のみであれば登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが全角英数字であれば登録できない" do
        @user.password = "ａ１１１１１"
        @user.password_confirmation = "ａ１１１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "first_nameが空では登録できない" do
       @user.first_name = ""  # first_nameの値を空にする
       @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）以外は登録できない" do
        @user.first_name = "a1A123"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameが空では登録できない" do
       @user.last_name = ""  # last_nameの値を空にする
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）以外は登録できない" do
        @user.last_name = "a1A123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_name_readingが空では登録できない" do
       @user.first_name_reading = ""  # first_name_readingの値を空にする
       @user.valid?
       expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it "first_name_readingが全角（漢字・ひらがな・カタカナ）以外は登録できない" do
        @user.first_name_reading = "a1A123"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid")
      end
      it "last_name_readingが空では登録できない" do
       @user.last_name_reading = ""  # last_name_readingの値を空にする
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end
      it "last_name_readingが全角（漢字・ひらがな・カタカナ）以外は登録できない" do
        @user.last_name_reading = "a1A123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading is invalid")
      end
      it "birthdayが空では登録できない" do
       @user.birthday = ""  # birthdayの値を空にする
       @user.valid?
       expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end