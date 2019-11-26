class TodotasksController < ApplicationController
  before_action :find_todotask, only: [:edit, :update, :destroy]
  before_action :find_todotask_ransack, only: [:index]

  def index
    # @todotask = Todotask.order_by_end_time
    # @todotask = Todotask.order(end_time: :asc)
    @todotask = @q.result.order_by_end_time
  end

  def new
    @todotask = Todotask.new
  end

  def create
    @todotask = Todotask.new(todotask_params)
    if @todotask.save
      redirect_to todotasks_path, notice: t('.notice')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @todotask.update(todotask_params)
      redirect_to todotasks_path, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @todotask.destroy
    redirect_to todotasks_path, notice: t('.notice')
  end

  private

  def find_todotask_ransack
    @q = Todotask.ransack(params[:q])  
  end

  def find_todotask
    @todotask = Todotask.find(params[:id])
  end
  
  def todotask_params
    params.require(:todotask).permit(:name, :content, :start_time, :end_time, :status, :prioirty)
  end
end
