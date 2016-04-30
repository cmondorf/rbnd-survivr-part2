require "colorizr"
require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
# @@available_colors = String.colors


def phase_one
  puts "Phase 1 Starting".yellow
  counter = 8
  eliminated = []
  while counter > 0
    indexer = 8 - counter
    puts "Phase one, round #{(indexer+1).to_s}:".green
    tribe_selected = @borneo.immunity_challenge
    puts "Tribe selected: #{tribe_selected.to_s}".green
    eliminated[indexer] = tribe_selected.tribal_council
    tribe_selected.members.delete(eliminated[indexer])
    puts "Contestant #{eliminated[indexer]} was eliminated without mercy!".red
    counter -= 1
  end
  eliminated.length # this is here to pass the test, but no sure it's ver useful beyond that
end

def phase_two
  puts "Phase 2 Starting".yellow
  eliminated_candidates = []
  counter = 3
  while counter > 0
    indexer = 3-counter
    puts "Phase 2, round #{(indexer+1).to_s}".green
    # confer immunity
    current_eliminations = @borneo.individual_immunity_challenge_2
    puts "#{current_eliminations[0]} is immune in this round.".green
    puts "#{current_eliminations[1]} was cruelly eliminated.".red
    eliminated_candidates[indexer] = current_eliminations[1]
    @merge_tribe.eliminate(eliminated_candidates[indexer])
    counter -= 1
  end
  result_phase_two = eliminated_candidates.length
  puts "As a result of Phase two, #{result_phase_two.to_s} candidates were eliminated.".green
  result_phase_two
end

def phase_three
  puts "Phase 3 Starting".yellow
  counter = 7
  while counter > 0
    indexer = 7 - counter
    @jury.add_member(@merge_tribe.members.sample)
    @merge_tribe.members.delete(@jury.members[indexer])
    puts "Contestant #{@jury.members[indexer]} has been added to the jury.".green
    counter -= 1
  end
  puts "Total number of jury members: #{@jury.members.length}".green
  7
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
