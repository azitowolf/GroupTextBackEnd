class OpenReadController < ApiController
  skip_before_action :authenticate, if: :read_action?

  private

  def read_action?
    action = action_name.to_sym
    action == :show || action == :index || action == :getVote
  end
end
