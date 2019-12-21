package;

 import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
 import flixel.system.FlxAssets.FlxGraphicAsset;

 class Fist extends FlxSprite
 
{
    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);

        
        
        loadGraphic(AssetPaths.punchtwo__png,true,160,140); 
        animation.add("punch",[1, 2],20,false);
        animation.add("idle",[0]);
        animation.play("idle");
        
        
    }
    
    
    
    override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

        if (FlxG.keys.justPressed.SPACE)
        {
            animation.play("punch");
            FlxG.sound.play("assets/sounds/smack"+FlxG.random.int(1, 5)+".mp3");

        }
        if (FlxG.keys.justReleased.SPACE)
        {
            animation.play("idle");

        }



	}
}