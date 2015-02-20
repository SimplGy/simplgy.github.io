class Player extends Toast
{ 
//==============================================================properties of "TagPlayer"
//==============================================================overall
private var enemyCount:					Number; 			//Number of enemy players in the game
private var enemies:							Array;				//Array which references the enemies
private var terrain:								Array;				//reference to the location of terrain elements
private var playerState						:String = "Toast";//the state of the player


//==============================================================speed and movement
private var collisionTimer				:Number =0;//keeps track of how long ago the last collision was. almost fixes stuck in walls problem
private var yVelocity						:Number = 0;//Y axis velocity
private var isJumping						:Boolean = true;
private var groundAcceleration	:Number = .9//the incrementor used to determine add the the player's speed
private var	inAirAccelMultiplier	:Number = .8//reduces the amount of acceleration allowed while the player is in the air
private var frictionDeceleration	:Number = .1//the incrementor used to slow down the player when no button is pressed
private var contactShadow;
private var ground;														//the reference to the ground mc object

//==============================================================rotation
private var marbleContents;
private var marble;
private var directionIndicator;


//===============================================================These track the statistics of the player
private var timeAlive						:Number = 0; //the length of time, in frames, of the current life
private var longestTimeAlive		:Number = 0; //the length of time, in frames, of the longest single run as "alive"
private var totalTimeAlive				:Number = 0; //the length of time, in frames, of the total time being "alive"

private var killCount							:Number = 0; //number of bad guys killed during this life
private var highestKillCount			:Number = 0; //Most bad guys killed in one life
private var totalKillCount				:Number = 0; //Total bad guys killed

private var currentLife						:Number = 0; //the attempt that the player is currently on
private var TotalRespawns				:Number = 0; //total number of times the player has respawned this session

private var speed								:Number = 0; //speed for use in moving left and right
private var highestSpeed					:Number = 0;	//record highest speed attained



//==============================================================constants
private var limitSpeed						:Number = 20;//maxSpeed constant for use in limiting the speed of the player
private var gravityEffect					:Number = 1;//the amount of gravity that effects the player
private var jumpPower						:Number = 25;//the height and power of the player's jump
private var wallBounce						:Number = .8;//the multiplier applied to the player's speed when he hits a wall



//==============================================================keyboard controls
private var aKey									:Number = 65;//ASCII Key code for the A key
private var dKey									:Number = 68;

//==============================================================interface
private var mouseCursor					:MovieClip = null;



//==============================================================punching
private var butter								:MovieClip = null;




//TEMP!!!!
private var foeCount							:Number = 5;






//==============================================================methods to input and output with "TagPlayer"



function Player() //constructor function
{
	trace(".");
	trace("Player() called to create "+this);
	trace("at this depth: ["+_parent+": "+_parent.getDepth()+"]"+" . ["+this+": "+this.getDepth()+"]");
	trace(".");
	
	trace(this+" sees the terrain array as: "+this.terrain);
	this.ground = terrain[0];																																			//Set the ground plane constant
	trace(this+" sees the ground as: "+this.ground);

	this.makeMarble();	
	this.makeShadow();
	this.makeButter();
//	this.makePuncher();
//	this.replaceMouseCursor();																																	//replace the cursor with my own directional indicator
//	this.Marble

//	this.lightMarble = this.attachMovie("mcMarbleSpin", "mcMarbleSpin", this.getNextHighestDepth());
//	this.tagPlayerNames[1] = _root.attachMovie("mcTagPlayer","mcTagPlayer"+1, _root.getNextHighestDepth());
//	this.setState("atPlay");
}
	

//make the marble (shape and contents)
function makeMarble()
{
	this.marbleContents = this.attachMovie("mcMarbleContents", "mcMarbleContents", this.getNextHighestDepth());
	this.marble = this.attachMovie("mcMarble", "mcMarble", this.getNextHighestDepth());
}


//make the contact shadow
function makeShadow()
{
	this.contactShadow = this._parent.attachMovie("mcContactShadow", "mcPlayerShadow", this.getNextHighestDepth());
	this.contactShadow.setGround(terrain[0]);
	this.contactShadow.setMaster(this);
}


//make the stick of butter than punches, propells, and blocks
function makeButter()
{
	this.butter =  this.attachMovie("mcButter", "mcButter", this.getNextHighestDepth());	
	//trace(this+" is trying to set "+this.butter+"'s target to: "+this.mouseCursor);
	this.butter.setTarget(this.mouseCursor);
}//makeButter()



















function setState(newState: String) //Method to change the state of the player
{
	this.playerState = newState;
	trace(this+"'s State has been set to: "+this.playerState);
}
	


function getState() //returns the state of the player
{
	trace("the function getState() was called for "+this);
	return(this.playerState);
}












//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//Do Every Frame
function onEnterFrame()
{
	//checkState();
	this.gravity();
	this.allowMove();
	//allowJump();
	this.checkTerrainCollisions();
	if(Math.abs(this.speed) > 20) trace("speed: "+this.speed);
}




































//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	//Movement & acceleration
function allowMove()																																					//move left or right based on keyboard input
{																										
	 if (Key.isDown(this.aKey))	{																																//move left
		//trace("left pressed");
		if (this.isJumping)	{																																			//if the player is jumping...
			this.speed -= this.groundAcceleration * this.inAirAccelMultiplier;										//reduce acceleration rate
		} else {
			this.speed -= this.groundAcceleration;																									//else use nomal acceleration
		}//if isJumping
	}//if a Key is down

	if (Key.isDown(this.dKey))	{																																//move right
		//trace("right pressed");
		if (this.isJumping) {																																				//if the player is jumping...
			this.speed += this.groundAcceleration * this.inAirAccelMultiplier;										//reduce acceleration rate
		} else {
			this.speed += this.groundAcceleration;																								//else use nomal acceleration
		}//if isJumping
	}//if d Key was pressed

		
		
	//otherwise, if the player isn't trying to move,  slow down the marble		
	if (Math.abs(this.speed) < this.frictionDeceleration *.5)																		//if not moving significantly...
	{
		//trace("all stop");
		this.speed = 0;																																						//set speed to zero
	} else if (this.speed > 0)																																		//if moving right...
	{
		this.speed -= this.frictionDeceleration;																										//lower right velocity
	} else if (this.speed< 0)																																			//else if moving left ...
	{
		this.speed += this.frictionDeceleration;																									// lower left velocity
	} else
	{
		trace("not sure what's up with the speed");
	}//if speed < decel/2
							
	//trace("current x: "+this._x+" + |"+this.speed+"| checked against this: "+this.frictionDeceleration *.5);

	if (Math.abs  (this.speed) > this.limitSpeed) {//if higher than the speed limit...
		var multi = 1;	
		if (this.speed < 0) {																																					//if negative, make multiplier -1
			multi = -1;
		}//if speed < zero
		this.speed = this.limitSpeed * multi																												//speed = limitSpeed, controlled for negative directions	
	}//if speed > limit

														
	this._x += this.speed;																																				//increment xPos by determined speed
}//allowMove()





















//yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy//Gravity and Jumping
function gravity()
{
	if (Key.isDown(Key.SHIFT)) this.jump();																												//call the jump() function if the shift key is pressed

	this._y += this.yVelocity	;
	if (!this.marble.hitTest(this.ground))																														// if not on the ground
	{
		//trace("off the ground");
		this.yVelocity += this.gravityEffect;																													// Add the effect of gravity
		this.isJumping = true;																																				// Is jumping
	}//if marble hits ground
	else
	{
		//trace("on the ground");
		// Otherwise it will go too far...
		// Set the position so the bottom of the square is sittin on the ground
		this._y = (this.terrain[0]._y - 36);
		
		// Set speed to zero
		this.yVelocity = 0;
		
		// No longer jumping
		if (!Key.isDown(Key.SHIFT))this.isJumping = false;
	}//else
}// gravity()















function jump()
{
	//trace("Jump() called");

	if (!this.isJumping)
	{
		//trace ("jumping from yVelocity: "this.yVeleocity);
		this.isJumping = true;
		this.yVelocity -= this.jumpPower;	// Set the upward speed when you jump.
	}
}//jump()


















//ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc//Collisions
function checkTerrainCollisions()																														//stop player movement if terrain collision==true
{
	if (Math.abs(this.speed) > 0.400001)																											//if the object is moving, check for collisions
	{																																														//keeps track of how long ago a collision was made
		//trace("collisionTimer reads: "+collisionTimer);
		for (var i = 1; terrain[i] != undefined; i++)																								// loop while terrain variable is valid
		{
			//trace("CheckTerrainCollisions() is checking: "+terrain[i]);
			if(this.marble.hitTest(this.terrain[i]))																													//if player hits the terrain
			{
				//this.spawnIfNoneLeft();
				if (collisionTimer > 2)																																//if player has not just hit the same terrain
				{
					trace(this.terrain[i]+" hit");
					this.speed = -(this.speed * this.wallBounce);																											//reverse the direction, lower the speed
					collisionTimer = 0;																																	//reset collision timer
				}//collsiontimer check
			} //hit test
		}//terrain check loop
	collisionTimer++;	
	}//speed check
}//checkTerrainCollisions()













function spawnIfNoneLeft()
{
		if(_root.Manager.enemyManager.noFoes()) trace ("NO FOES LEFT");
//	{

		//_root.Manager.enemyManager.spawnSeekers(this.foeCount);
		this.foeCount = this.foeCount + 5;
		if (this.foeCount > 30) this.foeCount = 30;
//	}
}//spawnIfNoneLeft()






			





} //Player class