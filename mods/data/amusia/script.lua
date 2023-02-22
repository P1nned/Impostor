function onCreate()
	setProperty("boyfriend.color", "0x00000000")
	doTweenX('bfright', 'boyfriend', 2000, 0.01, 'cubeout');
	doTweenX('dadleft', 'dad', -2000, 0.01, 'cubeout');
	makeLuaSprite('black','black', -500, -500);
	setLuaSpriteScrollFactor('black', 0, 0);
	scaleObject('black', 10, 10);
	addLuaSprite('black', false);
	makeLuaSprite('white','white', -500, -500);
	scaleObject('white', 10, 10);
	addLuaSprite('white', false);
	doTweenAlpha('white','white', 0, 0.01, true);
	makeAnimatedLuaSprite('staticui','static', 0, 0);
    setObjectCamera('staticui', 'hud')
    addLuaSprite('staticui', true);
    addAnimationByPrefix('staticui','staticui','idle',24,true);
	doTweenAlpha('staticui','staticui', 0, 0.01, true);
	doTweenAlpha('sbonnie','sbonnie', 0, 0.01, true);
end

function onStepHit()

	if curStep == 1 then
	doTweenX('bfleft', 'boyfriend', 700, 2, 'cubeout');
	doTweenX('dadright', 'dad', 0, 1, 'cubeout');

	end

	if curStep == 32 then
		setProperty("boyfriend.color", getColorFromHex("0xFFFFFFFF"))
	end

	if curStep == 800 then
		doTweenX('bfleft', 'boyfriend',-1000, 1, 'cubeout');
		doTweenX('dadright', 'dad', 1000, 1, 'cubeout');
		
		end

		if curStep == 806 then
			doTweenX('bfleft', 'boyfriend',-2000, 1, 'cubeout');
			doTweenY('bfdown', 'boyfriend', -400, 1, 'cubeout');
			
			end

		if curStep == 816 then
			doTweenX('bfleft', 'boyfriend',-600, 1, 'cubeout');
			doTweenY('bfdown', 'boyfriend', 200, 1, 'cubeout');
			
			end
end