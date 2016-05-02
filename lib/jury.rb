class Jury


  attr_accessor :members, :cast_votes


  def initialize()
    @members = []
    @cast_votes = {}
    # @jury_members
    # @finalists
  end

  def cast_votes(finalists)
    @cast_votes = {}
    finalists.each  { |finalist| @cast_votes[finalist]=0}
    @members.each do |member|
      sampled_finalist = finalists.sample
      puts "#{member} is voting for #{sampled_finalist}"
      @cast_votes[sampled_finalist] += 1
    end
    @cast_votes
  end

  def add_member(new_member)
    @members << new_member
  end

  def report_votes(cast_votes)
    # total_votes = 0
    cast_votes.each_pair { |key, value| puts "#{key} got #{value} votes"}
    # @cast_votes.each {|k,v| total_votes += v}
    # puts "Total votes: #{total_votes}"
  end

  def announce_winner(cast_votes)
    winner = cast_votes.max_by {|contestant,votes| votes}[0]
    puts "The winner is: #{winner}".yellow
    winner
    #puts "#{cast_votes.min_by {|k,v| v}[0]} is defeated!"
  end

end
