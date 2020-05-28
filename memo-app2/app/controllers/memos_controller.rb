class MemosController < ApplicationController
  #ユーザーがログインしていない状態でindexアクション以外のリクエストができないようにしている。
  before_action :move_to_index, except: :index
  #paramsでメモのidを取得する。
  before_action :get_memo, only: [:destroy, :edit, :update]

  def index
    @memos = Memo.includes(:user, :category).order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @memo.destroy if @memo.user_id == current_user.id
    redirect_to root_path
  end

  def edit
  end

  def update
    if @memo.update(memo_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def memo_params
    params.require(:memo).permit(:title, :content, :category_id).merge(user_id: current_user.id)
  end

  def get_memo
    @memo = Memo.find(params[:id])
  end


  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

