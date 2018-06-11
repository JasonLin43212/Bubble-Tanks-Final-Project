# Bubble-Tanks-Final-Project
A top down shooter with Bubble Tanks with different types of upgrades and enemies.
## Features
* The ability to move around and shoot with keyboard and mouse.
* The ability to kill enemies or get klled.
* Different player models that change as you progress.
* Transfering between different rooms with their own enemies.
* Have a health and experience bar to indicate progress.
* A map to show current location and where you have been.

## Features after Demo
* Special attacks that deal massive damage on enemies.
* Unique bosses with their own patterns of attack.
* Picking your own upgrades to fight enemies with.
* A win and losing screen.
* A better looking map.
* Map boundries.

## Running Game
* First, you need to clone this repository.
```
git clone https://github.com/JasonLin43212/Bubble-Tanks-Final-Project.git
```
* If you can use the `processing` command in your terminal, open it in the terminal.
```
cd Bubble-Tanks-Final-Project/
cd Game/
processing Game.pde
```
* If you cannot use that command, simply open up Processing 3 and go to File > Open... and choose Game.pde in the Bubble-Tanks-Final-Project directory.

Finally, you use Ctrl-R to run the game.

### How To Play
* To move, use the **W A S D** keys
* To shoot use:  
  * your **MOUSE** to aim and **CLICK** to shoot  
  * your **LEFT** and **RIGHT** arrow keys to aim and **SPACE** to shoot
* Use the map to check:  
  * Where you started
  * Where you are
  * Rooms you've cleared
  * Where the boss room is 
  
  Then just click to exit if you're using a mouse or click the **V** key to toggle the map

Have Fun!

## Bugs That Do Not Affect Gameplay
* When transfering between rooms, you can catch a glimpse of what is in the other room before transfering.

## Bugs That Do Affect Gameplay
* If you are moving and then decide to click outside of the window, your tank will continue to move. To fix this, click back inside the game and use the WASD keys to move in the direction that the tank is currently moving in. It should stop the tank from moving any further.
