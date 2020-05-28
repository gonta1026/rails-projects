class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @memos = Memo.includes(:user).where(category_id: params[:id]).order("created_at DESC").page(params[:page]).per(10)
  end
end

