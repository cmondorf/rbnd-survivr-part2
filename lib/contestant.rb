class Contestant

attr_accessor :name

  def initialize(name)
    @name = name
    @immune = false
  end

  def sample
    print "#{contestant}"
  end

  def to_s
    @name
  end

end
