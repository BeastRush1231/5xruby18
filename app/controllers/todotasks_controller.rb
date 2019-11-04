class TodotasksController < ApplicationController
  before_action :find_todotask, only: [:edit, :update, :destroy]
  
  def index
    @todotask = Todotask.all
  end

  def new
    @todotask = Todotask.new
  end

  def create
    @todotask = Todotask.new(todotask_params)
    if @todotask.save
      redirect_to todotasks_path, notice: "新增任務成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @todotask.update(todotask_params)
      redirect_to todotasks_path, notice: "更新任務成功!"
    else
      render :edit
    end
  end

  def destroy
    @todotask.destroy if @todotask
    redirect_to todotasks_path, notice: "刪除任務成功!"
  end

  private

  def find_todotask
    @todotask = Todotask.find(params[:id])
  end
  
  def todotask_params
    params.require(:todotask).permit(:name, :content)
  end
end
