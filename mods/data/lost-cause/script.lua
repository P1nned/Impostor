function onCreate()
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

	if curStep == 370 then   
      makeLuaSprite('freddyded', 'freddyded', 435, 1215);
	setLuaSpriteScrollFactor('freddyded', 1, 1);
	scaleObject('freddyded', 0.65, 0.65);

	addLuaSprite('freddyded', false);
   end

end