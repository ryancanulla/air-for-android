package com.ryancanulla.airforandroid.view
{
    import com.ryancanulla.airforandroid.model.MainModel;
    import com.ryancanulla.airforandroid.utils.AssetsManager;

    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.geom.Matrix;
    import flash.text.TextField;
    import flash.text.TextFormat;

    public class StatusBar extends Sprite
    {
        private var bg:Sprite;
        private var model:MainModel = MainModel.getInstance();
        private var timer:TextField;
        private var score:TextField;
        private var format:TextFormat;

        //[Embed(source="/../assets/fonts/DroidSans-Bold.ttf", fontFamily="DroidSans-Bold", mimeType="application/x-font-truetype")]
        // private var droidBoldString:String;

        public function StatusBar() {
            super();
            init();
        }

        private function init():void {
            format = new TextFormat();
            format.color = 0xFFB03B;

            createChildren();
        }

        private function createChildren():void {
            bg = new Sprite();
            bg.graphics.beginFill(0x000000, .8);
            bg.graphics.drawRect(0, 0, 50, 800);
            bg.graphics.endFill();
            addChild(bg);

            timer = new TextField();
            addChild(timer);

            updateLayout();
            updateProperties();
        }

        private function updateLayout():void {
            bg.x = 0;
            bg.y = 0;

            timer.x = 0;
            timer.y = 125;
            timer.width = 300;
            timer.rotation = 270;

        }

        private function updateProperties():void {
            timer.text = "00:40";
            format.font = "DroidSans-Bold";
            format.size = 36;
            timer.cacheAsBitmap = true;
            timer.cacheAsBitmapMatrix = new Matrix();
            //timer.embedFonts = true;
            timer.setTextFormat(format);
        }
    }
}
