class DirectionIndicator extends MovieClip
{ 



private var puncher																				:MovieClip = null;										//this is the movie clip that does the punching


function DirectionIndicator() //constructor function
{
	trace("DirectionIndicator() called to create "+this+" whose parent is: "+this._parent);
	this.makePuncher();
}
	


function onEnterFrame()
{
	this.headForCoordinates(_root._xmouse, _root._ymouse);	
}



function headForCoordinates(xHeading:Number, yHeading:Number): Void 
{
	//trace("xmouse: "+xHeading+" tmouse: "+yHeading)
	//trace("this._parent._x: "+this._parent._x+" this._parent._y: "+this._parent._y)
	var dY: Number = this._parent._y 	- yHeading;																									//distance between player Y and heading Y		
	var dX: Number = xHeading	- this._parent._x;																								//distance between player X and heading X
	this._rotation = 360 - Math.atan2(dY,dX)/Toast.DEGRAD																			//direction in degrees to point towards
} //headForCoordinates()



function makePuncher()																																					//create the puncher movie clip
{
	this.puncher = this.attachMovie("mcPuncher", "mcPuncher", this.getNextHighestDepth());		//attach it to this, so that they rotate together
}


} // close DirectionIndicator class