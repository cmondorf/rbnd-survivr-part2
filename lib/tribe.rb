class Tribe

  attr_accessor :name, :members


  def initialize(options ={})
    @name = options[:name]
    @members = options[:members]
    puts "#{name} tribe created. It has #{members.length} members".green
  end

  def @members.first
  end

  # def eliminate(member)
  #   @members.delete(member)
  # end

  def tribal_council(options={})
    elimination_candidate = @members.reject{ |member| member == options[:immune]}.sample
    @members.delete(elimination_candidate)
  end



  def to_s
    @name
  end


end
