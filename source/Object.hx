import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;

enum abstract ObjectAlignment(Int) from Int to Int
{
	var LEFT = 0;
	var CENTER = 1;
	var RIGHT = 2;
}

class Object extends FlxSprite
{
	public var alignment:ObjectAlignment;

	override public function new(object:String, alignment:ObjectAlignment)
	{
		super();

		loadObject(object);
		setAlignment(alignment);
	}

	public function loadObject(object:String)
	{
		frames = FlxAtlasFrames.fromSparrow('assets/images/$object.png', 'assets/images/$object.xml');
		animation.addByPrefix('anim', object, 24);
		animation.play('anim');

		updateHitbox();
	}

	public function setAlignment(alignment:ObjectAlignment)
	{
		this.alignment = alignment;

		screenCenter(Y);
		switch (alignment)
		{
			case LEFT:
				this.x = this.width / 2;
			case RIGHT:
				this.x = FlxG.width - this.width / 2;
			default:
				screenCenter(X);
		}
	}
}
