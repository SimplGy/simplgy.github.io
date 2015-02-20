class MouseCursor extends MovieClip
{


private var foeCount = 5;




function MouseCursor()
{
	trace(".");
	trace("MouseCursor() called to create "+this);
	trace("at this depth: ["+_parent+": "+_parent.getDepth()+"]"+" . ["+this+": "+this.getDepth()+"]");
	trace(".");
	Mouse.hide();
	this.startDrag(true);
}


function onRelease ()
{
	//trace(this+" sees that the mouse was pressed");
	_root.playerElements.mcPlayer.mcButter.punch();

}




} //class MouseCursor