class FixedCostsController < ApplicationController
  def index
    @fixed_costs = FixedCost.all
  end

  def new
    @group = Group.find(current_user.group_id)
    @fixed_cost = FixedCost.new
  end

  def create
    @fixed_cost = FixedCost.new(fixed_cost_params)
    @group = Group.find(params[:group_id])
    @fixed_cost.group = @group

    @fixed_cost.save

    redirect_to group_task_path(@group, @fixed_cost)
  end

  def show
    @fixed_cost = FixedCost.find(params[:id])
  end

  private

  def fixed_cost_params
    params.require(:fixed_cost).permit(:name, :user_id, :price, :comments)
  end
end
