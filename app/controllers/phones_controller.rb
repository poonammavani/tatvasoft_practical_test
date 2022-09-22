class PhonesController < ApplicationController
  def index
    @phones = Phone.all
    render json: @phones
  end

  def create
    @created_phone = Phone.new
    @created_phone.assign_unique_phone_number
    @created_phone.save
    render json: @created_phone, status: 200
  end

  def fancy_number
    phone = params[:expected_number]
    valid_number = (111_111_1111..999_999_9999).include?(phone.to_i)
    exist_number = Phone.where(phone_number: phone)
    if exist_number.present? || !valid_number
      @created_phone = Phone.new
      @created_phone.assign_unique_phone_number
      @created_phone.save
    else
      @created_phone = Phone.create(phone_number: phone)
    end
    render json: @created_phone, status: 200
  end
end
