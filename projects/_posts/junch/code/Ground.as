class Ground extends MovieClip
{ 

private var groundType 													:String = "Grass";									//the type of grass (to add support for other terrains)
private var groundInFront												:MovieClip = null;											//the image for the ground's foreground
private var groundInBack												:MovieClip = null;											//the image for the ground's background



function Ground() //constructor function
{
	//trace("Ground() is being created at this location: "+this._y+" = Stage.height:"+Stage.height+" - this._height:"+this._height);
	trace(".");
	trace("Ground() called to create "+this+" at this location: "+this._y+" = Stage.height:"+Stage.height+" - this._height:"+this._height);
	trace("at this depth: ["+_parent+": "+_parent.getDepth()+"]"+" . ["+this+": "+this.getDepth()+"]");
	trace(".");


	this._y = Stage.height - this._height;																										//put it on the bottom of the screen
	checkType();
}










function setType(newType: String)
{
	this.groundType = newType;
	this.checkType();
}

function getType()
{
	return(this.groundType);
}

//check the type of ground and assign behaviors accordingly	
function checkType ()																																								
{
	if (this.groundType == "Grass") {																																					//if type is grass...
		trace("the grass is greener");
		this.makeGround();																																										//build some grass
	}//if greenGrass

	else{
		trace("no valid ground type found for: "+this);
	}//else

}


//load the movie clip for the type of ground selected
function makeGround()
{
	//var highestUsedDepth:Number = 0;
	//highestUsedDepth = _root.getNextHighestDepth();
	//trace("the highestUsedDepth so far is :"+highestUsedDepth);

	trace(this+" is trying to gain some ground");



	//Background
	this.groundInBack = _root.backgroundElements.attachMovie("mcGroundBackGrass", "mcGroundBackGrass", _root.backgroundElements.getNextHighestDepth());
	positionGround(this.groundInBack);
	trace("the new background grass is: "+this.groundInBack+" it's at level: "+this.getDepth+"."+this.groundInBack.getDepth());

	//trace(".");
	//trace("makeGround() called to create "+this.groundInBack);
	//trace("at this depth: ["+this.groundInBack._parent+": "+this.groundInBack._parent.getDepth()+"]"+" . ["+this.groundInBack+": "+this.groundInBack.getDepth()+"]");
	//trace(".");



	//Foreground
	this.groundInFront = _root.foregroundElements.attachMovie("mcGroundFrontGrass", "mcGroundFrontGrass", _root.foregroundElements.getNextHighestDepth());//make pigwalkin sure it's in front
	positionGround(this.groundInFront);
	trace("the new forground grass is: "+this.groundInFront+" it's at level: "+this.getDepth+"."+this.groundInFront.getDepth());

	//trace(".");
	//trace("makeGround() called to create "+this.groundInFront);
	//trace("at this depth: ["+this.groundInFront._parent+": "+this.groundInFront._parent.getDepth()+"]"+" . ["+this.groundInFront+": "+this.groundInFront.getDepth()+"]");
	//trace(".");

}














function positionGround(toPos: MovieClip)
{
	toPos._y = (this._y + this._height) - toPos._height;																				//align the bottoms of the ground plane and the image
	toPos._x = this._x																																				//match the image's X to the ground plane's X
}//positionGroundImage()










} // close Ground class