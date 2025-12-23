package;

import Object.ObjectAlignment;
import flixel.FlxState;

class GameState extends FlxState
{
	var scene:ObjectiveScene = new ObjectiveScene();

	override public function create()
	{
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	public function reloadScene()
	{
		var newJsonData:ObjectiveJsonData = {
			objective: 'click the cone',
			options: [{object: 'cone', alignment: ObjectAlignment.CENTER}]
		};
		scene.load(newJsonData);
	}
}
