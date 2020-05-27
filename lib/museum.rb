class Museum

  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
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

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    @exhibits.reduce({}) do |acc, exhibit|
      @patrons.each do |patron|
        patron.interests.find_all do |interest|
          acc[exhibit] = [] if acc[exhibit].nil?
          if interest == exhibit.name
            acc[exhibit] << patron
          end
        end
      end
      acc
    end
  end

  def lottery_contestants(exhibit)
    contestants = []
    @patrons.each do |patron|
      patron.interests.each do |interest|
        if (patron.spending_money < exhibit.cost) && (interest == exhibit.name)
          contestants << patron
        end
      end
    end
    contestants
  end

  def draw_lottery_winner(exhibit)
    contestants = lottery_contestants(exhibit)
    if contestants.empty?
      nil
    else
      output = contestants.shuffle.first
      output.name
    end
  end

  def announce_lottery_winner(exhibit)
    contestant = draw_lottery_winner(exhibit)
    if contestant.nil?
      "No winners for this lottery"
    else
      "#{contestant} has won the #{exhibit.name} exhibit lottery!"
    end
  end

end
