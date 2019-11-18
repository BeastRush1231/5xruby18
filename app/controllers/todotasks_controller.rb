class TodotasksController < ApplicationController
  before_action :find_todotask, only: [:edit, :update, :destroy]
  http_basic_authenticate_with name: "5xruby", password: "secret", except: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @todotask = Todotask.order(created_at: :desc)
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

  def find_todotask
    @todotask = Todotask.find(params[:id])
  end
  
  def todotask_params
    params.require(:todotask).permit(:name, :content)
  end
end
