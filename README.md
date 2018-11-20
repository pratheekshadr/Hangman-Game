# Hangman-Game
Hangman game using Lua Love2D

Installation on Ubuntu:

1. $ sudo apt-get install lua

2. $ sudo apt-get install lua5.2

3. $ sudo add-apt-repository ppa:bartbes/love-stable

4. $ sudo apt-get update

5. $ sudo apt-get install love

6. Checking version :
	$ lua -v
	$ luac -v
	$ love --version
	
To run the code:

1. create one folder say folder1
2. create a file with .lua extension inside folder1 with code
   Example:
	function love.draw()
    		love.graphics.print("Hello World", 400, 300)
	end
	
3. open terminal 
	$ love pathToThefolder
	
   (or)
   	Goto the folder where .lua file is present. Open terminal and type
   	$ love .
    
Description about the game:
It is a game in which the player has to guess a word and each letter of the word is represented by a dash.
The player guessing the word may, at any time, attempt to guess the whole word. 
If the word is correct, the game is over and the guesser wins and a “yay” sound clip is played.
Otherwise, the other player may choose to penalize the guesser by moving the man closer to the rope as a tally mark and a “oh no” sound clip is played.
If the player makes enough incorrect guesses to allow his opponent to complete the diagram, the game is over.
