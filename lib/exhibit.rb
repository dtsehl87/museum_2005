class Exhibit

  attr_reader :name

  def initialize(details)
    @name = details[:name]
  end

end
