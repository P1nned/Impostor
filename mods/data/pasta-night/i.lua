function onCreatePost()
makeLuaText('score', ' ', getPropertyFromClass('flixel.FlxG', 'width'),
getProperty('scoreTxt.x')-10, getProperty('scoreTxt.y')); 
setProperty('scoreTxt.visible', false);
setProperty('timeTxt.visible', false);
setProperty('timeBarBG.visible', false);
setProperty('timeBar.visible', false);
setTextSize('score', 30);
setTextFont('score', "metro.ttf");
setTextBorder('score', 1, '000000');
setTextAlignment('score', 'center');
addLuaText('score');
setProperty('healthBarBG.visible', false)
setProperty('healthBar.visible', false)
setProperty('scoreTxt.visible', false)
setProperty('iconP1.visible', false)
setProperty('iconP2.visible', false)
end
