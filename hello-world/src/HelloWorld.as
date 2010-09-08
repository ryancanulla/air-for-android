package
{
    import com.ryancanulla.airforandroid.model.MainModel;
    import com.ryancanulla.airforandroid.utils.AccelerometerDataLayer;
    import com.ryancanulla.airforandroid.view.MainViewContainer;

    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageAspectRatio;
    import flash.display.StageOrientation;
    import flash.display.StageScaleMode;
    import flash.events.AccelerometerEvent;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.TouchEvent;
    import flash.sensors.Accelerometer;
    import flash.system.TouchscreenType;
    import flash.text.TextField;
    import flash.ui.Multitouch;
    import flash.ui.MultitouchInputMode;
    import flash.utils.Dictionary;

    import mx.collections.ArrayCollection;

    [SWF(backgroundColor="#0072BB", frameRate="60")]
    public class HelloWorld extends Sprite
    {

        private var raft:Sprite;
        private var model:MainModel = MainModel.getInstance();

        private var totalSwimmers:Number = 10;
        private var mainView:MainViewContainer;

        public function HelloWorld() {

            Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
            trace("hello world");
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;

            model.referenceToStage = this.stage;

            mainView = new MainViewContainer();
            addChild(mainView);

        /*friction = -.6;
           xspeed = 0;
           yspeed = 0;

           radius = 25;
         */

        /*if(TouchEvent.TOUCH_TAP){
           trace("has touch support");
           raft.addEventListener(TouchEvent.TOUCH_BEGIN, grabRaft);
           raft.addEventListener(TouchEvent.TOUCH_MOVE, moveRaft);
           raft.addEventListener(TouchEvent.TOUCH_END, dropRaft);
           }
         */

             //addEventListener(Event.ENTER_FRAME, onEnterFrame);
             //addChild(ball);

        }

        /*private function onEnterFrame(e:Event):void {
           var newX:Number = raft.x + xspeed;
           var newY:Number = raft.y + yspeed;


           for (var i:uint=0; i < swimmersClan.length; i++) {
           var swimmer:Sprite = swimmersClan[i];
           trace("swimmer");
           if (raft.hitTestObject(swimmer)) {
           trace("hit");
           removeChild(swimmer);

           swimmersClan.removeItemAt(i);
           }
           }


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
         }*/

        private function grabRaft(e:TouchEvent):void {
            raft.startDrag();

            //removeEventListener(Event.ENTER_FRAME, onEnterFrame);
        }

        private function moveRaft(e:TouchEvent):void {
            trace("move event");
            //xspeed = xspeed * .65;
            //yspeed = yspeed * .65;
        }

        private function dropRaft(e:TouchEvent):void {
            //yspeed = 0;
            //xspeed = 0;
            raft.stopDrag();
            //addEventListener(Event.ENTER_FRAME, onEnterFrame);
        }
    }
}

