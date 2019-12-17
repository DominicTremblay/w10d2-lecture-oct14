class CarsController < ApplicationController
  def index
    @cars = Car.order(created_at: :desc)

    @cars = Car.where(make: params[:make]) if params[:make].present?
    @cars = Car.where(model: params[:model]) if params[:model].present?
    @cars = Car.where(style: params[:style]) if params[:style].present?
    @cars = Car.where(trim: params[:trim]) if params[:trim].present?
    @cars = Car.where(year: params[:year]) if params[:year].present?

  end
end
