class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ } # 全角（漢字・ひらがな・カタカナ）
  validates :first_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ } # 全角（漢字・ひらがな・カタカナ）
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } # カタカナのみ
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } # カタカナのみ
  validates :birth_date, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze # 半角混合英数字
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  has_many :items
  has_many :purchases
  has_many :comments
end
