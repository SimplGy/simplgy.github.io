class Butter extends Toast
{ 





private var isPunching																		:Boolean = false;
private var punchPower																	:Number = 90;							//the punching velocity
private var punchSpeed																	:Number = 0;								//speed of punch
private var punchResistance															:Number = 50;								//slow down rate of punch
private var targetMc																			:MovieClip = null;//target movie clip to point towards











function Butter() //constructor function
{
	trace(".");
	trace("Butter() called to create "+this);
	trace("at this depth: ["+_parent+": "+_parent.getDepth()+"]"+" . ["+this+": "+this.getDepth()+"]");
	trace(".");
}//Butter()









function setTarget(newTarg: MovieClip)
{
	trace(this+" has been told to target: "+newTarg);
	this.targetMc = newTarg;
}//setTarget()

function getTarget()
{
	return(this.targetMc);
}//getTarget()











function onEnterFrame()
{
	this.pointAtTarget(this.targetMc);	
	this.allowPunch();
}//onEnterFrame()

















//==============================================================rotation
function pointAtTarget(mc: MovieClip): Void
{
		var dY: Number 			= this._parent._y	- mc._y;
		var dX: Number 			= mc._x	- this._parent._x;
		this._rotation 				= 360 - Math.atan2(dY,dX)/Toast.DEGRAD
}//pointAtTarget()





//==============================================================punching check and movement
function allowPunch()
{

//	trace (".");
//	trace ("this._x: "+this._x);
//	trace ("this.isPunching: "+this.isPunching);
//	trace ("this.punchPower: "+this.punchPower);
//	trace ("this.punchSpeed: "+this.punchSpeed);
//	trace ("this.punchResistance: "+this.punchResistance);
//	trace (".");	

	var tempX = this["mcButterStick"]._x + this.punchSpeed;														//temp = current X plus the speed
	
	if (tempX > 2)																																				// if temp is bigger than 2
	{
		this["mcButterStick"]._x = tempX;																									// Then set the position of this clip to the temp positon
		this.punchSpeed -= this.punchResistance;																					// Add the effect of resistance
		this.isPunching = true;																															// Is jumping
	}//if X > 2
	else																																									//otherwise it's not in the middle of a punch
	{
		this["mcButterStick"]._x = 0;																												//set x to zero
		this.punchSpeed = 0;																																// Set speed to zero
		this.isPunching = false;
	}//else
}//allowPunch()





																									









//==============================================================the actual punch
function punch()
{
	//trace("punch() was called");

	if (!this.isPunching)
	{
		this.isPunching = true;																														//player is currently punching
		this.punchSpeed += this.punchPower;																						// initial velocity of punch
	}//if NOT punching
}//punch()


} // close Butter class