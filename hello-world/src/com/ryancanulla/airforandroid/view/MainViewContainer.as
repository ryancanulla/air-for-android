package com.ryancanulla.airforandroid.view
{
	import com.ryancanulla.airforandroid.controller.MainViewController;
	import com.ryancanulla.airforandroid.controller.RaftController;
	import com.ryancanulla.airforandroid.controller.SwimmerController;

	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;

	import mx.collections.ArrayCollection;

	public class MainViewContainer extends Sprite
	{
		private var controller:MainViewController;
		private var swimmerController:SwimmerController;
		private var raftController:RaftController;
		private var statusBar:GameInfoStatusBar;
		private var timeDisplay:TextField;

		public function MainViewContainer()
		{
			super();
			init();
		}

		private function init():void {
			controller = new MainViewController(this);
			swimmerController = new SwimmerController(this);
			raftController = new RaftController(this);

			statusBar = new GameInfoStatusBar();
			addChild(statusBar);
		}
	}
}