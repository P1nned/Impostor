function onCreate()
	precacheImage('aftonout');
	precacheImage('stationopen');
		duration = tonumber(0.01);
		if duration < 0 then
			duration = 0;
		end

		targetAlpha = tonumber(0);
		if duration == 0 then
			setProperty('dad.alpha', targetAlpha);
			setProperty('iconP2.alpha', targetAlpha);
		else
			doTweenAlpha('dadFadeEventTween', 'dad', targetAlpha, duration, 'linear');
			doTweenAlpha('iconDadFadeEventTween', 'iconP2', targetAlpha, duration, 'linear');
	end
end

function onStepHit()

    if curStep == 144 then
        makeAnimatedLuaSprite('aftonout','aftonout', 300, 120);
        scaleObject('aftonout', 1.4, 1.4);
		addAnimationByPrefix('aftonout','aftonout','idle',24,true);
        addLuaSprite('aftonout', false);
	end
		if curStep == 160 then

			removeLuaSprite('aftonout', true);
			makeLuaSprite('stationopen', 'stationopen', 300, 120);
			scaleObject('stationopen', 1.4, 1.4);
			addLuaSprite('stationopen', false);
		end
			if curStep == 2368 then

				doTweenY('down', 'gf', 2000, 4, 'cubeout');

		end

end