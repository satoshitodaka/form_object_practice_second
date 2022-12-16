class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @signup_form = SignupForm.new
  end

  def create
    @signup_form = SignupForm.new(signup_params)

    if @signup_form.save
      redirect_to companies_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def signup_params
    params
      .require(:signup_form)
        .permit(company_attributes: %i[name address], user_attributes: %i[name email password password_confirmation])
  end
end
