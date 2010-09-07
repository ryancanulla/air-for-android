package com.ryancanulla.airforandroid.utils
{
	import flash.display.Sprite;
	import flash.events.AccelerometerEvent;
	import flash.sensors.Accelerometer;
	import flash.text.TextField;
	import flash.text.TextFormat;

	import spark.components.TextInput;

	public class AccelerometerDataLayer extends Sprite
	{

		private var accelerometerX:TextField;
		private var accelerometerY:TextField;
		private var accelerometerZ:TextField;
		private var accelerometerData:Accelerometer;
		private var format:TextFormat;
		public function AccelerometerDataLayer(){
			super();
			init();
		}
		private function init():void{
			format = new TextFormat("DroidSans-Bold.ttf","40");

			accelerometerX = new TextField;
			accelerometerX.text = "NAN";
			accelerometerX.width = 400;
			accelerometerX.x = 100;
			accelerometerX.y = 100;
			accelerometerX.setTextFormat(format);
			addChild(accelerometerX);

			accelerometerY = new TextField;
			accelerometerY.width = 400;
			accelerometerY.text = "NAN";
			accelerometerY.x = 100;
			accelerometerY.y = 150;
			accelerometerY.setTextFormat(format);
			addChild(accelerometerY);

			accelerometerZ = new TextField;
			accelerometerZ.width = 400;
			accelerometerZ.text = "NAN";
			accelerometerZ.x = 100;
			accelerometerZ.y = 200;
			accelerometerZ.setTextFormat(format);
			addChild(accelerometerZ);

			if (Accelerometer.isSupported)
			{
				trace("accelerometer supported");
				accelerometerData = new Accelerometer();
				accelerometerData.addEventListener(AccelerometerEvent.UPDATE, updateAccelerometerData);
			}

		}

		private function updateAccelerometerData(e:AccelerometerEvent):void {
			accelerometerX.text = "x: " + e.accelerationX.toPrecision(6);
			accelerometerY.text = "y: " + e.accelerationY.toPrecision(6);
			accelerometerZ.text = "Z: " + e.accelerationZ.toPrecision(6);

			accelerometerX.setTextFormat(format);
			accelerometerY.setTextFormat(format);
			accelerometerZ.setTextFormat(format);
		}


	}
}