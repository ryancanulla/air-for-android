package com.ryancanulla.airforandroid.controller
{
	import com.ryancanulla.airforandroid.view.Raft;

	import flash.display.Sprite;
	import flash.events.AccelerometerEvent;
	import flash.events.Event;
	import flash.sensors.Accelerometer;

	public class RaftController extends Sprite
	{
		private var _view:Sprite;
		private var accelerometerData:Accelerometer;

		private var raft:Raft;
		private var xspeed:Number;
		private var yspeed:Number;
		private var gravity:Number;
		private var friction:Number;

		public function RaftController(e:Sprite)
		{
			_view = e;
			init();
		}
		private function init():void {
			createRaft();

			/*if (Accelerometer.isSupported)
			{
				trace("accelerometer supported");
				accelerometerData = new Accelerometer();
				accelerometerData.addEventListener(AccelerometerEvent.UPDATE, updateAccelerometerData);
			}*/
		}

		private function createRaft():void {
			raft = new Raft();
			raft.x = 100;
			raft.y = 100;
			_view.addChild(raft);
		}

		private function updateLayout():void {
			var newX:Number = raft.x + xspeed;
			var newY:Number = raft.y + yspeed;


			/*for (var i:uint=0; i < swimmersClan.length; i++) {
				var swimmer:Sprite = swimmersClan[i];
				trace("swimmer");
				if (raft.hitTestObject(swimmer)) {
					trace("hit");
					removeChild(swimmer);

					swimmersClan.removeItemAt(i);
				}
			}*/


			if (raft.x < 0)
			{
				raft.x = 0;
				trace(raft.x);
				xspeed *= friction;
			}
			else if (raft.x > stage.fullScreenWidth - raft.width)
			{
				raft.x = stage.fullScreenWidth - raft.width - 1;
				xspeed *= friction;
			}
			else
			{
				raft.x += xspeed;
			}

			if (raft.y < 0)
			{
				raft.y = 0;
				yspeed *= friction;
			}
			else if (raft.y > stage.fullScreenHeight - raft.width)
			{
				raft.y = stage.fullScreenHeight - raft.width - 1;
				yspeed *= friction;
			}
			else
			{
				raft.y += yspeed;
			}
		}

		private function updateAccelerometerData(e:AccelerometerEvent):void {
			xspeed -= e.accelerationX * 1.25;
			yspeed += e.accelerationY * 1.25;

			//updateLayout();
		}
	}
}