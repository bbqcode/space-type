package com.elicng.spacetype.managers
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class WordDictionaryManager
	{
		private var loader:URLLoader;

		private static var wordsArray:Array;
		private static var cIndex:int;
		public function WordDictionaryManager()
		{
			init();
		}
		
		private function init():void {
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, loader_completed);
			loader.addEventListener(IOErrorEvent.IO_ERROR, loader_error);
			loader.load(new URLRequest("words.txt"));
		}
		
		protected function loader_completed(event:Event):void
		{
			loader.removeEventListener(Event.COMPLETE, loader_completed);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, loader_error);
			wordsArray = event.target.data.split(/\n/);
			function randomSort(a:*, b:*):Number
			{
				if (Math.random() < 0.5) return -1;
				else return 1;
			}
			wordsArray.sort(randomSort);
		}
		
		protected function loader_error(event:IOErrorEvent):void
		{
			loader.removeEventListener(Event.COMPLETE, loader_completed);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, loader_error);
			throw new Error("File load failed");
		}
		
		public static function getRandomWord():String {
			var word:String = wordsArray[cIndex]
			cIndex++;
			if (cIndex >= wordsArray.length) {
				cIndex = 0;
			}
			return word;
		}
	}
}