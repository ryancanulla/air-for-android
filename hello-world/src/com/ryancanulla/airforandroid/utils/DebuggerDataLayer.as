package com.ryancanulla.airforandroid.utils
{
    import com.ryancanulla.airforandroid.model.MainModel;

    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.display.Stage;
    import flash.events.AccelerometerEvent;
    import flash.sensors.Accelerometer;
    import flash.text.TextField;
    import flash.text.TextFormat;

    import spark.components.TextInput;

    public class DebuggerDataLayer extends Sprite
    {

        private var accelerometerX:TextField;
        private var accelerometerY:TextField;
        private var accelerometerZ:TextField;

        private var _accelerationX:Number = 0;
        private var _accelerationY:Number = 0;
        private var _accelerationZ:Number = 0;

        private var format:TextFormat;

        private var accelerometerData:Accelerometer;
        private var fps:FPSTimer;
        private var _stage:Stage = MainModel.getInstance().referenceToStage;

        public function DebuggerDataLayer(e:Sprite) {
            super();
            init();
        }

        private function init():void {
            createChildren();
        }

        private function createChildren():void {
            format = new TextFormat(AssetsManager.DROID_SANS_BOLD, "16");
            format.bold = false;
            format.color = 0xFFB03B;

            accelerometerX = new TextField;
            addChild(accelerometerX);

            accelerometerY = new TextField;
            addChild(accelerometerY);

            accelerometerZ = new TextField;
            addChild(accelerometerZ);

            fps = new FPSTimer();
            addChild(fps);

            updateLayout();
            updateProperties();
        }

        private function updateLayout():void {
            accelerometerX.width = 100;
            accelerometerX.x = 10;
            accelerometerX.y = 10;

            accelerometerY.width = 100;
            accelerometerY.x = 110;
            accelerometerY.y = 10;

            accelerometerZ.width = 100;
            accelerometerZ.x = 210;
            accelerometerZ.y = 10;

            fps.x = 300;
            fps.y = 10;
        }

        private function updateProperties():void {
            accelerometerX.text = "x: " + _accelerationX.toPrecision(5);
            accelerometerY.text = "y: " + _accelerationY.toPrecision(5);
            accelerometerZ.text = "z: " + _accelerationZ.toPrecision(5);

            accelerometerY.setTextFormat(format);
            accelerometerX.setTextFormat(format);
            accelerometerZ.setTextFormat(format);
            fps.setTextFormat(format);
        }

        public function invalidateProperties():void {
            updateProperties();
        }

        public function invalidateLayout():void {
            updateLayout();
        }

        public function setAcceleration(accX:Number, accY:Number, accZ:Number):void {
            _accelerationX = accX;
            _accelerationY = accY;
            _accelerationZ = accZ;
        }

    }
}
