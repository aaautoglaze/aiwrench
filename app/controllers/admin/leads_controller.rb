module Admin
  class LeadsController < BaseController
    def index
      @leads = Lead.ordered
      @leads = @leads.by_status(params[:status]) if params[:status].present?
    end

    def update
      @lead = Lead.find(params[:id])
      if @lead.update(lead_params)
        redirect_to admin_leads_path(status: params[:filter_status]), notice: "Lead updated."
      else
        redirect_to admin_leads_path, alert: "Update failed."
      end
    end

    def destroy
      Lead.find(params[:id]).destroy
      redirect_to admin_leads_path, notice: "Lead deleted."
    end

    def bulk_destroy
      Lead.where(id: params[:lead_ids]).destroy_all
      redirect_to admin_leads_path, notice: "#{params[:lead_ids]&.count || 0} leads deleted."
    end

    private

    def lead_params
      params.require(:lead).permit(:status)
    end
  end
end
