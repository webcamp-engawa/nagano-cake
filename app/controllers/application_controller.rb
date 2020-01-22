class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_seach


	def after_sign_in_path_for(resource)
		case resource
			when Admin
			admin_root_path
			when Customer
			root_path
		end
	end


def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  	def set_seach
		@search = Item.active_all.ransack(params[:q])
  		@search_items = @search.result(is_sold: false).page(params[:page])
  	end

		def autocomplete_name
			# params[:name]の値でItem.nameを前方一致検索、name列だけ取り出し、nilと空文字を取り除いた配列
			names = Item.by_name_like(autocomplete_params[:name]).pluck(:name).reject(&:blank?)
			render json: names
		end

		private

			def autocomplete_params
				params.permit(:name)
			end

	protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :is_deleted])
		end

end
