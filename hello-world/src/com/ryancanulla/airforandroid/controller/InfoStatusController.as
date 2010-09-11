package com.ryancanulla.airforandroid.controller
{
    import flash.events.EventDispatcher;
    import flash.events.IEventDispatcher;

    public class InfoStatusController extends EventDispatcher
    {
        public function InfoStatusController(target:IEventDispatcher = null) {
            super(target);
            init();
        }

        private function init():void {
            createChildren();
        }

        private function createChildren():void {
            updateLayout();
        }

        public function updateLayout():void {

        }
    }
}
