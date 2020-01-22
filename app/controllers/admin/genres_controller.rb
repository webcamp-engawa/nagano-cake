class Admin::GenresController < ApplicationController


before_action :authenticate_admin!

	def index
		@genre = Genre.new
		@genres = Genre.page(params[:page])
	end

	def create
		@genre = Genre.new(genre_params)
		if @genre.save
		redirect_to admin_genres_path
		flash[:notice_genre] = "ジャンルを追加しました！"
		else
		@genres = Genre.page(params[:page])
		render 'index'
		end
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		if @genre.update(genre_params)
		redirect_to admin_genres_path
		flash[:notice_update] = "ジャンル情報を更新しました！"
		else
		render 'edit'
		end
	end

	private
	def genre_params
		params.require(:genre).permit(:name,:is_active)
	end

end
