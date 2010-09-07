package com.ryancanulla.airforandroid.view
{
	import flash.display.Bitmap;
	import flash.display.Sprite;

	public class Raft extends Sprite
	{
		private var raftObject:Bitmap;
		[Embed(source="/../assets/SafetyRaft.png")]
		private var safetyRaft:Class;
		public function Raft()
		{
			super();
			init();
		}
		private function init():void {
			draw();
		}
		private function draw():void {
			raftObject = new safetyRaft();
			raftObject.scaleX = .75;
			raftObject.scaleY = .75;
			raftObject.x = 100;
			raftObject.y = 100;
			addChild(raftObject);
		}
	}
}