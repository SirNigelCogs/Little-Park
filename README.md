# Little-Park
A simple classic-style text adventure game written in D.

This is a very simple classic text adventure game written in D as something of an experiment.  The game text itself,
such as the room descriptions etc., are copyright 2019 while the rest of the code is licensed under the GPLv2.  If these
sorts of games interest you, feel free to take a look at the code.  More features and polish will be added as the code and game
continue to be worked on.

Like many classic text adventure games, especially those on 8-bit platforms like the Commodore 64, the goal of the game is to
explore and collect all the treasure items and bring them to a specific room where their score values will be counted up.  The
game is won by finding all the treasure items.

The easiest way to compile the code is by running "dmd -i -O -release LittlePark.d".  If you want to keep the debug symbols in
the compiled binary, simply don't add the -release flag.
