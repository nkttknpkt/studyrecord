class LearnsController < ApplicationController
   before_action :require_user_logged_in
   
  def index
    @learns = Learn.all
  end
  
  def new
    @learn = Learn.new
  end
  
  def create
    @learn = Learn.new(learn_params)

    if @learn.save
      flash[:success] = '勉強記録が正常に作成されました'
      redirect_to '/'
    else
      flash.now[:danger] = '勉強記録が作成されませんでした'
      render :new
    end
  end

  def edit
    @learn = Learn.find(params[:id])
  end

  def update
    @learn = Learn.find(params[:id])
    
    if @learn.update(learn_params)
      flash[:success] = '勉強記録は正常に更新されました'
      redirect_to '/'
    else
      flash.now[:danger] = '勉強記録は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @learn = Learn.find(params[:id])
    @learn.destroy
    
    flash[:success] = '勉強記録は正常に削除されました'
    redirect_to learns_url
  end

  private

  # Strong Parameter
  def message_params
    params.require(:learn).permit(:date, :content, :note)
  end
end

