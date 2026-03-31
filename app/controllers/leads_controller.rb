class LeadsController < ApplicationController
  def create
    # Honeypot check
    if params[:website].present?
      redirect_to root_path, notice: "Thank you! We'll be in touch within 1 business day."
      return
    end

    @lead = Lead.new(lead_params)

    # Skip hCaptcha in dev if keys not set
    captcha_ok = if ENV["HCAPTCHA_SITE_KEY"].present?
      verify_hcaptcha(model: @lead)
    else
      true
    end

    unless captcha_ok
      flash.now[:alert] = "Please complete the captcha."
      render "pages/home", status: :unprocessable_entity
      return
    end

    if @lead.save
      redirect_to root_path, notice: "Thank you! We'll be in touch within 1 business day."
    else
      flash.now[:alert] = @lead.errors.full_messages.join(", ")
      render "pages/home", status: :unprocessable_entity
    end
  end

  private

  def lead_params
    params.require(:lead).permit(:name, :company, :email, :phone, :industry, :service_interest, :message)
  end
end
