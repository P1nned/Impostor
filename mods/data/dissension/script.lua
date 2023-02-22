function onCreate()
	precacheImage('ennard2');
	precacheImage('ennard3');
	precacheImage('ennard4');
	precacheImage('michael2');
	precacheImage('foreground');
	doTweenAlpha('stagemichael','stagemichael', 0, 0.01, true);
end

function onStepHit()

    if curStep == 128 then
		doTweenX('ennardenter', 'dad', -500, 0.01, 'cubeout');
	end
		if curStep == 400 then
	doTweenX('my', 'dad', -2100, 0.01, 'cubeout');
	doTweenY('balls', 'dad', 600, 0.01, 'cubeout');
	makeAnimatedLuaSprite('ennardbg','ennardbg', -2100, 200);
    addAnimationByPrefix('ennardbg','ennardbg','idle',6,true);
	scaleObject('ennardbg', 2, 2);
	addLuaSprite('ennardbg', false);
		end
			if curStep == 904 then
				makeLuaSprite('blood2', 'blood2', -460, -250);
				setLuaSpriteScrollFactor('blood2', 0, 0);
				scaleObject('blood2', 1.7, 1.7);
			
				addLuaSprite('blood2', true);
			end
				if curStep == 905 then
					setPropertyLuaSprite('foreground', 'alpha', 0.5)
		end

end