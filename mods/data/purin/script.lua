function onCreate()
    precacheImage('characters/xor2');
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

	if curStep == 1100 then
   end

end