package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class MenuState extends FlxState
{
    var format5 = new FlxTextFormat(0xffffff, false, false, null);

    override public function create():Void
    {
        FlxG.mouse.visible = false;

        var ng:NGio = new NGio(APIStuff.api, APIStuff.encKey);

        var _bg:FlxSprite=new FlxSprite().loadGraphic(AssetPaths.backg__png);
		add(_bg);
		_bg.screenCenter();
		_bg.angularVelocity=20;

        var _Tom:Tom;
        _Tom = new Tom(0,0);
		add(_Tom);

        var gift:FlxSprite = new FlxSprite().loadGraphic(AssetPaths.wrappunch__png);
        add(gift);

        var title:FlxText = new FlxText(10, 10, 120, "TOM FULPS CHRISTMAS BY WANDABOY AND NINJAMUFFIN99\n\nMusic by Kawaisprite", 8);
        title.setFormat(null, 8, FlxColor.BLACK);
        title.setBorderStyle(OUTLINE, FlxColor.WHITE);
        title.addFormat(format5, 0, 100);
        add(title);

        FlxTween.tween(title, {y: title.y + 5}, 0.6, {type: PINGPONG, ease: FlxEase.cubeInOut});

        super.create();
    }

    override public function update(e:Float):Void
    {
        var justTouched:Bool = false;

		if (FlxG.touches.getFirst() != null)
		{
			justTouched = FlxG.touches.getFirst().justPressed;
		}

		if (FlxG.keys.justPressed.SPACE || justTouched)
        {
            FlxG.sound.play(AssetPaths.rip__mp3);

            FlxG.camera.flash(0xFFFFFFFF, 0.1, function()
            {
                FlxG.switchState(new PlayState());
            });
            
        }

        super.update(e);
    }
}