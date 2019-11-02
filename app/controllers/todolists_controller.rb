class TodolistsController < ApplicationController
  
  def index
    @todolist = Todolist.all
  end

  def new
    @todolist = Todolist.new
  end

  def create
    @todolist = Todolist.new(todolist_params)
    if @todolist.save
      redirect_to todolists_path, notice: "新增任務成功"
    else
      render :new
    end
  end

  def edit
    @todolist = Todolist.find_by(id: params[:id])
  end

  def update
    @todolist = Todolist.find_by(id: params[:id])
    if @todolist.update(todolist_params)
      redirect_to todolists_path, notice: "更新任務成功!"
    else
      render :edit
    end
  end

  def destroy
    @todolist = Todolist.find_by(id: params[:id])
    @todolist.destroy if @todolist
    redirect_to todolists_path, notice: "刪除任務成功!"
  end

  private

  def todolist_params
    params.require(:todolist).permit(:name, :content)
  end
end
