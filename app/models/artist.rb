class Artist

  attr_reader :name, :years_experience

  @@all = []

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def paintings
    Painting.all.select {|painting| painting.artist == self}
  end

  def galleries
    self.paintings.map {|painting| painting.gallery}
  end

  def cities
    self.galleries.map {|painting| painting.city}
  end

  def self.total_experience
    @@all.reduce(0) {|previous, current| previous + current.years_experience}
  end

  def self.most_prolific
    @@all.max_by do |artist|
      artist.paintings.count.to_f / artist.years_experience
    end
  end 

  def create_painting(title, price, gallery)
    Painting.new(title, price, self, gallery)
  end


end
