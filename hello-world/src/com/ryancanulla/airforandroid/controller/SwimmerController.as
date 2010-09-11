package com.ryancanulla.airforandroid.controller
{
    import com.ryancanulla.airforandroid.model.MainModel;
    import com.ryancanulla.airforandroid.view.Swimmer;

    import flash.display.Sprite;
    import flash.display.Stage;
    import flash.events.Event;

    import mx.collections.ArrayCollection;

    public class SwimmerController extends Sprite
    {
        private var swimmer:Swimmer;
        private var model:MainModel = MainModel.getInstance();
        private var _view:Sprite;
        private var _stage:Stage;

        public function SwimmerController(e:Sprite) {
            _view = e;
            init();
        }

        private function init():void {
            createChildren();
        }

        private function createChildren():void {
            for (var i:uint = 0; i < model.totalSwimmers; i++) {
                swimmer = new Swimmer();
                swimmer.x = 400 * Math.random();
                swimmer.y = 800 * Math.random();
                _view.addChild(swimmer);
                model.swimmersClan.addItem(swimmer);
            }

        }

        public function updateLayout():void {

            for (var j:uint = 0; j < model.swimmersClan.length; j++) {
                var swimmer:Swimmer = _view.getChildAt(j) as Swimmer;

                swimmer.x += swimmer.speed;

                if (swimmer.x > 400 + swimmer.width) {
                    swimmer.x = 0 - swimmer.width;
                    swimmer.y = Math.random() * 800;
                }
            }
        }

    }
}
