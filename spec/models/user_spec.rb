require 'rails_helper'

describe User do
  describe '#create' do
    it '全ての項目の入力が存在すれば登録できること' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'nicknameがない場合は登録できないこと' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailがない場合は登録できないこと' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordがない場合は登録できないこと' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'encrypted_passwordがない場合は登録できないこと' do
      user = build(:user, encrypted_password: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Encrypted password can't be blank")
    end

    it 'last_nameがない場合は登録できないこと' do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_name_kanaがない場合は登録できないこと' do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_nameがない場合は登録できないこと' do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_name_kanaがない場合は登録できないこと' do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'birth_dayがない場合は登録できないこと' do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Birth day can't be blank")
    end

    it 'passwordが7文字以上であれば登録できること' do
      user = build(:user, password: '1234567', encrypted_password: '1234567')
      expect(user).to be_valid
    end

    it 'passwordが7文字以下であれば登録できないこと' do
      user = build(:user, password: '123456', encrypted_password: '123456')
      user.valid?
      expect(user.errors.full_messages).to include('Encrypted password is too short (minimum is 7 characters)')
    end

    it '重複したemailが存在する場合登録できないこと' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが存在してもencrypted_passwordがない場合は登録できないこと' do
      user = build(:user, encrypted_password: '')
      user.valid?
      expect(user.errors.full_messages).to include("Encrypted password can't be blank", 'Encrypted password is too short (minimum is 7 characters)')
    end

    it 'family_nameが全角入力でなければ登録できないこと' do
      user = build(:user, last_name: 'ｱｲｳｴｵ')
      user.valid?
      expect(user.errors.full_messages).to include('Last name is invalid')
    end

    it 'first_nameが全角入力でなければ登録できないこと' do
      user = build(:user, first_name: 'ｱｲｳｴｵ')
      user.valid?
      expect(user.errors.full_messages).to include('First name is invalid')
    end

    it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
      user = build(:user, last_name_kana: 'あいうえお')
      user.valid?
      expect(user.errors.full_messages).to include('Last name kana is invalid')
    end

    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      user = build(:user, first_name_kana: 'あいうえお')
      user.valid?
      expect(user.errors.full_messages).to include('First name kana is invalid')
    end
  end
end
