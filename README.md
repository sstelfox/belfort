# Belfort

This is pure ruby implementation of the board game
[Belfort](http://playtmg.com/products/belfort). I'm writing it mostly as a way
to improve my test writing abilities, and if the project gets far enough along
to rapidly test various strategies for use in the board game itself.

This is never intended to be 'playable' version. I am minorly concerned that TMG
might not look kindly on this project if it were too become a playable version.

To TMG in the event they find this project: I have only the utmost respect for
your board games and this project is based on that appreciation. If you feel
this project might take any revenue from you let me know and I'll take it down.

## A Note on Rules

To everyone that finds this, please note that the codified mechanics are based
on my interpretation of the rules and these may differ from what you're used
too if you've interpreted something differently.

Generally the rules are pretty well covered and the few places that might have
put me slightly off were covered in the forum on rule
[clarification](http://boardgamegeek.com/forum/384119/belfort/rules).

One of the things that got me was a misprint between the Thieve's Guild card
and the rulebook. From one of the game designers though:

    I believe there is a misprint in the rulebook - the Theives' Guild tile is
    correct. You steal 2 gold from any 1 player, or 1 gold each from up to 3
    different players.

Another thing that didn't seem clear to me (and prevented me from using it in
the first game) though is perfectly clear after reading the rule book around
the market card.

For the time being I've also chosen to complete ignore the alternate rules for
a 2-player game. This was a big decision as it can dramatically shift the style
and power-bases of play. Basically this decision was made due to the complexity
of implementing alternate rules and that in-house I generally ignore them
anyway.

I was intending to implement a bank of sorts but a particular line from the
rules prevented me. The primary reason for existance for the bank would have
been to limit the total number of resources available within the game. The
quote that changed my mind was:

    Resources are not meant to be limited by the number of pieces in the game.
    If the supply ever runs out of a resource, a player can use the included
    multiplier chips to make change and return some to the supply. For example,
    if the supply runs out of Stone, a player with a lot of Stone could return
    5 Stone to the supply, then take 1 Stone on a x5 multiplier chip.

## Installation

    $ gem install belfort

## Usage

Run it straight from the command line like so:

    $ belfort

## Contributing

1. Fork it
2. Create your feature branch off of the current `develop` head (`git checkout
   -b my-new-feature origin/develop`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

I'll respond to all pull requests within two weeks, hopefully in under one.
