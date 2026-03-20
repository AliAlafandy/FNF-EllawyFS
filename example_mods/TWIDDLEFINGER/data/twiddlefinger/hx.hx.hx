var hola:Int = 6;
var fakeBG:FlxSprite;
var zoomTween:FlxTween;

function introCam() {

}

function onSongStart() {
    var time:Float = 1.5;
    FlxG.camera.fade(FlxColor.BLACK, time, true);
    FlxTween.tween(game.camHUD, { alpha: 1 }, time - 0.25, { ease: FlxEase.sineOut, startDelay: 0.25 });

    zoomTween = FlxTween.tween(FlxG.camera, { zoom: FlxG.camera.zoom - 0.5 }, time, { ease: FlxEase.circIn });

    FlxTween.tween(game.camFollow, { x: game.camFollow.x - 700, y: game.camFollow.y - 200 }, time, { ease: FlxEase.circIn });
}

function onCreate() {
    fakeBG = new FlxSprite().loadGraphic(Paths.image('og'));
    fakeBG.scale.set(1.75*2, 1.75*2);
    fakeBG.updateHitbox();
    fakeBG.setPosition(2000, 1200);
    fakeBG.antialiasing = true;
    addBehindDad(fakeBG);
}
var bL:FlxSprite = new FlxSprite(-200, -100).makeGraphic(1, 1, 0xFF000000);
var bR:FlxSprite = new FlxSprite(850, -100).makeGraphic(1, 1, 0xFF000000);
var bx:FlxSprite = new FlxSprite(-950, -600).makeGraphic(1, 1, 0xFF000000);
var bL2:FlxSprite = new FlxSprite(-175, -100).makeGraphic(1, 1, 0xFF000000);
var bR2:FlxSprite = new FlxSprite(825, -100).makeGraphic(1, 1, 0xFF000000);
function onCreatePost() {
        game.addCharacterToList('nugget',0);
    game.addCharacterToList('nugget_hat',0);
    game.addCharacterToList('maxpro',1);

    game.addCharacterToList('rednughat',0);
    game.addCharacterToList('rednugget',0);
    game.addCharacterToList('redmax',1);
    
    boyfriend.x -= 700;

    bL.scale.set(160 * 4, 160 * hola);
    bL.updateHitbox();
    addBehindDad(bL);
    bL.cameras = [game.camHUD];

    bR.scale.set(160 * 4, 160 * hola);
    bR.updateHitbox();
    addBehindDad(bR);
    bR.cameras = [game.camHUD];

    bx.scale.set(30000, 30000);
    bx.updateHitbox();
    addBehindDad(bx);
    game.healthBar.visible = false;
    bx.alpha = 0;

    bL2.scale.set(160 * 4, 160 * hola);
    bL2.updateHitbox();
    addBehindDad(bL2);
    bL2.cameras = [game.camOther];

    bR2.scale.set(160 * 4, 160 * hola);
    bR2.updateHitbox();
    addBehindDad(bR2);
    bR2.cameras = [game.camOther];

    bR2.alpha = 0;
    bL2.alpha = 0;
}

var tweenDuration:Float = 0.4;
var tween:FlxTween;

function onStepHit() {
    if (curStep == 272) {
        FlxTween.tween(bL, { x: bL.x - 225 }, tweenDuration, { ease: FlxEase.cubicOut });
        FlxTween.tween(bR, { x: bR.x + 225 }, tweenDuration, { ease: FlxEase.cubicOut });
        FlxTween.tween(bx, { alpha: 0.9 }, 1, { ease: FlxEase.cubicOut });
    }
    if (curStep == 288) {
        remove(fakeBG);
        FlxTween.tween(bL, { x: bL.x - 150 }, 0.1, { ease: FlxEase.cubicOut });
        FlxTween.tween(bR, { x: bR.x + 150 }, 0.1, { ease: FlxEase.cubicOut });
                FlxTween.tween(bx, { alpha: 0 }, 0.2, { ease: FlxEase.cubicOut });
    }
        if (curStep == 288) {
        remove(fakeBG);
        FlxTween.tween(bL, { x: bL.x - 150 }, 0.1, { ease: FlxEase.cubicOut });
        FlxTween.tween(bR, { x: bR.x + 150 }, 0.1, { ease: FlxEase.cubicOut });
                FlxTween.tween(bx, { alpha: 0 }, 0.2, { ease: FlxEase.cubicOut });
    }
        if (curStep == 1568) {
        FlxTween.tween(bL2, { alpha: 1 }, 2, { ease: FlxEase.cubicOut });
        FlxTween.tween(bR2, { alpha: 1 }, 2, { ease: FlxEase.cubicOut });
    }
          if (curStep >= 1808) {
        FlxTween.tween(bL2, { alpha: 0 }, 0.1, { ease: FlxEase.cubicOut });
        FlxTween.tween(bR2, { alpha: 0 }, 0.1, { ease: FlxEase.cubicOut });
    }
}