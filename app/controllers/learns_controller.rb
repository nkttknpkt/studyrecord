class LearnsController < ApplicationController
   before_action :require_user_logged_in
   
  def index
    @learns = current_user.learns.all
  end
  
  def new
    @learn = current_user.learns.build
  end
  
  def create
    @learn = current_user.learns.build(learn_params)

    if @learn.save
      flash[:success] = '勉強記録が正常に作成されました'
      redirect_to '/'
    else
      flash.now[:danger] = '勉強記録が作成されませんでした'
      render :new
    end
  end

  def edit
    @learn = current_user.learns.find_by(id: params[:id])
  end

  def update
    @learn = current_user.learns.find_by(id: params[:id])
    
    if @learn.update(learn_params)
      flash[:success] = '勉強記録は正常に更新されました'
      redirect_to '/'
    else
      flash.now[:danger] = '勉強記録は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @learn = current_user.learns.find_by(id: params[:id])
    @learn.destroy
    
    flash[:success] = '勉強記録は正常に削除されました'
    redirect_to learns_url
  end

  private

  # Strong Parameter
  def learn_params
    params.require(:learn).permit(:date, :content, :note)
  end
end

