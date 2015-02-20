class MarbleContents extends Toast
{ 



private var xVelocity																:Number = 0;
private var rotation																	:Number = 0;
private var radius																		:Number = 36;								//the radius of the circle
private var diameter																	:Number = 0;
private var circumference														:Number = 0;									//determines the circumference of the circle
																																										//our MarbleContents should rotate 360 degrees per this distance


function MarbleContents() //constructor function
{
	trace("MarbleContents() called to create "+this);
	diameter								= radius * 2;
	circumference					= diameter * Math.PI;
}
	


function onEnterFrame()
{
	this.allowRotation();
	//trace("class MarbleContents reads xVelocity as: "+xVelocity);

}



function allowRotation()
{
	var rotationMultiplier				:Number = 0;
	var degreesToRotate					:Number = 0;


	rotationMultiplier = (this._parent.speed / this.circumference)														//the portion of the circumference that was travelled

	degreesToRotate = (360 * rotationMultiplier);																				//assigning the amount of rotation
	//trace("rotationMultipleir: "+rotationMultiplier+" degreesToRotate: "+degreesToRotate);

	this.turnRight(degreesToRotate);
}



} // close MarbleContents class