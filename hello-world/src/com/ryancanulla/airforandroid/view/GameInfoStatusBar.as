package com.ryancanulla.airforandroid.view
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class GameInfoStatusBar extends Sprite
	{
		private var background:Sprite;
		private var timeLeft:TextField;
		private var format:TextFormat;
		public function GameInfoStatusBar()
		{
			super();
			init();
		}

		private function init():void {
			//createBackground();
			createTimeDisplay();
		}
		private function createBackground():void {
			background = new Sprite();
			background.graphics.beginFill(0x000000,.75);
			background.graphics.drawRect(0,0,50,800);
			background.graphics.endFill();
			addChild(background);
		}

		private function createTimeDisplay():void {
			format = new TextFormat("DroidSans-Bold.ttf","40");
			format.color = 0xffffff;
			timeLeft = new TextField();
			timeLeft.setTextFormat(format);
			timeLeft.text = "00:29";
			timeLeft.x = 5;
			timeLeft.y = 5;
			//timeLeft.rotation = 45;
			addChild(timeLeft);

		}
	}
}