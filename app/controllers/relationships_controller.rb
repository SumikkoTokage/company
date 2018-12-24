class RelationshipsController < ApplicationController
  def create
  	#binding.pry
    follow = current_user.passive_relationships.build(following_id: params[:creator_id])
    follow.save
    redirect_to creators_path
  end

  def destroy
    follow = current_user.passive_relationships.find_by(following_id: params[:creator_id])
    follow.destroy
    redirect_to creators_path
  end
end
