package
{
	import com.elicng.spacetype.managers.WordDictionaryManager;
	
	import flash.utils.setTimeout;
	
	import feathers.controls.Button;
	import feathers.controls.TextInput;
	import feathers.events.FeathersEventType;
	import feathers.themes.MetalWorksMobileTheme;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;

	public class Game extends Sprite
	{
		private var button:Button;

		private var wordDictionnaryManager:WordDictionaryManager;

		private var textField:TextField;

		private var input:TextInput;
		public function Game()
		{
			wordDictionnaryManager = new WordDictionaryManager();
			textField = new TextField(400, 300, "Welcome to hell!");
			addChild(textField);
			
			new MetalWorksMobileTheme();
			
			input = new TextInput();
			input.width = this.width;
			input.height = 30;
			input.textEditorProperties.fontFamily = "Helvetica";
			input.textEditorProperties.fontSize = 300;
			input.addEventListener(FeathersEventType.ENTER, input_enterHandler);
			
			input.y = this.height - input.height;
			input.text = "";
			this.addChild( input );
			input.setFocus();
			setTimeout(showNextWord, 500);
		}
		
		private function input_enterHandler(event:Event):void
		{
			trace("pressed enter");
			if (textField.text == input.text) {
				showNextWord();
				input.text = "";
			}
		}
		
		private function showNextWord():void {
			var word:String = WordDictionaryManager.getRandomWord();
			textField.text = word;
		}
	}
}