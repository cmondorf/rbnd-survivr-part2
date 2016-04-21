class Jury


  attr_accessor :members, :cast_votes


  def initialize()
    @members = []
    @cast_votes = {}
    # @jury_members
    # @finalists
  end

  def cast_votes(finalists)
    finalists.each  { |finalist| @cast_votes[finalist]= 0}
    members.each do |member|
      puts "#{member} is voting for #{finalists.sample}"
      @cast_votes[finalists.sample] += 1
    end
   @cast_votes
  end

  def add_member(new_member)
    @members << new_member
  end

  def report_votes(cast_votes)
    cast_votes.each_pair { |key, value| puts "#{key} got #{value} votes"}
  end

  def announce_winner(cast_votes)
    return cast_votes.max_by {|k,v| v}[0]
  end

end
