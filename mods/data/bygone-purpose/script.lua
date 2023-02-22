function onCreate()
	precacheImage('city');
	precacheImage('michael walking');
	makeAnimatedLuaSprite('city','city', -600, -200);
        scaleObject('city', 1.4, 1.4);
		addAnimationByPrefix('city','city','idle',18,true);
        addLuaSprite('city', false);
		doTweenAlpha('city','city', 0, 0.001, true);
		makeAnimatedLuaSprite('michael walking','michael walking', -400, 0);
        scaleObject('michael walking', 1.1, 1.1);
		addAnimationByPrefix('michael walking','michael walking','idle',24,true);
        addLuaSprite('michael walking', false);
		doTweenAlpha('michael walking','michael walking', 0, 0.001, true);
		makeLuaSprite('bygonepainting','bygonepainting', 0, 0);
        setObjectCamera('bygonepainting', 'hud')
        addLuaSprite('bygonepainting', true);
		doTweenAlpha('bygonepainting','bygonepainting', 0, 0.01, true);
		makeLuaSprite('black','black', 0, 0);
        setObjectCamera('black', 'hud')
        addLuaSprite('black', true);
		doTweenAlpha('black','black', 0, 0.01, true);
end