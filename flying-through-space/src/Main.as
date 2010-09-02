package
{
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.events.AccelerometerEvent;
    import flash.events.Event;
    import flash.sensors.Accelerometer;
    import flash.text.engine.EastAsianJustifier;

    import org.papervision3d.cameras.CameraType;
    import org.papervision3d.core.proto.MaterialObject3D;
    import org.papervision3d.lights.PointLight3D;
    import org.papervision3d.materials.BitmapMaterial;
    import org.papervision3d.materials.ColorMaterial;
    import org.papervision3d.materials.shaders.FlatShader;
    import org.papervision3d.materials.shaders.GouraudShader;
    import org.papervision3d.materials.shaders.ShadedMaterial;
    import org.papervision3d.materials.shaders.Shader;
    import org.papervision3d.materials.special.ParticleMaterial;
    import org.papervision3d.materials.utils.MaterialsList;
    import org.papervision3d.objects.primitives.Cube;
    import org.papervision3d.objects.primitives.Sphere;
    import org.papervision3d.objects.special.ParticleField;
    import org.papervision3d.view.BasicView;

    public class Main extends BasicView
    {
        [Embed(source="/../assets/abstractSky-back.png")]
        private var BitmapFront:Class;

        [Embed(source="/../assets/abstractSky-right.png")]
        private var BitmapRight:Class;

        [Embed(source="/../assets/abstractSky-front.png")]
        private var BitmapBack:Class;

        [Embed(source="/../assets/abstractSky-left.png")]
        private var BitmapLeft:Class;

        [Embed(source="/../assets/abstractSky-down.png")]
        private var BitmapDown:Class;

        [Embed(source="/../assets/abstractSky-up.png")]
        private var BitmapUp:Class;

        private var environmentContainer:Cube;
        private var materials:MaterialsList;

        private var goButtonActive:Boolean = false;
        private var cube:Cube;

        private var yawValue:Number = 0;
        private var pitchValue:Number = 0;
		private var accelerometerData:Accelerometer;

        public function Main() {

            super(1024, 1280, true, false, CameraType.FREE);

            var matFront:BitmapMaterial = new BitmapMaterial(new BitmapFront().bitmapData);
            var matRight:BitmapMaterial = new BitmapMaterial(new BitmapRight().bitmapData);
            var matBack:BitmapMaterial = new BitmapMaterial(new BitmapBack().bitmapData);
            var matLeft:BitmapMaterial = new BitmapMaterial(new BitmapLeft().bitmapData);
            var matDown:BitmapMaterial = new BitmapMaterial(new BitmapDown().bitmapData);
            var matUp:BitmapMaterial = new BitmapMaterial(new BitmapUp().bitmapData);

            matFront.doubleSided = true;
            matRight.doubleSided = true;
            matBack.doubleSided = true;
            matLeft.doubleSided = true;
            matDown.doubleSided = true;
            matUp.doubleSided = true;

            materials = new MaterialsList();

            materials.addMaterial(matFront, "front");
            materials.addMaterial(matLeft, "left");
            materials.addMaterial(matBack, "back");
            materials.addMaterial(matUp, "top");
            materials.addMaterial(matRight, "right");
            materials.addMaterial(matDown, "bottom");

            cube = new Cube(materials, 1000, 1000, 1000, 5, 5, 5);
            scene.addChild(cube);

            var particleMaterial:ParticleMaterial = new ParticleMaterial(0xffffff, 1, ParticleMaterial.SHAPE_CIRCLE);
            var stars:ParticleField = new ParticleField(particleMaterial, 5000, 3, 5000, 5000, 5000);
            scene.addChild(stars);

            camera.z = 0;
            camera.fov = 55;

            startRendering();

            this.addEventListener(Event.ENTER_FRAME, onEnterFrame);

			if (Accelerometer.isSupported)
			{
				trace("accelerometer supported");
				accelerometerData = new Accelerometer();
				accelerometerData.addEventListener(AccelerometerEvent.UPDATE, updateAccelerometerData);
			}
        }

        private function onEnterFrame(e:Event = null):void {

            camera.yaw(yawValue);
            camera.pitch(pitchValue);

            yawValue *= 0.98;
            pitchValue *= 0.9;

            camera.moveForward(4);
            cube.x = camera.x;
            cube.y = camera.y;
            cube.z = camera.z;
            singleRender();
        }

		private function updateAccelerometerData(e:AccelerometerEvent):void {
			yawValue -= e.accelerationX * 3;
			//pitchValue += e.accelerationY * 1;
		}
    }
}
