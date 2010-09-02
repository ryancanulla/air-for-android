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
		private var ball:Shape;
		private var accelerometerData:Accelerometer;
		private var xspeed:Number;
		private var yspeed:Number;
		private var gravity:Number;
		private var friction:Number
		private const RADIUS:Number = 50;
		public function HelloWorld()
		{
			trace("hello world");
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;

			friction = .9;
			xspeed = 0;
			yspeed = 0;

			if (Accelerometer.isSupported)
			{
				trace("accelerometer supported");
				accelerometerData = new Accelerometer();
				accelerometerData.addEventListener(AccelerometerEvent.UPDATE, updateAccelerometerData);
			}

			ball = new Shape();
			ball.graphics.beginFill(0x046380,1);
			ball.graphics.drawCircle(100,100,RADIUS);
			ball.graphics.endFill();
			addChild(ball);

			addEventListener(Event.ENTER_FRAME, onEnterFrame);


		}

		private function onEnterFrame(e:Event):void {
			var newX:Number = ball.x + xspeed;
			var newY:Number = ball.y + yspeed;
			if (ball.x < -50)
			{
				ball.x = -50;
				xspeed *= friction;
			}
			else if (ball.x > stage.stageWidth - 150)
			{
				ball.x = stage.stageWidth - 150;
				xspeed *= -.5;
			}
			else
			{
				ball.x += xspeed;
			}

			if (ball.y < -50)
			{
				ball.y = -50;
				yspeed *= -.5;;
			}
			else if (ball.y > stage.stageHeight - 150)
			{
				ball.y = stage.stageHeight - 150;
				yspeed *= -.5;
			}
			else
			{
				ball.y += yspeed;
			}
		}

		private function updateAccelerometerData(e:AccelerometerEvent):void {
			xspeed -= e.accelerationX * 4;
			yspeed += e.accelerationY * 4;
		}
	}
}

