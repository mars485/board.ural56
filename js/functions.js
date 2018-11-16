function popup(link, width, height)
	{
	window.open(link,'name','toolbar=0,location=0,directories=0,menuBar=0,resizable=0,scrollbars=yes,width=' + width + ',height=' + height + ',left=16,top=16');
	}

function go(url)
	{
	document.location.href = url;
	}

function closeAndRefresh()
	{
	opener.document.location.reload();
	close();
	}
function closeAndGo(url)
	{
	opener.document.location.href = url;
	close();
	}

function closeit()
	{
	self.close();
	}

function alterNate(elm)
	{
	if (!elm.base) elm.base = elm.value
	if (elm.value == elm.base) elm.value = '';
	else if (elm.value == '') elm.value = elm.base;
	}
function mp(img_this,img_src)
	{
	img_this.src=img_src;
	}
function showhideregion()
	{
	var block = document.getElementById('regionblock1').style.display;
	if (block == 'none')
		{
		document.getElementById('regionblock1').style.display = 'block';
		document.getElementById('regionblock2').style.display = 'none';
		}
	else
		{
		document.getElementById('regionblock1').style.display = 'none';
		document.getElementById('regionblock2').style.display = 'block';
		}
	}

	function mycarousel_initCallback(carousel)
	{

	    // Pause autoscrolling if the user moves with the cursor over the clip.
	    carousel.clip.hover(function() {
	        carousel.stopAuto();
	    }, function() {
	        carousel.startAuto();
	    });
	};

jQuery.easing['BounceEaseOut'] = function(p, t, b, c, d) {
	if ((t/=d) < (1/2.75)) {
		return c*(7.5625*t*t) + b;
	} else if (t < (2/2.75)) {
		return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
	} else if (t < (2.5/2.75)) {
		return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
	} else {
		return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
	}
};
