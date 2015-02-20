class EnemySeeker extends Toast
{

var otherEnemies																			:Array = null;//the array referencing other baddies
var otherTerrain																				:Array = null;//terrain array
var targetMC: MovieClip;
var maxTurnAng																				:Number = null;//the maximum angle at which the enemy may turn
var justCollidedInto																		:MovieClip = null;//whether a collision JUST happened
var timeOutLength																			:Number = 50;//frames that an enemy should go on time out for
var timeOutCounter																		:Number = 50;


function EnemySeeker()
{
	trace(this+" enemy seeker has been created by EnemySeeker()");
}//EnemySeeker()






	
function setTarget(targ)
{
	this.targetMC = targ;
	trace("the setTarget() function was called with this target: "+targ);
}








function onEnterFrame( )
{
	//trace(this+" sees the player as: "+this.targetMC);
	this.checkPlayerCollisions();
	this.checkTerrainCollisions();
	this.checkHumanPlayerCollisions();
	//trace(this+" is pursuing "+this.targetMC);
	//check that the target is valid
	//if (targetMC != NULL) {
		//turn a little
		//this.incHeadFor(this.targetMC, this.maxTurnAng);
		//move a little
		this.fwd( );
}









//ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc//Collisions with other players
function checkPlayerCollisions()																														
{
	

//=============================================================check if unit hit someone else
	for (var i = 1; otherEnemies[i] != undefined; i++)																						// loop while terrain variable is valid
	{
			//trace("CheckTerrainCollisions() is checking: "+terrain[i]);
			if(this.hitTest(this.otherEnemies[i]) && this != (this.otherEnemies[i]))									//if player hits someone, and it's not itself
			{
				//trace(this+" collided into: "+this.otherEnemies[i]);
				this.timeOutCounter = 0;																															//reset collision timer
				this.justCollidedInto = this.otherEnemies[i]																					//the guy that was just hit																
			} //hit test
		}//terrain check loop


//=============================================================check if unit is on time out
	if (this.timeOutCounter < this.timeOutLength) {																						//if on time out...
		this.timeOutCounter++																																	//increment time out counter
		this.incHeadAway(this.justCollidedInto, this.maxTurnAng);
	} else  {																																											//else if not on time out
		this.incHeadFor(this.targetMC, this.maxTurnAng);																			//head for target
		//trace(this+" is not on time out anymore, so it's heading for: "+this.targetMC);
	}

}//checkPlayerCollisions()



















//ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc//Collisions with terrain
function checkTerrainCollisions ()
{



//=============================================================check if unit hit someone else
	for (var i = 1; otherTerrain[i] != undefined; i++)																						// loop while terrain variable is valid
	{
			//trace("CheckTerrainCollisions() is checking: "+terrain[i]);
			if(this.hitTest(this.otherTerrain[i]) && this != (this.otherTerrain[i]))									//if player hits someone, and it's not itself
			{
				//trace(this+" collided into: "+this.otherTerrain[i]);
				this.timeOutCounter = 0;																															//reset collision timer
				this.justCollidedInto = this.otherTerrain[i]																					//the guy that was just hit																
			} //hit test
		}//terrain check loop


//=============================================================check if unit is on time out
	if (this.timeOutCounter < this.timeOutLength) {																						//if on time out...
		this.timeOutCounter++																																	//increment time out counter
		this.incHeadAway(this.justCollidedInto, this.maxTurnAng);
	} else  {																																											//else if not on time out
		this.incHeadFor(this.targetMC, this.maxTurnAng);																			//head for target
		//trace(this+" is not on time out anymore, so it's heading for: "+this.targetMC);
	}




}//checkTerrainCollisions ()











//ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc//Collisions with the human player
function checkHumanPlayerCollisions()																														
{
	

	if(this.distance(this.targetMC) < 40) {
		trace("NOT GOOD! the player: "+this.targetMC+" has been killed by: "+this);
		//this.killPlayer(this.targetMC);
	}	
	if(this.hitTest(this.targetMC.butter.mcButterStick["mcHitZone"]) && this.targetMC.butter.isPunching) {
		trace("GREAT! the player: "+this.targetMC+" has killed: "+this);
		//this.killPlayer(this);
		}	













//=============================================================check if unit hit someone else
	for (var i = 1; otherEnemies[i] != undefined; i++)																						// loop while terrain variable is valid
	{
			//trace("CheckTerrainCollisions() is checking: "+terrain[i]);
			if(this.hitTest(this.otherEnemies[i]) && this != (this.otherEnemies[i]))									//if player hits someone, and it's not itself
			{
				//trace(this+" collided into: "+this.otherEnemies[i]);
				this.timeOutCounter = 0;																															//reset collision timer
				this.justCollidedInto = this.otherEnemies[i]																					//the guy that was just hit																
			} //hit test
		}//terrain check loop


//=============================================================check if unit is on time out
	if (this.timeOutCounter < this.timeOutLength) {																						//if on time out...
		this.timeOutCounter++																																	//increment time out counter
		this.incHeadAway(this.justCollidedInto, this.maxTurnAng);
	} else  {																																											//else if not on time out
		this.incHeadFor(this.targetMC, this.maxTurnAng);																			//head for target
		//trace(this+" is not on time out anymore, so it's heading for: "+this.targetMC);
	}

}//checkPlayerCollisions()






























//ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc//Killing
function killPlayer(mark)
{
	trace("the player: "+mark+" is to be killed");
	mark.removeMovieClip();
}//killPlayer(mark)







} //EnemySeeker