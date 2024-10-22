# mastermind
Mastermind - The Odin Project
Creating the popular game Mastermind in ruby as part of The Odin Project.
Full description of task available at https://www.theodinproject.com/lessons/ruby-mastermind

Update 2:
I have implemented a bare minimum implementation of play against the computer.  The computer makes randomised guesses each turn.
Will consider expanding this to use some sort of rule to allow the comp to make better decisions.

Update:
I have refactored the game from top to bottom after thinking it through properly.
I followed through on the thoughts i had after completing my first iteration (see below)
Peg class has been removed.  Really all it was storing was a single character and a method for colouring that character.  I moved the color method to standard_game.rb as it needed to be used there anyway.

StandardGame Class created to run a standard game, cleaned this up and seperated out functions to individual methods.
changed the way previous turns were recorded.  Instead of nested hashes (confusing to look at) i made the Turn class.  Turn stores information about each turn and each turn object is stored in an array called previous_turns.

codemaker_game.rb is for part two of the project and has not yet been implemented.


1st Iteration:
Game is complete to a minimum standard. 
However the code is a mess.  I over-thought it to begin with and made things more complex than they need to be.
There is code in mastermind.rb that should be in code.rb, the peg class probably doesnt need to exist, could just be methods in code.rb
I may come back and tidy these up or possibly start project again from scratch and this time plan it out properly.

