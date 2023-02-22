function onCreate()
	makeLuaSprite('fog','fog', 0, 0);
    setObjectCamera('fog', 'hud')
    addLuaSprite('fog', true);
	makeLuaSprite('white','white', -500, -500);
        setLuaSpriteScrollFactor('white', 0, 0);
        scaleObject('white', 10, 10);
        addLuaSprite('white', true);
	setObjectOrder('gf', getObjectOrder('dadGroup') + 1)
	precacheImage('Freakachu');
end

function onStepHit()

   if curStep == 672 then

	makeAnimatedLuaSprite('Freakachu', 'Freakachu', 600, 400);
	setLuaSpriteScrollFactor('Freakachu', 1.2, 1.2);
	scaleObject('Freakachu', 0.6, 0.6);

	addAnimationByPrefix('Freakachu','Freakachu','idle',24,true);

	addLuaSprite('Freakachu', false);


	end
end