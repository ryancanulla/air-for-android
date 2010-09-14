package com.ryancanulla.airforandroid.utils
{
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.text.TextField;
    import flash.utils.Timer;

    public class FPSTimer extends TextField
    {
        private var fps:int = new int();
        private var t:Timer = new Timer(1000);

        public function FPSTimer() {
            super();
            init();
        }

        private function init():void {
            t.start();
            addEventListener(Event.ENTER_FRAME, onEnterFrame);
            t.addEventListener(TimerEvent.TIMER, onTimer);
        }

        private function onEnterFrame(e:Event):void {
            fps++;
        }

        private function onTimer(e:TimerEvent):void {
            text = "fps: " + String(fps);
            fps = 0;
        }
    }
}
