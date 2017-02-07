module WikiisHelper
	def user_is_authorized_for_wiki?
        current_user && (current_user.id == @wikii.user_id)
   end
end
