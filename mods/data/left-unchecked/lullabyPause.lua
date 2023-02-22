--Pause menu bullshit + tables.
local selectionTable = {
[1] = function()
   closeSubstate();
end,
[2] = function()
   restartSong();
end, 
[3] = function()
   exitSong();
end
};

local selectionAnims = {[1] = 'resume', [2] = 'restart', [3] = 'exit'};

local objects = {'blackBG', 'box'};

--I FUCKING LOVE TABLE INDEXING.
							  
local selection = 1;

local closing = false;
local opening = true;
--Values for calcs.
local ogLerpVal = 12.8;
local lerpVal = 16;
local resize = 6;
local portraitLerp = 12;

function onPause()
	return Function_Stop;
end

function onUpdate()
   if keyJustPressed('pause') then
      if not inGameOver then
         openCustomSubstate('lullabyPause', true);
	  end
   end
end

function onCustomSubstateCreate(name)
   if name == 'lullabyPause' then
      --BG.
      makeLuaSprite('blackBG', nil);
	  makeGraphic('blackBG', screenWidth, screenHeight, '000000');
	  setObjectCamera('blackBG', 'camOther');
	  setProperty('blackBG.alpha', 0);
	  addLuaSprite('blackBG');
	  
	  makeLuaSprite('left', 'pause/leftl', -1000, 0);
	  setObjectCamera('left', 'camOther');
	  addLuaSprite('left');
	  
	  makeLuaSprite('right', 'pause/leftr', 1000, 0);
	  setObjectCamera('right', 'camOther');
	  addLuaSprite('right');
	  
	  --Box.
	  makeAnimatedLuaSprite('box', 'pause/pauseBox');
	  screenCenter('box', 'xy');
	  setProperty('box.x', getProperty('box.x') - 2.8);
	  setProperty('box.antialiasing', false);
	  addAnimationByPrefix('box', 'resume', 'pauseBox resume0', 24, false);
	  addAnimationByPrefix('box', 'restart', 'pauseBox restart0', 24, false);
	  addAnimationByPrefix('box', 'exit', 'pauseBox exit0', 24, false);
	  setObjectCamera('box', 'camOther');
	  addLuaSprite('box');
	  
	  playSound('lullabyPause', 1, 'pauseMusic');
	  setSoundVolume('pauseMusic', 0);
   end
end

--Emphasis on port.
function onCustomSubstateUpdate(name, elapsed)
   fakeElapsed = boundTo(elapsed, 0, 1);

   if name == 'lullabyPause' then
      if not closing then
	     setProperty('blackBG.alpha', math.lerp(getProperty('blackBG.alpha'), 0.6, fakeElapsed * ogLerpVal));
		 
		 setProperty('left.x', math.lerp(getProperty('left.x'), 0, fakeElapsed * portraitLerp));
		 setProperty('left.alpha', math.lerp(getProperty('left.alpha'), 1, fakeElapsed * portraitLerp));
		 setProperty('right.x', math.lerp(getProperty('right.x'), 560, fakeElapsed * portraitLerp));
		 setProperty('right.alpha', math.lerp(getProperty('right.alpha'), 1, fakeElapsed * portraitLerp));
	  else
	     setProperty('blackBG.alpha', math.lerp(getProperty('blackBG.alpha'), 0, fakeElapsed * ogLerpVal));
		 
		 setProperty('left.x', math.lerp(getProperty('left.x'), -1000, fakeElapsed * portraitLerp / 2));
		 setProperty('left.alpha', math.lerp(getProperty('left.alpha'), 0, fakeElapsed * portraitLerp));
		 setProperty('right.x', math.lerp(getProperty('right.x'), 1000, fakeElapsed * portraitLerp / 2));
		 setProperty('right.alpha', math.lerp(getProperty('right.alpha'), -1, fakeElapsed * portraitLerp)); --Some things just don't wanna work.
	  end
	  
	  if opening then
	     lerpVal = lerpVal * 1.05;
		 
		 if getProperty('box.scale.x') >= 5 then
		    lerpVal = ogLerpVal / 1.5;
			
			resize = 4;
			
			opening = false;
		 end
		 
		 setProperty('box.scale.x', math.lerp(getProperty('box.scale.x'), resize, fakeElapsed * lerpVal));
		 setProperty('box.scale.y', math.lerp(getProperty('box.scale.y'), resize, fakeElapsed * lerpVal * 2));
	  else
	     if closing then
		    setProperty('box.scale.x', math.lerp(getProperty('box.scale.x'), resize, fakeElapsed * lerpVal * 2));
			setProperty('box.scale.y', math.lerp(getProperty('box.scale.y'), resize, fakeElapsed * lerpVal));
		 else 
		    setProperty('box.scale.x', math.lerp(getProperty('box.scale.x'), resize, fakeElapsed * lerpVal));
			setProperty('box.scale.y', math.lerp(getProperty('box.scale.y'), resize, fakeElapsed * lerpVal * 2));
		 end
		 
		 if getProperty('box.scale.x') <= resize + 0.0125 then
		    setProperty('box.scale.x', resize);
		 end
		 
		 if getProperty('box.scale.y') <= resize + 0.0125 then
		    setProperty('box.scale.y', resize);
		 end
		 
		 if closing then
		    lerpVal = lerpVal * 1.05;
			resize = 0;
			
			if getProperty('box.scale.x') <= 0.5 then
			   closeCustomSubstate();
			   
			   for i = 1, #objects do
			      removeLuaSprite(objects[i], false);
			   end
			end
		 end
	  end
	  
	  if getSoundVolume('pauseMusic') < 0.5 then
	     setSoundVolume('pauseMusic', getSoundVolume('pauseMusic') + 0.025 * fakeElapsed);
	  end
   
      --Box.
	  playAnim('box', selectionAnims[selection], true);
   
      if keyJustPressed('accept') then
	     selectionTable[selection]();
	  elseif keyJustPressed('up') then
	     selection = selection - 1;
	  elseif keyJustPressed('down') then
	     selection = selection + 1;
	  end
	  
	  if selection > 3 then
	     selection = 1;
	  elseif selection < 1 then
	     selection = 3;
	  end
   end
end

function onCustomSubstateDestroy(name)
   if name == 'lullabyPause' then
      closing = false;
	  
	  opening = true;
	  
      ogLerpVal = 12.8;
      lerpVal = 16;
      resize = 6;
	  
	  stopSound('pauseMusic');
   end
end

function onSoundFinished(tag)
   playSound('lullabyPause', 1, 'pauseMusic');
end

function closeSubstate() --God damn it.
   closing = true;
end

function math.lerp(a,b,t)
 return(b-a) * t + a;
end

function boundTo(value, min, max)
    return math.max(min, math.min(max, value));
end