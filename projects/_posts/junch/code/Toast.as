// The Toast class is intended for use with attachMovie, registerClass,
//  a movie clip,  and a subclass defining onEnterFrame

class Toast extends MovieClip {
	// static counter for Toast class
	public static var count: Number = 0;	
	// static constant for trig functions
	public static var DEGRAD: Number = Math.PI/180;  //conversion from degrees to radians
	
	// custom properties for Toast class
	private var _ToastX: Number = null;
	private var _ToastY: Number = null;
	private var speed: Number = null;
	private	var turnAng: Number;
	
	// constructor for Toast class
	function Toast( ) {
		this._ToastX = this._x;
		this._ToastY = this._y;
		count++ ;
	} // Toast
	
	//------------------------Toast Methods-------------------------------
	//commands that set the direction and rotation of the Toast
	
	//turnTo   tells the Toast to turn to an absolute angle based on 
	//a  polar coordinate system -  0 degrees points Toast to the right
	public function turnTo(ang: Number): Void {
		this._rotation = ang;
	} //turnTo
	
	//headFor tells the Toast to adjust its rotation so that it is facing
	//the object referenced by mc
	public function headFor(mc: MovieClip): Void {
		var dY: Number = this._y	- mc._y;
		var dX: Number = mc._x	- this._x;
		this._rotation = 360 			- Math.atan2(dY,dX)/Toast.DEGRAD
	} //headFor
	
	//headAway tells the Toast to adjust its rotation so that it is facing AWAY FROM
	//the object referenced by mc
	public function headAway(mc: MovieClip): Void {
		var dY: Number = this._ToastY 	- mc._ToastY;
		var dX: Number = mc._ToastX	- this._ToastX;
		this._rotation = 180 - (360 - Math.atan2(dY,dX)/Toast.DEGRAD)
	} //headAway

	//turnLeft   tells the tutle to turn ang degrees counterclockwise
	public function turnLeft(ang: Number): Void {
		this._rotation -= ang;
	} //turnLeft
	
	//turnRight   tells the tutle to turn ang degrees counterclockwise
	public function turnRight(ang: Number): Void {
		this._rotation += ang;
	} //turnRight

	//turnEither   tells the tutle to turn ang degrees in either direction
	public function turnEither(ang: Number): Void {
		this._rotation += turnAng;
	} //turnRight
	
	//commands that change the location of the Toast
	
	//fwd - tells the Toast to advance along its current heading
	//distance moved depends on the speed property
	public function fwd( ): Void {
		var heading: Number = this._rotation * Toast.DEGRAD;
		this._x = this._ToastX += this.speed * Math.cos(heading);
		this._y = this._ToastY += this.speed * Math.sin(heading);
	} //fwd
	
	//moveAbs - transports the Toast to a new position x,y
	public function moveAbs(x: Number, y: Number): Void {
		this._x = this._ToastX = x;
		this._y = this._ToastY = y;
	} //moveAbs
	
	//distance - returns the distance between the Toast and mc, a movieClip
	 function distance(mc: MovieClip): Number {
		var dX = this._x - mc._x;
		var dY = this._y - mc._y;
		return Math.sqrt(dX*dX + dY*dY)
	} //distance









// incHeadfor is an incremental version of headFor. It will
	// turntoward the target by the amount it would take to face
	// it in as many frames as you indicate with the second parameter
	// which could be a different amount each time you call it
	public function incHeadFor(mc: MovieClip, frames): Void {
		var heading = this._rotation;
		this.headFor(mc);
		var ang = this._rotation - heading;
		if (ang > 180)
		{
				ang = ang -360;
		}
		if (ang < -180)
		{
				ang = ang + 360;
		}
		this._rotation = heading + ang/frames;
	} //incHeadFor
	
	// incHeadfor is an incremental version of headFor. It will
	// turntoward the target by the amount it would take to face
	// it in as many frames as you indicate with the second parameter
	// which could be a different amount each time you call it
	public function incHeadAway(mc: MovieClip, frames): Void {
		var heading = this._rotation;
		this.headFor(mc);
		this.turnLeft(180);
		var ang = this._rotation - heading;
		if (ang > 180)
		{
				ang = ang -360;
		}
		if (ang < -180)
		{
				ang = ang + 360;
		}
		this._rotation = heading + ang/frames;
	} //incHeadFor

















} //Toast class

