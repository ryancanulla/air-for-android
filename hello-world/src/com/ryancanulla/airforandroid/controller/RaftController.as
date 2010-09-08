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

        public function RaftController(e:Sprite) {
            _view = e;
            init();
        }

        private function init():void {
            createRaft();

            friction = -.6;
            xspeed = 0;
            yspeed = 0;

            if (Accelerometer.isSupported) {
                trace("accelerometer supported");
                accelerometerData = new Accelerometer();
                accelerometerData.addEventListener(AccelerometerEvent.UPDATE, updateAccelerometerData);
            }

            addEventListener(Event.ENTER_FRAME, updateLayout);
        }

        private function createRaft():void {
            raft = new Raft();
            raft.x = 100;
            raft.y = 100;
            _view.addChild(raft);
        }

        private function updateLayout(e:Event = null):void {

            /*for (var i:uint = 0; i < model.swimmersClan.length; i++) {
               var swimmer:Sprite = model.swimmersClan[i];
               trace("swimmer");

               if (raft.hitTestObject(swimmer)) {
               trace("hit");
               removeChild(swimmer);

               model.swimmersClan.removeItemAt(i);
               }
             }*/

            if (raft.x < 0) {
                raft.x = 0;
                xspeed *= friction;
            }
            else if (raft.x > 400 + raft.width) {
                raft.x = 400 + raft.width - 1;
                xspeed *= friction;
            }
            else {
                raft.x += xspeed;
            }

            if (raft.y < 0) {
                raft.y = 0;
                yspeed *= friction;
            }
            else if (raft.y > 800 + raft.width) {
                raft.y = 800 - raft.width - 1;
                yspeed *= friction;
            }
            else {
                raft.y += yspeed;
            }
        }

        private function updateAccelerometerData(e:AccelerometerEvent):void {
            xspeed -= e.accelerationX * 4;
            yspeed += e.accelerationY * 4;
        }
    }
}
