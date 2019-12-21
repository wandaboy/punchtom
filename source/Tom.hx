package;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Tom extends FlxSprite
{
    public var daScore:Int = 0;
    private var secretThing:Int = 70;
    var curFrame:Int = 0;

    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);

        loadGraphic(AssetPaths.tomhurt__png,true, 160, 140); 
        animation.add("punch", [7], 10, false);
        animation.add("punchBlood", [8], 10, false);
        animation.add("idle", [0, 1, 2, 3, 4, 5, 6], 0);
        animation.play("idle", false, false, 0); 
    }
    
    override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

        var justTouched:Bool = false;

		if (FlxG.touches.getFirst() != null)
		{
			justTouched = FlxG.touches.getFirst().justPressed;
		}

		if (FlxG.keys.justPressed.SPACE || justTouched)
        {
            if (curFrame >= 4)
            {
                animation.play("punchBlood", true);
            }
            else
                animation.play("punch", true);
            
            FlxG.sound.play("assets/sounds/sound_TomHit" + FlxG.random.int(1, 11) + ".mp3");
        }

        if ((animation.curAnim.name == "punch" || animation.curAnim.name == "punchBlood") && animation.curAnim.finished)
        {
            animation.play("idle");
            
            if (daScore >= 30)
            {
                curFrame = 1;
            }
            if (daScore >= 60)
            {
                curFrame = 2;
            }
            if (daScore >= 90)
            {
                curFrame = 3;
            }
            if (daScore >= 120)
            {
                curFrame = 4;
            }
            if (daScore >= 150)
            {
                curFrame = 5;
            }
            if (daScore >= 180)
            {
                curFrame = 6;
            }
            if (daScore >= 210)
            {
                curFrame = 7;
            }

            animation.play("idle", false, false, curFrame);
        }
	}
}