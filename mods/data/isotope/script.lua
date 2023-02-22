function onCreate()
    precacheImage('glitch2');
    precacheImage('glitch anims');
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
      removeLuaSprite('glitch1', false);
      
      makeLuaSprite('glitch2', 'glitch2', -1000, -400);
	setLuaSpriteScrollFactor('glitch2', 1, 1);
	scaleObject('glitch2', 0.6, 0.6);

	addLuaSprite('glitch2', false);
    end
    if curStep == 1874 then

        makeAnimatedLuaSprite('glitch anims','glitch anims', 200, 0);
        scaleObject('glitch anims', 0.7, 0.7);
        addLuaSprite('glitch anims', true);

        addAnimationByPrefix('glitch anims','glitch anims','idle',15,true);
        doTweenX('tween', 'glitch anims', -70, 11, 'cubeIn');

   end

   if curStep == 220 then

	makeLuaText('Text',"Let's see what your petty anti-virus does now!",1000,140,550)
    setTextSize('Text',25)
	addLuaText("Text")

	end

		if curStep == 256 then

			removeLuaText("Text")
		
			end

			if curStep == 1079 then

				makeLuaText('Text',"Join me!",1000,140,550)
				setTextSize('Text',25)
				addLuaText("Text")
			
				end
			
					if curStep == 1088 then
			
						removeLuaText("Text")
					
						end

						if curStep == 1872 then

							makeLuaText('Text',"How would they gonna protect you when I AM them!",1000,140,550)
							setTextSize('Text',25)
							addLuaText("Text")
						
							end
						
								if curStep == 1904 then
						
									removeLuaText("Text")
								
									end

									if curStep == 1926 then

										makeLuaText('Text',"Everything's coming together!",1000,140,550)
										setTextSize('Text',25)
										addLuaText("Text")
									
										end
									
											if curStep == 1952 then
									
												removeLuaText("Text")
											
												end

												if curStep == 1954 then

													makeLuaText('Text',"From the begining... I've been there!",1000,140,550)
													setTextSize('Text',25)
													addLuaText("Text")
												
													end
												
														if curStep == 1984 then
												
															removeLuaText("Text")
														
															end

end