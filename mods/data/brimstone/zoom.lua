local camzoom = true
function onUpdate()
if camzoom then
	if mustHitSection then
		setProperty('defaultCamZoom', 0.6)
	else
		setProperty('defaultCamZoom', 0.8) -- normal is 0.85
	end
end
end
