package com.ryancanulla.airforandroid.model
{
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Timer;

	public class MainModel extends EventDispatcher
	{
		private var _totalSwimmers:Number;
		private var _round:Number;
		private var _time:Number;
		private var _stage:Stage;
		private static var _instance:MainModel;
		public function MainModel(enforcer:SingletonEnforcer)
		{
			super();
			init();
		}

		public static function getInstance():MainModel {
			if (MainModel._instance == null) {
				MainModel._instance = new MainModel(new SingletonEnforcer());
			}
			return MainModel._instance;
		}


		private function init():void {
			_totalSwimmers = 5;
			_round = 1;
			//_time = new Timer();
		}

		public function get totalSwimmers():Number
		{
			return _totalSwimmers;
		}

		public function set totalSwimmers(value:Number):void
		{
			_totalSwimmers = value;
		}

		public function get referenceToStage():Stage
		{
			return _stage;
		}

		public function set referenceToStage(value:Stage):void
		{
			_stage = value;
		}

	}

}
class SingletonEnforcer
{
}