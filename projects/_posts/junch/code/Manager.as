class Manager extends Object
{

//Define the variables for the manager class
private var enemyNames				:Array; 									//This array holds the references to the enemies
private var player								:MovieClip = null;				//The reference to the player
private var cursor								:MovieClip = null;				//reference to mouse cursor	

var enemyManager			:EnemyManager= null;		//reference to the bad guy management system

var terrain												:Array;										//Array that stores the references to the terrain elements
																														//0 = the ground
																														//1 = the left wall
																														//2 = the right wall
																														//3 = any other terrain element
																														//.. = any other terrain element


function Manager()																					//Constructor function for the Manager class
{
	trace("Manager class created");
	this.init();

	trace(".");	
	trace("depths of backgroundElements: "+_root.backgroundElements.getDepth()+"."+_root.backgroundElements.getNextHighestDepth());
	trace("depths of playerElements: "+_root.playerElements.getDepth()+"."+_root.playerElements.getNextHighestDepth());		
	trace("depths of foregroundElements: "+_root.foregroundElements.getDepth()+"."+_root.foregroundElements.getNextHighestDepth());
	trace("depths of interfaceElements: "+_root.interfaceElements.getDepth()+"."+_root.interfaceElements.getNextHighestDepth());
	trace(".");	

}


function init()
{
	trace("init() called");


	_root.createEmptyMovieClip("backgroundElements", 1000);
	_root.createEmptyMovieClip("terrainElements", 2000);
	_root.createEmptyMovieClip("playerElements", 3000);
	_root.createEmptyMovieClip("enemyElements", 4000);
	_root.createEmptyMovieClip("foregroundElements", 8000);
	_root.createEmptyMovieClip("interfaceElements", 9000);

	this.createTerrain();																			//build the terrain
	this.createMouseCursor();																//Create the cursor for the mouse

	this.spawnPlayer();																			//Spawn the player controlled character
	this.spawnFoes();																				//Spawn the NPC enemies 
}

function createTerrain()
{
		trace("createTerrain() called, terrain being built");
		this.terrain								= new Array ();

		this.terrain[0] 						= _root.terrainElements.attachMovie("mcGround","mcGround", _root.terrainElements.getNextHighestDepth());		//Make the Ground plane
		this.terrain[1]						= _root.terrainElements.attachMovie("mcWall","mcWallL", _root.terrainElements.getNextHighestDepth());					//Make the Left Wall
		this.terrain[1].setType("leftWall");
		this.terrain[2] 						= _root.terrainElements.attachMovie("mcWall","mcWallR", _root.terrainElements.getNextHighestDepth());					//Make the Right Wall
		this.terrain[2].setType("rightWall");

		trace(".");	
		trace("contents of terrain[0]: "+this.terrain[0]);
		trace("contents of terrain[1]: "+this.terrain[1]);		
		trace("contents of terrain[2]: "+this.terrain[2]);
}


function spawnPlayer()
{

	var initPlayer 							= new Object();											//init obj used to pass variables into the new object
	initPlayer.players 					= this.enemyNames;								//tell player about the enemies
	initPlayer.terrain					= this.terrain;											//pass the player the location of the ground
	initPlayer._x								= 200;															//start player on the left of the screen
	initPlayer._y								= 50;
	initPlayer.speed						= 20;																//start the player on a roll
	initPlayer.mouseCursor		= this.cursor;											//reference to the mouse

	trace("spawnPlayer() called");
	this.player = _root.playerElements.attachMovie("mcPlayer","mcPlayer", _root.playerElements.getNextHighestDepth(), initPlayer);
}















function spawnFoes()
{
	trace("spawnFoes() called");

	var initEM	 							= new Object();											//init obj used to pass variables into the new object
	initEM.emPlayer					= this.player;								//tell player about the enemies
	initEM.emTerrain				= this.terrain;	

	this.enemyManager 			= new EnemyManager();
	
	//trace("the manager is trying to send the player value: "+this.player+" to the enemy Manager");
	//trace("the manager is trying to send the terrain array: "+this.terrain+" to the enemy Manager");
	//this.enemyManager.initValues(this.terrain, this.player);
	//this.enemyManager.spawnSeekers(amount);
	//enemyManager.setEnemyTarget(this.player);
}
	













//iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii//Interface
function createMouseCursor()
{
	this.cursor = _root.interfaceElements.attachMovie("mcMouseCursor", "mcMouseCursor", _root.interfaceElements.getNextHighestDepth());
}//createMouseCursor()










}