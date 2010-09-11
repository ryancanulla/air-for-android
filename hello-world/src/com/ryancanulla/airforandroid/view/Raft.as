package com.ryancanulla.airforandroid.view
{
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.geom.Matrix;

    public class Raft extends Sprite
    {
        private var raftObject:Bitmap;
        [Embed(source="/../assets/SafetyRaft.png")]
        private var safetyRaft:Class;

        //[Embed(source="/../assets/SafetyRaft.swf")]
        //private var safetyRaft:Class;

        public function Raft() {
            super();
            init();
        }

        private function init():void {
            draw();
        }

        private function draw():void {
            raftObject = new safetyRaft();
            raftObject.cacheAsBitmapMatrix = new Matrix;
            raftObject.cacheAsBitmap = true;
            raftObject.x = 0;
            raftObject.y = 0;
            addChild(raftObject);
        }
    }
}
