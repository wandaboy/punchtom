package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		Assets.defaultRootPath = rootPath;

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy25:assets%2Fdata%2Fbackg.pngy4:sizei4514y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y25:assets%2Fdata%2Fblood.pngR2i2207R3R4R5R7R6tgoR0y34:assets%2Fdata%2Fdata-goes-here.txtR2zR3y4:TEXTR5R8R6tgoR0y27:assets%2Fdata%2Fhurttom.pngR2i12977R3R4R5R10R6tgoR0y28:assets%2Fdata%2Fpunchtwo.pngR2i2713R3R4R5R11R6tgoR0y27:assets%2Fdata%2Ftomhurt.pngR2i17019R3R4R5R12R6tgoR0y27:assets%2Fdata%2Ftomidle.pngR2i12977R3R4R5R13R6tgoR0y34:assets%2Fdata%2Ftomspritesheet.pngR2i7241R3R4R5R14R6tgoR0y29:assets%2Fdata%2Fwrappunch.pngR2i1101R3R4R5R15R6tgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R9R5R16R6tgoR2i11071737R3y5:MUSICR5y24:assets%2Fmusic%2FHot.mp3y9:pathGroupaR18hR6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R9R5R20R6tgoR2i294164R3y5:SOUNDR5y34:assets%2Fsounds%2Fpunch_sound1.wavR19aR22hR6tgoR2i610138R3R21R5y35:assets%2Fsounds%2Fpunch_special.wavR19aR23hR6tgoR2i9556R3R17R5y25:assets%2Fsounds%2Frip.mp3R19aR24y25:assets%2Fsounds%2Frip.wavhR6tgoR2i118828R3R21R5R25R19aR24R25hgoR2i12303R3R17R5y28:assets%2Fsounds%2Fsmack1.mp3R19aR26hR6tgoR2i6151R3R17R5y28:assets%2Fsounds%2Fsmack2.mp3R19aR27hR6tgoR2i10486R3R17R5y28:assets%2Fsounds%2Fsmack3.mp3R19aR28hR6tgoR2i15501R3R17R5y28:assets%2Fsounds%2Fsmack4.mp3R19aR29hR6tgoR2i15501R3R17R5y28:assets%2Fsounds%2Fsmack5.mp3R19aR30hR6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R9R5R31R6tgoR2i4505R3R17R5y35:assets%2Fsounds%2Fsound_TomHit1.mp3R19aR32hR6tgoR2i6331R3R17R5y36:assets%2Fsounds%2Fsound_TomHit10.mp3R19aR33hR6tgoR2i6044R3R17R5y36:assets%2Fsounds%2Fsound_TomHit11.mp3R19aR34hR6tgoR2i4505R3R17R5y35:assets%2Fsounds%2Fsound_TomHit2.mp3R19aR35hR6tgoR2i5574R3R17R5y35:assets%2Fsounds%2Fsound_TomHit3.mp3R19aR36hR6tgoR2i6017R3R17R5y35:assets%2Fsounds%2Fsound_TomHit4.mp3R19aR37hR6tgoR2i5469R3R17R5y35:assets%2Fsounds%2Fsound_TomHit5.mp3R19aR38hR6tgoR2i5158R3R17R5y35:assets%2Fsounds%2Fsound_TomHit6.mp3R19aR39hR6tgoR2i5913R3R17R5y35:assets%2Fsounds%2Fsound_TomHit7.mp3R19aR40hR6tgoR2i5339R3R17R5y35:assets%2Fsounds%2Fsound_TomHit8.mp3R19aR41hR6tgoR2i5965R3R17R5y35:assets%2Fsounds%2Fsound_TomHit9.mp3R19aR42hR6tgoR2i2114R3R17R5y26:flixel%2Fsounds%2Fbeep.mp3R19aR43y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R17R5y28:flixel%2Fsounds%2Fflixel.mp3R19aR45y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3R21R5R44R19aR43R44hgoR2i33629R3R21R5R46R19aR45R46hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R47R48y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R4R5R53R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R4R5R54R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_backg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_blood_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_hurttom_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_punchtwo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_tomhurt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_tomidle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_tomspritesheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_wrappunch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_hot_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_punch_sound1_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_punch_special_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_rip_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_rip_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_smack1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_smack2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_smack3_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_smack4_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_smack5_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit10_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit11_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit3_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit4_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit5_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit6_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit7_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit8_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit9_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:image("assets/data/backg.png") @:noCompletion #if display private #end class __ASSET__assets_data_backg_png extends lime.graphics.Image {}
@:keep @:image("assets/data/blood.png") @:noCompletion #if display private #end class __ASSET__assets_data_blood_png extends lime.graphics.Image {}
@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/data/hurttom.png") @:noCompletion #if display private #end class __ASSET__assets_data_hurttom_png extends lime.graphics.Image {}
@:keep @:image("assets/data/punchtwo.png") @:noCompletion #if display private #end class __ASSET__assets_data_punchtwo_png extends lime.graphics.Image {}
@:keep @:image("assets/data/tomhurt.png") @:noCompletion #if display private #end class __ASSET__assets_data_tomhurt_png extends lime.graphics.Image {}
@:keep @:image("assets/data/tomidle.png") @:noCompletion #if display private #end class __ASSET__assets_data_tomidle_png extends lime.graphics.Image {}
@:keep @:image("assets/data/tomspritesheet.png") @:noCompletion #if display private #end class __ASSET__assets_data_tomspritesheet_png extends lime.graphics.Image {}
@:keep @:image("assets/data/wrappunch.png") @:noCompletion #if display private #end class __ASSET__assets_data_wrappunch_png extends lime.graphics.Image {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/music/Hot.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_hot_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/punch_sound1.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_punch_sound1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/punch_special.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_punch_special_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/rip.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_rip_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/rip.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_rip_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/smack1.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_smack1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/smack2.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_smack2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/smack3.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_smack3_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/smack4.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_smack4_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/smack5.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_smack5_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sound_TomHit1.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sound_TomHit10.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit10_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sound_TomHit11.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit11_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sound_TomHit2.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sound_TomHit3.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit3_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sound_TomHit4.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit4_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sound_TomHit5.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit5_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sound_TomHit6.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit6_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sound_TomHit7.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit7_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sound_TomHit8.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit8_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sound_TomHit9.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_sound_tomhit9_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,6,3/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,6,3/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,6,3/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,6,3/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,6,3/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,6,3/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
