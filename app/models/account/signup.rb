module Account
  class Signup
    include ActiveModel::Model

    attr_reader :user, :bankcard
    attr_accessor :fullname,
      :email,
      :phone,
      :card_name,
      :card_number,
      :card_expires_on

    validates :fullname,
      :email,
      :card_name,
      :card_number,
      :card_expires_on,
      presence: true

    def persist!
      return false unless valid?

      begin
        ActiveRecord::Base.transaction do
          save_user
          save_bank_card
          true
        end
      rescue
        errors.add(:base, 'Problem signing up, please try again.')
        false
      end
    end

    private

    def save_user
      @user = User.new(
        fullname: fullname,
        email: email,
        phone: phone
      )
      @user.save!
    end

    def save_bank_card
      @bankcard = Bankcard.new(
        name: card_name,
        number: card_number,
        expires_on: card_expires_on,
        user: user
      )
      @bankcard.save!
    end
  end
end
