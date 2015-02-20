class Shadow extends MovieClip
{ 

private var ground;
private var master;


function Shadow() //constructor function
{
	trace(".");
	trace("Shadow() called to create "+this);
	trace("at this depth: ["+_parent+": "+_parent.getDepth()+"]"+" . ["+this+": "+this.getDepth()+"]");
	trace(".");
}
	
function onEnterFrame()
{
	this.gravity();
	this.followMaster();
}



function setMaster(newMaster)
{
	this.master = newMaster;
	trace("master is: "+this.master);
}



function setGround(newGround)
{
	this.ground = newGround;
	trace("ground is: "+this.ground);
}



function gravity()
{
	if (this._y != (this.ground._y - 37)) this._y =  (this.ground._y - 37);

}//gravity()



function followMaster()
{
	this._x = this.master._x;
}
	



} // close Ground class