class ItemsController < ApplicationController
  def index
    @items = current_user.items
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      flash[:notice] = 'Success!'
      redirect_to root_path, notice: 'Task saved'
    else
      flash[:alert] = 'Task failed to save.'
      render :new
    end
  end

  def destroy
    @item = Item.find_by_id(params[:item_id])
    if @item.destroy
      flash[:notice] = "Congratulations on a task well done!"
      redirect_to root_path, notice: 'Task completed!'
    else
      flash[:alert] = "Task couldn't be marked as complete. Please try again."
      redirect_to root_path
    end
  end


  private
  def item_params
    params.require(:item).permit(:title)
  end

end
