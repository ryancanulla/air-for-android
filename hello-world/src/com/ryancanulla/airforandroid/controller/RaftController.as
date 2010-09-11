package com.ryancanulla.airforandroid.controller
{
    import com.ryancanulla.airforandroid.model.MainModel;
    import com.ryancanulla.airforandroid.view.Raft;

    import flash.display.Sprite;
    import flash.events.AccelerometerEvent;
    import flash.events.Event;
    import flash.sensors.Accelerometer;

    public class RaftController extends Sprite
    {
        private var _view:Sprite;
        private var accelerometerData:Accelerometer;
        private var model:MainModel = MainModel.getInstance();
        private var raft:Raft;
        private var xspeed:Number;
        private var yspeed:Number;
        private var gravity:Number;
        private var friction:Number;
        private var _accelerationX:Number;
        private var _accelerationY:Number;

        public function RaftController(e:Sprite) {
            _view = e;
            init();
        }

        private function init():void {
            friction = -.6;
            xspeed = 0;
            yspeed = 0;

            createChildren();
        }

        private function createChildren():void {
            raft = new Raft();
            _view.addChild(raft);
        }

        public function updateLayout():void {

            for (var i:uint = 0; i < model.swimmersClan.length; i++) {
                var swimmer:Sprite = model.swimmersClan[i];

                if (raft.hitTestObject(swimmer)) {
                    _view.removeChild(swimmer);
                    model.swimmersClan.removeItemAt(i);
                }
            }

            if (raft.x < 0) {
                raft.x = 0;
                xspeed *= friction;
            }
            else if (raft.x > 480 - raft.width) {
                raft.x = 480 - raft.width - 1;
                xspeed *= friction;
            }
            else {
                raft.x += xspeed;
            }

            if (raft.y < 0) {
                raft.y = 0;
                yspeed *= friction;
            }
            else if (raft.y > 800 - raft.width) {
                raft.y = 800 - raft.width - 1;
                yspeed *= friction;
            }
            else {
                raft.y += yspeed;
            }
        }

        private function updateAccelerometer():void {
            xspeed -= _accelerationX * 4;
            yspeed += _accelerationY * 4;
        }

        public function setAcceleration(accX:Number, accY:Number):void {
            _accelerationX = accX;
            _accelerationY = accY;

            updateAccelerometer();
        }
    }
}
