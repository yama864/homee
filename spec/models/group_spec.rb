require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @group = FactoryBot.build(:group)
    @user = FactoryBot.create(:user)
  end

  describe 'グループ作成機能' do
    context '内容に問題ない場合' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@group).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'Familyグループ名が無いと登録できない' do
        @group.group_name = ''
        @group.valid?
        expect(@group.errors.full_messages).to include('グループ名を入力してください')
      end
      it 'パスワードが無いと登録できない' do
        @group.password_digest = ''
        @group.valid?
        expect(@group.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'パスワードは、6文字以上での入力がないと登録できない' do
        @group.password = '00000'
        @group.password_confirmation = '00000'
        @group.valid?
        expect(@group.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @group.password_confirmation = ''
        @group.valid?
        expect(@group.errors.full_messages).to include('パスワード（確認）とパスワードの入力が一致しません')
      end
      it 'パスワードは、半角数字のみでは登録できない' do
        @group.password = '123456'
        @group.password_confirmation = '123456'
        @group.valid?
        expect(@group.errors.full_messages).to include('パスワードは英字と数字の両方を含めてください')
      end
      it 'パスワードは、半角英字のみでは登録できない' do
        @group.password = 'aaaaaa'
        @group.password_confirmation = 'aaaaaa'
        @group.valid?
        expect(@group.errors.full_messages).to include('パスワードは英字と数字の両方を含めてください')
      end
      it 'パスワードは、全角文字を含むと登録できない' do
        @group.password = 'aaaaaあ'
        @group.password_confirmation = 'aaaaaあ'
        @group.valid?
        expect(@group.errors.full_messages).to include('パスワードは英字と数字の両方を含めてください')
      end
    end
  end
end
