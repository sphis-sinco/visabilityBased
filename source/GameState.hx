package;

import haxe.io.Path;
import polymod.fs.ZipFileSystem;
import sys.FileSystem;
import flixel.FlxG;
import lime.utils.Assets;
import haxe.Json;
import Object.ObjectAlignment;
import flixel.FlxState;

class GameState extends FlxState
{
	var scene:ObjectiveScene;

	var file_prefix_path:String = 'tutorial/';
	var objectives:Array<String> = [];

	override public function create()
	{
		super.create();

		scene = new ObjectiveScene();

		for (objective in new ZipFileSystem({}).readDirectory('assets/data/$file_prefix_path'))
		{
			if (Path.extension(objective) == 'json')
				objectives.push(Path.withoutExtension(objective));
		}

		trace('objectives: ' + objectives);
		reloadScene();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	public function reloadScene()
	{
		var newJsonData:ObjectiveJsonData = null;

		try
		{
			newJsonData = Json.parse(Assets.getText('assets/data/${file_prefix_path}${objectives[FlxG.random.int(0, objectives.length - 1)]}.json'));
		}
		catch (e)
		{
			trace(e.message);
		}

		newJsonData ??= {
			"objective": "Click the Cone",
			"options": [
				{
					"object": "Cone",
					"alignment": 0
				},
				{
					"object": "Cone",
					"alignment": 1
				},
				{
					"object": "Cone",
					"alignment": 2
				}
			]
		};

		scene.load(newJsonData);
	}
}
