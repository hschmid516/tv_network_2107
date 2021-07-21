class Network
  attr_reader :name,
              :shows

  def initialize(name)
    @name  = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    main_characters = @shows.map do |show|
      show.characters
    end
    main_characters.flatten
  end

  def actors_by_show
    actors_by_show = @shows.each_with_object(Hash.new { |hash, key| hash[key] = [] }) do |show, hash|
      show.characters.each do |character|
        hash[show] << character.actor
        hash[show]
      end
    end
  end

  def shows_by_actor
    shows_by_actor = @shows.each_with_object(Hash.new { |hash, key| hash[key] = [] }) do |show, hash|
      show.characters.each do |character|
        @shows.each do |show|
          if actors_by_show[show].include?(character.actor)
              if hash[character.actor].include?(show) == false
                  hash[character.actor] << show
                  hash[character.actor]
              end
          end
        end
      end
    end
  end
end
