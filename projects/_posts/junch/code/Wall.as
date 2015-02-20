class Wall extends MovieClip
{ 

private var wallType												:String = "unknown";


function Wall() //constructor function
{
	trace(".");
	trace("Wall() called to create "+this);
	trace("at this depth: ["+_parent+": "+_parent.getDepth()+"]"+" . ["+this+": "+this.getDepth()+"]");
	trace(".");

	this.checkType()
}
	


function setType(newType: String) //assign new type of wall
{
	trace("type set to: "+newType);
	this.wallType = newType;
	this.checkType();
}//setType()



function getType() //return the wall type
{
	return(wallType);
}//getType()




function checkType() //test for what type of wall this is, and position it accordingly
{
	if(wallType == "leftWall")
	{
		this._x = 0;
	}
	if(wallType == "rightWall")
	{
		this._x =	(Stage.width - this._width);			
	}
	if(wallType == "unkown")
	{
		trace("wall type not properly assigned");
	}
}//checkType()


} // close Ground class