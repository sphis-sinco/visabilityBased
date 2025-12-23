import flixel.util.FlxColor;
import Object.ObjectAlignment;

class ObjectiveScene
{
	public var objects:Array<Object> = [];

	public var jsonData:ObjectiveJsonData = null;

	public function new() {
		trace('new objective scene');
	}

	public function load(jsonData:ObjectiveJsonData)
	{
		this.jsonData = jsonData;

		for (obj in objects)
		{
			objects.remove(obj);
			obj.destroy();
		}

		objects = [];

		for (option in this.jsonData.options)
		{
			var object:Object = new Object(option?.object ?? 'cone', option?.alignment ?? ObjectAlignment.CENTER);

			if (option?.tint != null)
				if (Std.isOfType(option.tint, String))
					object.color = FlxColor.fromString(option.tint);
				else
					object.color = option.tint;

			objects.push(object);
		}

		trace('Objective: ' + this.jsonData.objective);
	}
}
