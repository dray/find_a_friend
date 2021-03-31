class FriendshipsController < ApplicationController
  
  def create
    @member = Member.find(params[:id])
    @friendship = @member.friendships.build(friend_id: params[:friend_id])

    if @friendship.save
      redirect_to member_path(@member.id), notice: "Added friend."
    else
      redirect_to member_path(@member.id), notice: "Error" 
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:member_id, :friend_id)
  end
end
