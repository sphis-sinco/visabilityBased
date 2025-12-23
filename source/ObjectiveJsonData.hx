import flixel.util.FlxColor;
import Object.ObjectAlignment;
import flixel.util.typeLimit.OneOfTwo;

typedef ObjectiveJsonData = {
    objective:String,
    options:Array<{
        object:String,
        alignment:OneOfTwo<Int, ObjectAlignment>,

        ?tint:OneOfTwo<String, FlxColor>
    }>
}