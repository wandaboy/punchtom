package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.effects.particles.FlxEmitter;
import io.newgrounds.NG;

class PlayState extends FlxState
{
	var score:Int = 0;
	var _txtscore:FlxText;
	var format5 = new FlxTextFormat(0xffffff, false, false, null);
	var _Tom:Tom;
	var _blood:FlxEmitter;

	var oldHighscore:Int = 0;
	

	override public function create():Void
	{
		if (FlxG.sound.music == null)
		{
			FlxG.sound.playMusic(AssetPaths.Hot__mp3, 1, true);

		}

		FlxG.camera.fade(0xFFFFFFFF, 0.1, true);

		FlxG.save.bind("File", "ninjamuffin99");
		if (FlxG.save.data.highscore != null)
		{
			oldHighscore = FlxG.save.data.highscore;
			if (NGio.isLoggedIn)
			{

				var board = NG.core.scoreBoards.get(8814);// ID found in NG project view
		    	board.postScore(score); // converts it into cents, for NG scoreboards
			}
		}
		

		 
		var _bg:FlxSprite=new FlxSprite().loadGraphic(AssetPaths.backg__png);
		add(_bg);
		_bg.screenCenter();
		_bg.angularVelocity=20;

		_txtscore = new FlxText(110, 10, 0, "", 8);
		_txtscore.setFormat(null, 8, FlxColor.BLACK);
        _txtscore.setBorderStyle(OUTLINE, FlxColor.WHITE);
        _txtscore.addFormat(format5, 0, 100);
		add(_txtscore);


		_Tom = new Tom(0,0);
		add(_Tom);

		_blood = new FlxEmitter();
		_blood.makeParticles(3, 3, FlxColor.RED, 500);
		_blood.lifespan.set(0.3, 0.6);
		_blood.launchMode = SQUARE;

		add(_blood);

		_blood.acceleration.start.min.y = 900;
		_blood.acceleration.start.max.y = 900;
		_blood.acceleration.end.min.y = 900;
		_blood.acceleration.end.max.y = 900;
		_blood.velocity.set(-200, -400, 200, 24);

		var _Fist:Fist;
		_Fist = new Fist(0, 0);
 		add(_Fist);

		super.create();
		
		
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
			

			//score=score+1;
			trace(score);
			score += 1;
			FlxG.save.data.highscore = score;
			FlxG.save.flush();
			_txtscore.text = "" + score;

			if (FlxG.random.bool(70))
			{
				_blood.setPosition(70 + FlxG.random.int(-20, 20), 70 + FlxG.random.int(-20, 20));
				_blood.start(true, 0, FlxG.random.int(2, 13));
			}

			if (NGio.isLoggedIn)
			{

				var board = NG.core.scoreBoards.get(8814);// ID found in NG project view
		    	board.postScore(score); // converts it into cents, for NG scoreboards

				var hornyMedal = NG.core.medals.get(58591);
				if (!hornyMedal.unlocked)
					hornyMedal.sendUnlock();

				if (score >= 10000)
				{
					var giftMedal = NG.core.medals.get(58592);
					if (!giftMedal.unlocked)
						giftMedal.sendUnlock();
				}
			}
			
			
		}

		_Tom.daScore = score;

	}
}
