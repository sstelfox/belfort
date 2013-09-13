
module Belfort
  # An ordered list of the rounds that occur within the game.
  ROUNDS = [:calendar, :placement, :collection, :actions, :scoring]

  # The list of the various places that exist within a section for a player to
  # place pieces (with the exception of guilds)
  SECTION_AREAS = [ :bank, :blacksmith, :gardens, :gatehouse_left,
    :gatehouse_right, :inn, :keep_left, :keep_right, :library, :market, :pub,
    :tower ]
end
