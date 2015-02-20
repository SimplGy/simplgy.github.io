class EnemyManager extends Object
{ 

//==============================================================properties
private var enemyCount:											Number = 0; 			//Number of enemy players in the game
private var emEnemies:											Array = null;																												//Array which references the enemies
private var emTerrain:												Array = null;																												//reference to the location of terrain elements
private var emPlayer													:MovieClip = null;								//reference to the player

function EnemyManager ()
{
	trace(this+" enemy manager has been created");

	this.spawnSeekers(7);
}//EnemyManager ()









function setEnemyTarget(newTarg:MovieClip)
{
	trace(this+" has been assigned a new target for the enemies to pursue: "+newTarg);
	this.emPlayer = newTarg;
} //setEnemyTarget()








function initValues (newT:Array, newP:MovieClip)//Sets init values:[terrain array], [player name]
{
	this.emTerrain			= newT;
	this.emPlayer			= newP;

	trace("......................................................");
	trace("this.emTerrain is now: "+this.emTerrain);
	trace("this.emPlayer is now: "+this.emPlayer);
}//initValues ()









//Random number generator for enemy placement
function randRange(min:Number, max:Number):Number
{
    var randomNum:Number = Math.round(Math.random() * (max-min+1) + (min-.5));
    return randomNum;
}













function noFoes()
{
	for  (var i:Number = 1; i < this.enemyCount; i++) 
	{
		trace("[].[].[].[].[].[].[].[].[]Seeker "+emEnemies[i]+" is being checked for existance");
		if (emEnemies[i]==" ") trace("!!!!!!!!!!!!!!!!!!!!found an empty MC");
	}
return (true);

//return (false);

}//noFoes()
















function spawnSeekers(newCount)
{

	this.enemyCount		= newCount;
	this.emEnemies		= new Array();
	this.emPlayer			= _root.playerElements.mcPlayer;
	this.emTerrain			= _root.Manager.terrain;
	var initObj 					= new Object();
	var randInt;	
	var multiplier;

	trace("spawnSeekers() was called for "+enemyCount+" bad guys");
	trace("spawnSeekers() is trying to target: "+this.emPlayer);

	trace(".......................Terrain Array at spawn: "+this.emTerrain);
	trace(".......................enemies Array at spawn: "+this.emEnemies);

	//create many rounding pieces of toast
	for  (var i:Number = 1; i < this.enemyCount; i++) 
	{
		//var tempRounder;
		
		initObj._x 								= this.randRange(25, (Stage.width-150));
		initObj._y 								= this.randRange(25, 150);
		initObj.speed 						= this.randRange(2, 7);
		initObj.maxTurnAng			=	this.randRange(2,60);
		initObj.targetMC 					= this.emPlayer;
		initObj.otherEnemies		= this.emEnemies;
		initObj.otherTerrain			= this.emTerrain;

		randInt 									= Math.round(this.randRange(1,2))												//get positive or negative randomly
				if (randInt == 1) { //then multiplier is negative
						multiplier = -1;
				}else {//multiplier is positive
						multiplier = 1;
				};
		//trace("initObj._x: "+initObj._x);
		//trace("initObj._y: "+initObj._y);
		//trace("initObj.speed: "+initObj.speed);
		//trace("initObj.targetMC: "+initObj.targetMC);
		
		
		this.emEnemies[i] = _root.attachMovie("mcEnemySeeker","mcEnemySeeker"+i, i, initObj);
		//trace("Seeker "+this.emEnemies[i]+" was created by the EnemyManager");
		
	}//for bad guy count
}//spawnWeakSeekers();





}//class EnemyManager