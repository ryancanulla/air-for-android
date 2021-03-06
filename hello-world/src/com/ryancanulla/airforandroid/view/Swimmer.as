package com.ryancanulla.airforandroid.view
{
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.geom.Matrix;

    public class Swimmer extends Sprite
    {
        private var freak:Bitmap;
        [Embed(source="/../assets/swimmer.png")]
        private var drowningMan:Class;
        private var _speed:Number;

        public function Swimmer() {
            super();
            init();
        }

        public function get speed():Number {
            return _speed;
        }

        private function init():void {
            _speed = Math.random() * 5;
            createSwimmer();
        }

        private function createSwimmer():void {
            freak = new drowningMan();
            freak.x = 0;
            freak.y = 0;
            freak.cacheAsBitmapMatrix = new Matrix;
            freak.cacheAsBitmap = true;
            addChild(freak);
        }
    }
}
