class Game

  attr_accessor :tribes

  def initialize(*tribes)
    @tribes = tribes
  end

  def tribes
    @tribes
  end

  def immunity_challenge
    @tribes.sample
  end

  def merge(name)
    members = []
    @tribes.each do |tribe|
      tribe.members.each do |member|
        members << member
      end
    end
    clear_tribes
    @tribes[0] = Tribe.new(name: name, members: members)
  end

  def individual_immunity_challenge
    @tribes.first.members.sample
  end

  def clear_tribes
    @tribes.clear
  end

  def add_tribe(tribe)
    @tribes.push(tribe)
  end

end
