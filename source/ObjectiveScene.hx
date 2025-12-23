import flixel.util.FlxColor;
import Object.ObjectAlignment;

class ObjectiveScene
{
	public var objects:Array<Object> = [];

	public var jsonData:ObjectiveJsonData;

	public function new() {}

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
			var object:Object = new Object(option?.object ?? 'cone', (cast option?.alignment) ?? ObjectAlignment.CENTER);

			if (option?.tint != null)
				object.color = FlxColor.fromString(option.tint);

			objects.push(object);
		}
	}
}
