package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.AccelerometerEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.sensors.Accelerometer;
	import flash.text.TextField;

	[SWF(backgroundColor="#E6E2AF", frameRate="60")]
	public class HelloWorld extends Sprite
	{
		private var shape:Shape;
		private var xspeed:int;
		private var yspeed:int;
		public function HelloWorld()
		{
			trace("hello world");
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;

			xspeed = 5;
			yspeed = 5;


			shape = new Shape();
			shape.graphics.beginFill(0x046380,1);
			shape.graphics.drawCircle(100,100,50);
			shape.graphics.endFill();
			addChild(shape);

			addEventListener(MouseEvent.CLICK, moveCircle);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);

			//var accelerometer:Accelerometer = new Accelerometer();
			//accelerometer.addEventListener(AccelerometerEvent.UPDATE, onUpdate);

		}

		private function onUpdate(e:AccelerometerEvent):void {

		}

		private function moveCircle():void{
			trace("move circle");
			shape.x += mouseX;
			shape.y += mouseY;
		}

		private function onEnterFrame(e:Event):void {
			if (shape.x < 0){
				xspeed = 5
				trace("shapeX:" + shape.x);
			}
			if (shape.x > stage.stageWidth){
				xspeed = -5;
				trace("shapeX:" + shape.x);
			}
			if (shape.y > stage.stageHeight){
				yspeed = -5;
				trace("shapeY:" + shape.y);
			}
			if (shape.y < 0){
				yspeed = 5;
				trace("shapeY:" + shape.y);
			}
			shape.x += xspeed;
			shape.y += yspeed;
			//trace("x speed: " + xspeed);
			//trace("y speed: " + yspeed);
		}
	}
}