package
{
	import flash.display.Sprite;
	import flash.events.AccelerometerEvent;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.sensors.Accelerometer;
	import flash.ui.Keyboard;

	public class ShipSim extends Sprite
	{
		private var ship:Ship;
		private var vr:Number = 0;
		private var thrust:Number = 0;
		private var vx:Number = 0;
		private var vy:Number = 0;
		private var accelerometerData:Accelerometer;

		public function ShipSim()
		{
			init();
		}
		private function init():void
		{
			ship = new Ship();
			ship.scaleX = 3;
			ship.scaleY = 3;
			ship.x = 100;
			ship.y = 200;
			//ship.x = 100;
			//ship.y = 100;
			ship.draw(true);
			addChild(ship);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			//stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			//stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);

			if (Accelerometer.isSupported)
			{
				trace("accelerometer supported");
				accelerometerData = new Accelerometer();
				accelerometerData.addEventListener(AccelerometerEvent.UPDATE, updateAccelerometerData);
			}
		}

		private function onKeyUp(event:KeyboardEvent):void
		{
			vr = 0;
			thrust = 0;
			ship.draw(false);
		}
		private function updateAccelerometerData(e:AccelerometerEvent):void {
			vx -= e.accelerationX * .08;
			vy += e.accelerationY * .08;
			vr += e.accelerationZ * .08;
		}


		private function onEnterFrame(event:Event):void
		{
			//ship.rotation += vr;
			var angle:Number = ship.rotation * Math.PI / 180;
			var ax:Number = Math.cos(angle) * thrust;
			var ay:Number = Math.sin(angle) * thrust;
			vx += ax;
			vy += ay;
			ship.x += vx;
			ship.y += vy;

			if (stage) {

				if(ship.x < 0 - ship.width / 2){
					ship.x = stage.stageWidth + ship.width / 2;
				}

				} else if (ship.x > stage.stageWidth - ship.width / 2) {
					ship.x = 0 - ship.width / 2;
				}

				/*else if () {

				}

				else if () {

				}*/
		}

	}
}







