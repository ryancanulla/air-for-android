package
{
    import com.ryancanulla.airforandroid.model.MainModel;
    import com.ryancanulla.airforandroid.utils.DebuggerDataLayer;
    import com.ryancanulla.airforandroid.view.MainViewContainer;

    import flash.desktop.NativeApplication;
    import flash.desktop.SystemIdleMode;
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

    [SWF(backgroundColor="#0072BB", frameRate="30")]
    public class HelloWorld extends Sprite
    {

        private var model:MainModel = MainModel.getInstance();
        private var mainView:MainViewContainer;

        public function HelloWorld() {
            NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
            Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;

            model.referenceToStage = this.stage;

            mainView = new MainViewContainer();
            addChild(mainView);

        /*if(TouchEvent.TOUCH_TAP){
           trace("has touch support");
           raft.addEventListener(TouchEvent.TOUCH_BEGIN, grabRaft);
           raft.addEventListener(TouchEvent.TOUCH_MOVE, moveRaft);
           raft.addEventListener(TouchEvent.TOUCH_END, dropRaft);
           }
         */
        }
    }
}

