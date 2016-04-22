class Tribe

  attr_accessor :name, :members

  def initialize(options ={})
    @name = options[:name]
    @members = options[:members]
    # @immune = immune
    puts "#{name} tribe created. It has #{members.length} members"
  end

  def @members.first
  end

  def tribal_council options={}
    @members.reject{ |member| member == options[:immune]}.sample
  end



  def to_s
    @name
  end


end
