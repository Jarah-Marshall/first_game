Resources:
	Tutorial Video: https://www.youtube.com/watch?v=GwCiGixlqiU
	
	Audio Tutorial video: https://www.youtube.com/watch?v=N3p-7iJWRBY?
	
	Tilemap Tutorial video: https://www.youtube.com/watch?v=ZutpG0_CYrQ&t=2106s
	
	Assets Used:
		GDQuest Game Assets: https://www.gdquest.com/library/first_2d_game_godot4_vampire_survivor/
		Godot Royalty Free Sound Effects: https://store.godotengine.org/asset/ovani-sound/sound-fx-starter-pack-vol/
		Itch.io Desert Tilemap: https://beyonderboy.itch.io/desert-map-tileset-16x16
	
	Tutorial took me roughly 2 hours and 30 minutes to complete
	
	Change Number One: Create another Path2D and PathFollow2D scene to spawn trees 
	as the player moves around, this change took me roughly 10 minutes. I intend to
	put more time into my other two changes as a note.
	
	Change Number Two: I used the Muzzle Flash asset and used it to make a secondary
	type of fire called missle. The missle does 3 damage and shoots every 1.5 seconds.
	This change took me about an hour as I had to make adjustments to make it visible and
	work properly against a slime.

	Change Number Three: Add a health bar to the slime and sound effects to the player, slime,
	gun, and game over screen. I also fixed a bug where slimes weren't dying when being hit by
	a missle. I just changed the if statement to check whether or not the health bar went on or
	below zero. This change took me about an hour and a half as I was having trouble linking the 
	sound to the actual scene, a youtube tutorial helped me out however.
	
	Homework 3 - Loop Implementation: Added a wave system, once player defeats X amount of slimes
	game progresses to the next wave. There's still some bugs surrounding how the waves increment
	but it is functional. Also implemented a leveling system, each time the player defeats X amount
	of slimes, they level up; gaining health and damage. Lastly, I have the slimes health and damage
	increasing per round and a boss spawning every 5 rounds, the boss does more damage and starts at 50
	health with a tacked on wave * 3 additional health. Tweaks need to be made to the wave system and
	boss system as it has some odd bugs, I will keep working at it

	Homework 4 - Adding Juice:
	Evie - Replaced player, enemy, gun, and bullet/missile assets with ones made myself. Tweaked the animations as well. (~6 hours)
	Jarah - Created the Tilemap by using Terrain presets and physics layers to make the game have a similar feel to its original
	implentation, I also adjusted the scale of all the preexisiting assets(slimes, player, etc.) to match the sizing of the map, this
	took about 6 hours due to bugs and learning how to do it properly.
