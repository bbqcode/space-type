package
{
	import flash.display.Sprite;
	import flash.display.Stage;
	
	import starling.core.Starling;
	
	[SWF(width="600", height="400", frameRate="60", backgroundColor="#FFFFFF")]
	public class Startup extends Sprite
	{
		private var _starling:Starling;
		
		public function Startup()
		{
			_starling = new Starling(Game, Stage(stage));
			_starling.start();
		}
	}
}