package com.ryancanulla.airforandroid.view
{
    import flash.display.Bitmap;
    import flash.display.Sprite;

    public class Raft extends Sprite
    {
        private var raftObject:Sprite;
        //[Embed(source="/../assets/SafetyRaft.png")]
        //private var safetyRaft:Class;
        [Embed(source="/../assets/SafetyRaft.swf")]
        private var safetyRaft:Class;

        public function Raft() {
            super();
            init();
        }

        private function init():void {
            draw();
        }

        private function draw():void {
            raftObject = new safetyRaft();
            raftObject.scaleX = 1.75;
            raftObject.scaleY = 1.75;
            raftObject.x = 0;
            raftObject.y = 0;
            addChild(raftObject);
        }
    }
}
