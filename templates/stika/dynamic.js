
var errortext = '<div class="error_block">{%$locale.47%}</div>';
var regtext = '<center><div class="ok" style="width:90%;">{%$locale[48]%}</div></center>';
var fields = new Array();
var images = new Array();
var files = new Array();
yamaps = new Array();
var ffiles = new Array();
var fieldsHTML = 'none';
var dop_fields = '';
var timeout = 3000;

    function calc_price(field_id, num, factor, el)
        {
        var parentclass = "";
        var n;
        n = num / factor;
        document.getElementById("price_"+field_id).innerHTML = n.toFixed(2); 
        var divs=document.getElementsByTagName("li");
        for(var i=0; i<divs.length; i++)
            {
            parentclass = divs[i].parentNode.className;
            if(parentclass == 'price_' + field_id)
                {
                divs[i].className="none";
                }
            }
        el.parentNode.className = 'once_price_selected';
        }

	function  myTags(mytags){
		mytags=mytags.replace(/<A/g, '<a')
			.replace(/\/A>/g, "/a>")
			.replace(/(\starget=_)(\w*)/g, ' target="_$2"')
			.replace(/(\sclass=)(?!")(\w*)/g, ' class="$2"')
			.replace(/(\sname=)(?!")(\w*)/g, ' name="$2"')
			.replace(/(\sid=)(?!")(\w*)/g, ' id="$2"')
			.replace(/(\srel=)(?!")(\w*)/g, ' rel="$2"');
		mytags=encodeURIComponent(mytags).replace(/!/g, '%21')
			.replace(/'/g, '%27').replace(/\(/g, '%28')
			.replace(/\)/g, '%29').replace(/\*/g, '%2A');
		var rnumber = Math.floor(Math.random()*9999999);
		var flashvars = {
			tcolor:"0x2A62C8", {%*/*цвет 1 - HEX*/*%}
			tcolor2:"0x000000",{%*/*цвет 2 цвета меняются от tcolor к tcolor2*/*%}
			hicolor:"0xB12AC8",{%*/*цвет тэгов при наведении курсора мыши*/*%}
			tspeed:"110",{%*/*скорость вращения облака*/*%}
			distr:"true",{%*/*true - распределять тэги равномерно по поверхности сферы, false - не распределять*/*%}
			mode:"tags",{%*/* o_O */*%}
			tagcloud:mytags
            

		};
		var params = {
			allowScriptAccess:"always",
			bgcolor:'#EFF3FF'
		};
		var attributes = {
			id:"flash_cloud"
		};
		swfobject.embedSWF("{%$settings.path%}js/tagcloud.swf?r="+rnumber,
						   "tags", "200", "200", "9.0.0",
						   "expressInstall.swf", flashvars,
						   params, attributes);
	}

function replaceT(obj){
var newO=document.createElement('input');
newO.setAttribute('type','password');
newO.setAttribute('id',obj.getAttribute('id'));
newO.setAttribute('style',obj.getAttribute('style'));
obj.parentNode.replaceChild(newO,obj);
newO.focus();
}

 function GoTo(num) {
    var margin = num * 200;
    $('#wr').animate(
        { marginLeft: -margin }, 800, 'easeInOutBack', function() {
        });

 }



	$(document).ready(function() {
	   
$('#region-ch4').click(function(event) {
    $('#region-ch3').css('visibility', 'visible'); 
	$.ajax({
    type: "GET",
     url: $(this).attr('href'),
     cache: true,    
     success: function(html){
        $('#region-ch2').html(html); 
        $('#region-ch1').attr('style', 'display:none;');
        $('#region-ch2').attr('style', 'display:absolute;'); 
        $('#region-ch3').css('visibility', 'hidden');
     }
	});   
   	event.preventDefault();   
  });

$('body').click(function(e){

        if ($(e.target).parents().filter('#region-ch2:visible').length != 1 && $(e.target).parents().filter('#maket_left:visible').length != 1) {
        $('#region-ch2').attr('style', 'display:none;');       
        $('#region-ch1').attr('style', 'display:inline;');
        }
         
});


function ResizeCSS(){
    	if($('body').width() > 1200){
        //Прописываем значения CSS свойств, которые мы хотим применить для разрешения экрана меньше 1200 px
		$('body').css("overflow-x","hidden");
        }
    }
	ResizeCSS();

	$(window).resize(function(){
    ResizeCSS();
    });

var mytags="<tags>"
+$('#tags').html()
+"</tags>";
myTags(mytags);


$('div.comm_user').mouseover(function() {
    $(this).children(".editblock").css('visibility', 'visible');
  });
$('div.comm_user').mouseout(function() {
    $(this).children(".editblock").css('visibility', 'hidden');
  });
$('div.messageblock').mouseover(function() {
    $(this).children(".moder_panel").css('visibility', 'visible');
  });
$('div.messageblock').mouseout(function() {
    $(this).children(".moder_panel").css('visibility', 'hidden');
  });
$('td.message_mail div').mouseover(function() {
    $(this).children(".user_messages").css('visibility', 'visible');
  });
$('td.message_mail div').mouseout(function() {
    $(this).children(".user_messages").css('visibility', 'hidden');
  });  
  
$('a.comm_edit').click(function(event) {
    var cont = $(this).parent().parent().children(".comm_text");
	$.ajax({
    type: "GET",
    data: "id="+$(this).attr("name")+"&act=edit",
     url: "{%$settings.path%}comment_edit/",
     cache: true,
     success: function(html){
        cont.html(html); 
     }
	}); 
   	event.preventDefault();   
  });

$('a.comm_edit').click(function(event) {
    var cont = $(this).parent().parent().children(".comm_text");
	$.ajax({
    type: "GET",
    data: "id="+$(this).attr("name")+"&act=edit",
     url: "{%$settings.path%}comment_edit/",
     cache: true,
     success: function(html){
        cont.html(html); 
     }
	}); 
   	event.preventDefault();   
  });

$('a.comm_delete').click(function(event) {
 
 	if(confirm('{%$locale.43%}'))
    {
    var cont = $(this).parent().parent();
	$.ajax({
    type: "GET",
    data: "id="+$(this).attr("name")+"&act=delete",
     url: "{%$settings.path%}comment_edit/",
     cache: true,
     success: function(html){
        if(html == 'ok')
        {
        cont.hide(500);
        } 
     }
	}); 
    }
   	event.preventDefault();   
  });



    canselcomment = function(el, id)
            {
            var cont = $(el).parent().parent();
        	$.ajax({
            type: "GET",
            data: "id="+id+"&act=show",
             url: "{%$settings.path%}comment_edit/",
             cache: true,
             success: function(html){
                cont.html(html); 
             }
        	}); 
            };
    savecomment = function(el, id)
            {
            var cont = $(el).parent().parent();
            var savetext = $('#text-'+id).val();
        	$.ajax({
            type: "POST",
            data: "id="+id+"&act=save&content="+savetext,
             url: "{%$settings.path%}comment_edit/",
             cache: true,
             success: function(html){
                cont.html(html); 
             }
        	}); 
            };


$('#top_search_area').attr('style', 'display: block;');
$.ajax({
    	type: "GET",
                data: "cat_id=" + second_cat_id,
url: "{%$settings.path%}search_ajax/",
cache: true,
success: function(html){
$('#top_search_area').html(html);
$('#top_search_area').show(500);
}
});

$('#top_search_link').click(function(event){

if($('#top_search_area').css('display') == 'none')
{

$('#top_search_area').attr('style', 'display: block;');
$.ajax({
    	type: "GET",
                data: "cat_id=" + second_cat_id,
url: "{%$settings.path%}search_ajax/",
cache: true,
success: function(html){
$('#top_search_area').html(html);
$('#top_search_area').show(500);
}
});
}
else
{
$('#top_search_area').fadeOut("fast");
}

});


    deletetmpfile = function(field_id, form_id)
            {
             	if(confirm('{%$locale.43%}'))
                    {
                	$.ajax({
                    type: "GET",
                    data: "field_id="+field_id+"&form_id="+form_id,
                     url: "{%$settings.path%}gettmpfile/",
                     cache: true,
                     success: function(html){
                        if(html == 'ok')
                        {
                           
                        $("#h1-f_"+field_id).hide(500);
                        $("#h2-f_"+field_id).hide(500);
                        } 
                     }
                	});
                     
                    }
            };


/*
$('#commentadd').click(function(event){
	if($('#top_search_area').css('display') == 'none')
		{

		}
	else
		{
		$('#top_search_area').fadeOut("fast");
		}


});
*/

$('a.message_images2').click(function(event){
$("#mainimg").attr('src', $(this).attr("href"));
event.preventDefault();
});

$('span.m_delete a').click(function(event){
	if(confirm('{%$locale.43%}'))
		{
		var messageid = $(this).attr('name');
		var span = $(this).parent().parent();
			$.ajax({
		    type: "GET",
		     url: $(this).attr('href'),
		     cache: false,
		     success: function(html){
		     	span.hide(1000);
		     	$('#'+messageid).hide(1000);
				}
			});
		}
	else
	{
	return(false);
	}
	event.preventDefault();
});

$('span.m_restore a').click(function(event){
	if(confirm('{%$locale.43%}'))
		{
		var messageid = $(this).attr('name');
		var span = $(this).parent().parent();
			$.ajax({
		    type: "GET",
		     url: $(this).attr('href'),
		     cache: false,
		     success: function(html){
		     	span.hide(1000);
		     	$('#'+messageid).hide(1000);
				}
			});
		}
	else
	{
	return(false);
	}
	event.preventDefault();
});

$('a.fav').click(function(event){

    var id=$(this).attr("name");
    var eid=$(this).attr("id");
    var counter = parseInt($('#counter').html());
	$.ajax({
    type: "GET",
     url: "{%$settings.path%}fav/",
     cache: false,
     data: "id="+$(this).attr("name"),
     success: function(html){
     	$('#'+eid).parent().fadeOut("fast");
     	if(html == '1')
			{
			$('#'+eid).parent().attr('class', 'fav1');
			$('#'+eid).html('<img style="width: 20px;" src="{%$smarty.const.THEME%}images/zvezda.png">');
            $('#counter').html(counter - 1);
			}
     	if(html == '2')
			{
			$('#'+eid).parent().attr('class', 'fav2');
			$('#'+eid).html('<img style="width: 20px;" src="{%$smarty.const.THEME%}images/zvezda_active.png">');
            $('#counter').html(counter + 1);
			}
	 	$('#'+eid).parent().fadeIn("fast");
		}
	});
      event.preventDefault();
	});

$('#commentadd').click(function(event){
	if($('#commentform').css('display') == 'none')
		{
	     	$('#commentform').html('<img src="{%$settings.path%}images/ajax-loader.gif" width="190" height="19" />');
		 	$('#commentform').show(500);
			$.ajax({
		    type: "GET",
		     url: "{%$settings.path%}loadcomments/add/",
		     cache: true,
		     success: function(html){
		     	$('#commentform').html(html);
			 	$('#commentform').show(500);
				}
			});
		}
	else
		{
		$('#commentform').fadeOut("fast");
		}

      event.preventDefault();
	});




$('#page_register_e').bind('keyup', function() {
	$("#load1").html("<img src='{%$settings.path%}images/ajax-loader2.gif'>");
	$("#load1").attr('class', '');
	var val = $('#page_register_e').val();
	$.ajax({
    type: "GET",
     url: "{%$settings.path%}register_check/",
     cache: false,
     data: "type=e&val1="+val,
     success: function(html){

	     if(html == 'ok')
		     {
		     $("#load1").html('');
		     $("#load1").attr('class', 'load_ok');
		     cond1 = 1;
		     }
	     else
		     {
		     $("#load1").html(html);
		     $("#load1").attr('class', 'load_er');
		     cond1 = 0;
		     }

		}
		});

	});
$('#page_register_u').bind('keyup', function() {
	$("#load2").html("<img src='{%$settings.path%}images/ajax-loader2.gif'>");
	$("#load2").attr('class', '');
	var val = $('#page_register_u').val();
	$.ajax({
    type: "GET",
     url: "{%$settings.path%}register_check/",
     cache: false,
     data: "type=u&val1="+val,
     success: function(html){
	     if(html == 'ok')
		     {
		     $("#load2").html('');
		     $("#load2").attr('class', 'load_ok');
		     cond2 = 1;
		     }
	     else
		     {
		     $("#load2").html(html);
		     $("#load2").attr('class', 'load_er');
		     cond2 = 0;
		     }

		}
		});

	});
$('#page_register_p1').bind('keyup', function() {
	$("#load3").html("<img src='{%$settings.path%}images/ajax-loader2.gif'>");
	$("#load3").attr('class', '');
	var val = $('#page_register_p1').val();
	$.ajax({
    type: "GET",
     url: "{%$settings.path%}register_check/",
     cache: false,
     data: "type=p1&val1="+val,
     success: function(html){
	     if(html == 'ok')
		     {
		     $("#load3").html('');
		     $("#load3").attr('class', 'load_ok');
		     cond3 = 1;
		     }
	     else
		     {
		     $("#load3").html(html);
		     $("#load3").attr('class', 'load_er');
		     cond3 = 0;
		     }

		}
		});

	});
$('#page_register_p2').bind('keyup', function() {
	$("#load4").html("<img src='{%$settings.path%}images/ajax-loader2.gif'>");
	$("#load4").attr('class', '');
	var val1 = $('#page_register_p1').val();
	var val2 = $('#page_register_p2').val();
	$.ajax({
    type: "GET",
     url: "{%$settings.path%}register_check/",
     cache: false,
     data: "type=p2&val1="+val1+"&val2="+val2,
     success: function(html){
	     if(html == 'ok')
		     {
		     $("#load4").html('');
		     $("#load4").attr('class', 'load_ok');
		     cond4 = 1;
		     }
	     else
		     {
		     $("#load4").html(html);
		     $("#load4").attr('class', 'load_er');
		     cond4 = 0;
		     }

		}
		});

	});




$('#submit_login').click(function(event){


    $("#error").html('<img src="{%$settings.path%}images/ajax-loader.gif" width="190" height="19" />');
    $("#error").show(500);

	var login = $('#email_login').val();
	var password = $('#password_login').val();

	$.ajax({
    type: "POST",
     url: "{%$settings.path%}auth/",
     cache: false,
     data: "login="+login+"&password="+password,
     success: function(html){
	     if(html == 'error')
		     {
		     $("#error").fadeOut("fast");
	         $("#error").html(errortext);
	         $("#error").fadeIn("fast");
		     }
	     else
		     {
		     $("#block-user").hide(500);
	         $("#block-user").html(html);
	         $("#block-user").show(500);
		     }

		}
	});
	});


	$('#submit_register').click(function(event){


    $("#info-register").html('<img src="{%$settings.path%}images/ajax-loader.gif" width="190" height="19" />');
    $("#info-register").show(500);

	var email = $('#email_register').val();
	var name = $('#name_register').val();
	var pass1 = $('#pass1_register').val();
	var pass2 = $('#pass2_register').val();

	$.ajax({
    type: "POST",
     url: "{%$settings.path%}register/",
     cache: false,
     data: "email="+email+"&name="+name+"&password="+pass1+"&password1="+pass2,
     success: function(html){
            html = $.trim(html);
	     if(html == 'ok')
		     {
		     $("#info-register").hide(500);
		     $("#block-user").fadeOut("fast");
		     $("#block-user").html(regtext);
	         $("#block-user").fadeIn("fast");
		     }
	     else
		     {
		     $("#info-register").fadeOut("fast");;
	         $("#info-register").html(html);
	         $("#info-register").fadeIn("fast");
		     }

		}
	});
	});


	$('#submit_remind').click(function(event){
	    $("#info-remind").html('<img src="{%$settings.path%}images/ajax-loader.gif" width="190" height="19" />');
	    $("#info-remind").show(500);
		var login = $('#email_remind').val();
	 	$.ajax({
	    type: "POST",
	     url: "{%$settings.path%}remind/",
	     cache: false,
	     data: "email="+login,
	     success: function(html){
	                   html = $.trim(html);
			     $("#info-remind").fadeOut("fast");;
		         $("#info-remind").html(html);
		         $("#info-remind").fadeIn("fast");;
			}
			});
			});

     $('a.login').click(function(e) {
         e.preventDefault();
         GoTo(0);

     });
     $('a.remind').click(function(e) {
         e.preventDefault();
         GoTo(1);
     });
     $('a.register').click(function(e) {
     	e.preventDefault();
         GoTo(2);
     });


		$("a.zoom").fancybox({
			'overlayOpacity'	:	0.7,
			'overlayColor'		:	'#FFF',
			'zoomSpeedIn'		:	500,
			'zoomSpeedOut'		:	500
		});

	$("a.group").fancybox({
		'hideOnContentClick': false,
			'overlayOpacity'	:	0.7,
			'overlayColor'		:	'#FFF',
			'zoomSpeedIn'		:	500,
			'zoomSpeedOut'		:	500
	});
    

    loadF = function(cat)
            {
            if(fieldsHTML == 'none')
	            {
	            $("#fields").html('<center><img src="{%$settings.path%}images/ajax-loader.gif" height="19" /></center>');
		 	 	}
	 	 	$.ajax({
		     type: "GET",
		     url: "{%$settings.path%}add_fields/",
		     cache: false,
		     data: "c="+cat+"&form_id="+form_id,
		     success: function(html){
		     		if(html != fieldsHTML)
						{
						//$("#fields").fadeOut("fast");
						$("#fields").html(html);
						//$("#fields").fadeIn("fast");
                        fielF(fields);                                                
						}
					fieldsHTML = html;
				}
				});

            };
    fielF = function(fields)
	    {

		for(var key in images)
			{
		    //var val = images[key];
		    //$('#a-'+key).attr('href', '{%$settings.path%}uploads/images/tb/'+val);
		    //$('#i-'+key).attr('src', '{%$settings.path%}uploads/images/ts/'+val);
            //$("#h1-"+key).show(500);
            //$("#h2-"+key).show(500);
			}

		for(var key in yamaps)
			{
		    var val = yamaps[key];
		    $('#frame-'+key).attr('src', '{%$settings.path%}yamaps/?field='+key+'&point='+val);
		    $('#'+key).attr("value",val);
			}

		for(var key in files)
			{
		    //var val = files[key];
		    //$('#a-'+key).attr('href', '{%$settings.path%}uploads/files/'+val['filename']);
		    //$('#i-'+key).attr('src', val['ico']);
            //$("#h1-"+key).show(500);
            //$("#h2-"+key).show(500);
			}

		for(var key in fields)
			{
			if($.isArray(fields[key]))
				{

			    for(var k in fields[key])
				    {
				    var v = fields[key][k];
				    if(v == 'ON')
					    {
					    $('input[type=checkbox][name="'+key+'\['+k+'\]"]').attr("checked", "checked");
					    }
				    }
				}
			else
				{
				var val = fields[key];

				if($('input[name='+key+'][type=text]').length)
					{
					$('input[name='+key+'][type=text]').attr("value",val);
					}
				if($('input[name='+key+'][type=radio]').length)
					{
					$('input[name='+key+'][type=radio][value='+val+']').attr("checked", "checked");
					}
				if($('select[name='+key+']').length)
					{
					$('select[name='+key+'] option[value='+val+']').attr("selected", "selected");
					}
				if($('textarea[name='+key+']').length)
					{
					$('textarea[name='+key+']').html(val);
					}
	            }

			}

	    };

     loadS = function(cat)
            {
            if(fieldsHTML == 'none')
	            {
	            $("#search_fields").html('<center><img src="{%$settings.path%}images/ajax-loader.gif" height="19" /></center>');
		 	 	}
	 	 	$.ajax({
		     type: "GET",
		     url: "{%$settings.path%}search_ajax/",
		     cache: false,
		     data: "cat_id=" + cat,
		     success: function(html){
		     		if(html != fieldsHTML)
						{
						$("#search_fields").html(html);
                        fielS(fields);                                                
						}
					fieldsHTML = html;
				}
				});

            };
            
            
    fielS = function(fields)
	    {
		for(var k in must)
			{
            var v = must[k];
			if(v == 'ON')
				{
				$('input[type=checkbox][name="must['+k+']"]').attr("checked", "checked");
				}    		    
			}
		for(var k in cond)
			{
            var v = cond[k];
			if(v != '')
				{
				$('select[name=cond_f_'+k+'] option[value='+v+']').attr("selected", "selected");
				}    		    
			}
        if(sort_by != "")
            {
            $('input[name=sort_by][type=radio][value='+sort_by+']').attr("checked", "checked");
            }
        if(desc != "")
            {
            $('input[name=desc][type=checkbox]').attr("checked", "checked");
            }
		for(var key in fields)
			{ 
			if($.isArray(fields[key]))
				{
				
			    for(var k in fields[key])
				    {
				    var v = fields[key][k];
                   
				    if(k == 'over' || k == 'less')
                        {
                        $('input[name="'+key+'['+k+']"][type=text]').attr("value",v);
                        }
                    else
                        {
                        if(k == 'rate')
                            {
                            $('select[name="'+key+'['+k+']"] option[value='+v+']').attr("selected", "selected");
                            }
                        else
                            {
        				    if(v.length)
        					    {
        					       //alert('input[type=checkbox][name="'+key+'['+v+']"]');
        					    $('input[type=checkbox][name="'+key+'['+v+']"]').attr("checked", "checked");
        					    }                    
                            }
                        }

				    }
				}
			else
				{
				var val = fields[key];

				if($('input[name='+key+'][type=text]').length)
					{
					$('input[name='+key+'][type=text]').attr("value",val);
					}
				if($('input[name='+key+'][type=radio]').length)
					{
					$('input[name='+key+'][type=radio][value='+val+']').attr("checked", "checked");
					}
				if($('select[name='+key+']').length)
					{
					$('select[name='+key+'] option[value='+val+']').attr("selected", "selected");
					}
				if($('textarea[name='+key+']').length)
					{
					$('textarea[name='+key+']').html(val);
					}

	            }

			}

	    };

  $('#MessagesAction').click(function(event) {
      var str = "";
      var selected = false;
      $(".MessagesCheck").each(
        function(){
          var el = $(this);
          if(el.attr('checked') == "checked"){
              str = str + '&id[]=' + el.val();
              selected = true
          }
        }
      );
      if(selected == false){
          alert('{%$locale.986%}');
      }else{
          if(confirm('{%$locale.43%}')){
              $.ajax({
              type: "GET",
               url: "{%$settings.path%}group_actions/?ok"+str,
               cache: true,    
               success: function(html){
                  if(html == 'restore'){
                      document.location.href = "{%$settings.path%}restore/?array"+str
                  }else{
                      $(".MessagesCheck").each(
                        function(){
                          var el = $(this);
                          if(el.attr('checked') == "checked"){
                              $('#message_' + el.val()).hide('fast');
                          }
                        }
                      );
                  }
 
               }
              });   
          }                
      }
      event.preventDefault();   
});
	  
	  
	  
	  
	  
	  
        $('#MessagesSelect').click(function(event) {
            $(".MessagesCheck").each(
              function(){
                var el = $(this);
                if(el.attr('checked') == "checked"){
                    el.removeAttr('checked');
                }else{
                    el.attr('checked', 'checked');
                }
              }
            );
            event.preventDefault();  
        });
        $('#password1').focus(function(event) {
              var cont = $('#password2').parent().parent();
              if(cont.css('display') == 'none'){
                cont.show('fast');
              }
        });
        $('#password1').focusout(function(event) {
              var cont = $('#password2').parent().parent();
              if(cont.css('display') != 'none' && $('#password1').val() == ''){
                cont.hide('fast');
              }
        });
   
	});

function loadFields(cat)
	{

    if(first_dir == 'search')
        {
        loadS(cat);
    	}
    else
        {
    	loadF(cat);
    	setTimeout('fielF(fields)', timeout);        
        }
    }









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
	if (!elm.base)
        {
        elm.base = elm.value;
        }
	if (elm.value == elm.base) 
        {
        elm.value = '';
    	}
    else if (elm.value == '')
    {
    elm.value = elm.base;
	}
    }
function mp(img_this,img_src)
	{
	img_this.src=img_src;
	}


var d = document;
var offsetfromcursorY=15;
var ie=d.all && !window.opera;
var ns6=d.getElementById && !d.all;
var tipobj,op;

function Tip(el,txt) {
	tipobj=d.getElementById('tooltip');
	tipobj.innerHTML = txt;
	op = 0.1;
	tipobj.style.opacity = op;
	tipobj.style.visibility="visible";
	el.onmousemove=positiontip;
	appear();
}

function UnTip(el) {
	d.getElementById('tooltip').style.visibility='hidden';
	el.onmousemove='';
}

function ietruebody(){
return (d.compatMode && d.compatMode!="BackCompat")? d.documentElement : d.body;
}

function positiontip(e) {
	var curX=(ns6)?e.pageX : event.clientX+ietruebody().scrollLeft;
	var curY=(ns6)?e.pageY : event.clientY+ietruebody().scrollTop;
	var winwidth=ie? ietruebody().clientWidth : window.innerWidth-20;
	var winheight=ie? ietruebody().clientHeight : window.innerHeight-20;

	var rightedge=ie? winwidth-event.clientX : winwidth-e.clientX;
	var bottomedge=ie? winheight-event.clientY-offsetfromcursorY : winheight-e.clientY-offsetfromcursorY;

	if (rightedge < tipobj.offsetWidth)	tipobj.style.left=curX-tipobj.offsetWidth+"px";
	else tipobj.style.left=curX+"px";

	if (bottomedge < tipobj.offsetHeight) tipobj.style.top=curY-tipobj.offsetHeight-offsetfromcursorY+"px";
	else tipobj.style.top=curY+offsetfromcursorY+"px";
}

function appear() {
	if(op < 1) {
		op += 0.1;
		tipobj.style.opacity = op;
		tipobj.style.filter = 'alpha(opacity='+op*100+')';
		t = setTimeout('appear()', 10);
	}
    }



	
		var on = 0;
	function loadPopup() {
		if(on == 0) {
			$("#back").css("opacity", "0.9");
			$("#popup").fadeIn(0);
			$("#back").fadeIn(0);
			on = 1;
		}
	}

	function off() {
		if(on == 1) {
			$("#popup").fadeOut("normal");
			$("#back").fadeOut("normal");
			on = 0;
		}
	}
$(document).ready(function($) {

	$("#change_region").click(function() {
		$.ajax({
			url:'{%$settings.patch%}region_changer',
			type:'get',
			success: function(ret){
				$('div.region_content').html(ret);
				loadPopup();
			}

		})	

	});

	$("#region_changer").click(function() {
		var     url="{%$settings.path%}region_change?",
			el=$('#region_frame').contents();
		el.find('select option:selected').each(function(){

			url+='reg_id[]='+$(this).val()+'&';
		});

		location.href=url+'path='+encodeURIComponent(location.href);
	});

	$("div#back").click(function() {
		off();
	});

	$("div#close").click(function() {
		off();
	});
});