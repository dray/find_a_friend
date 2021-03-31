class MembersController < ApplicationController
  
  def index
    @members = Member.all
  end
  
  def show
    @member = Member.find(params[:id])
    @friends = @member.friends
    excluded_members = @friends.map(&:id).concat [params[:id]]
    @everyone_else = Member.where.not(id: excluded_members)

    if !params[:search].blank? && !@friends.blank?
      member_id = params[:id].to_i
      simple_match = search_for_headers
      @results = identify_member_connections(simple_match, member_id)
      @results.compact!
      @results
    end
  end
  
  def new
    @member = Member.new
  end
  
  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to member_path(@member.id)
    else
      redirect_to new_member_path(@member.id), notice: "Error" 
    end
  end

  private

  def member_params
    params.require(:member).permit(:first_name, :last_name, :original_url, :short_url)
  end

  def search_for_headers
    Header.where("text ILIKE ?", "%#{params[:search]}%")
  end

  def identify_member_connections(matches, member_id)
    results = []
    matches.each do |heading|
      destination_id = heading.member_id
      heading_text = heading.text
      results << Member.search(member_id, destination_id, heading_text)
    end
    results
  end

end
