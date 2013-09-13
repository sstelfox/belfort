
module Belfort
  # An ordered list of the rounds that occur within the game.
  ROUNDS = [:calendar, :placement, :collection, :actions, :scoring]

  # The list of the various places that exist within a section for a player to
  # place pieces (with the exception of guilds)
  SECTION_AREAS = [ :bank, :blacksmith, :gardens, :gatehouse_left,
    :gatehouse_right, :inn, :keep_left, :keep_right, :library, :market, :pub,
    :tower, :wall_left, :wall_right ]

  # A list of the names of only basic type guilds.
  BASIC_GUILDS = [ :merchants, :librarians, :architects, :recruiters ]

  # A list of the names of only interactive type guilds.
  INTERACTIVE_GUILDS = [ :thieves, :bandits, :wizards, :spies ]

  # A list of the names of only resource type guilds.
  RESOURCE_GUILDS = [ :sawyers, :miners, :bankers, :masons ]

  # The combination of all available guilds
  ALL_GUILDS = BASIC_GUILDS + INTERACTIVE_GUILDS + RESOURCE_GUILDS
end
