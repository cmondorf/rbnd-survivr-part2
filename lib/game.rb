class Game

  attr_accessor :tribes

  def initialize(*tribes)
    @tribes = tribes
  end

  def tribes
    @tribes
  end

  def immunity_challenge
    @tribes[0]
  end

  def merge(tribe_name)
    members_to_add = []
    members_to_add[0] = @tribes[0].members[0]
    members_to_add[1] = @tribes[1].members[0]
    Tribe.new({name: tribe_name, members: members_to_add })
  end

  def individual_immunity_challenge
    @tribes[0].members[0]
  end

  def clear_tribes
    @tribes.clear
  end

  def add_tribe(tribe)
    @tribes.push(tribe)
  end

end
