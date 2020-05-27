class Museum

  attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommended = []
    patron.interests.find_all do |interest|
      @exhibits.each do |exhibit|
        if interest == exhibit.name
          recommended << exhibit
        end
      end
    end
    recommended
  end

end
