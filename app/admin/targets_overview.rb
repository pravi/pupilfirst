ActiveAdmin.register_page 'Targets Overview' do
  controller do
    skip_after_action :intercom_rails_auto_include

    def index
      load_targets
    end

    private

    def load_targets
      batch = params[:batch].present? ? Batch.find_by(id: params[:batch]) : Batch.last
      @targets = batch.program_weeks.order(:number).map do |week|
        week.target_groups.map(&:targets).flatten
      end
    end
  end

  menu parent: 'Targets'

  content do
    render 'targets_overview'
  end

  # Route to respond to AJAX request for target stats.
  page_action :target_stats do
    target = Target.find(params[:target_id])
    render json: target.stats_service.counts
  end

  page_action :target_stat_details do
    target = Target.find(params[:target_id])
    assignees = target.stats_service.public_send("#{params[:type]}_assignees")

    render json: assignees
  end
end
