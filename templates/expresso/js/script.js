if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
  var msViewportStyle = document.createElement('style')
  msViewportStyle.appendChild(
    document.createTextNode(
      '@-ms-viewport{width:auto!important}'
    )
  )
  document.querySelector('head').appendChild(msViewportStyle)
};

var nua = navigator.userAgent
var isAndroid = (nua.indexOf('Mozilla/5.0') > -1 && nua.indexOf('Android ') > -1 && nua.indexOf('AppleWebKit') > -1 && nua.indexOf('Chrome') === -1)
if (isAndroid) {
  $('select.form-control').removeClass('form-control').css('width', '100%')
};

$(function(){
  $(".panel-default:odd").addClass('active');
})

$(document).ready(function () {
    $('[data-toggle=offcanvas]').click(function () {
    $('.row-offcanvas').toggleClass('active')
    });

    $('.a-submit').click(function(event) {
        var block_search = $(this).parents('.block_search');
        var el = block_search.find('.'+$(this).attr('data-var'));
        el.val($(this).attr('data-value'));
        block_search.find('form').submit();
        event.preventDefault();
      });
    $('#search_btn').click(function(event) {
        $('.search_panel').toggle();
        event.preventDefault();
      });         
    $('.gotomap').click(function(event) {
        var cont = $(this).parents('div');
        var form_search = cont.find('form[name=block_search]');
        $('.add_map').val(1);
        form_search.submit();
        event.preventDefault();
      });         
    $('.gotosite').click(function(event) {
        var form_search = $('form[name=block_search]');
        $('.add_map').val(0);
        form_search.submit();
        event.preventDefault();
      });   
          

    if($('.block_search').length > 0){
        var cat_id = $(this).find('.add_cat').val();
        var map = $(this).find('.add_map').val();
        var ajax_cont = $(this).find('.block_search_ajax');
        if (window.shop_id !== undefined) {
            $(".shop_id").val(shop_id);
            $(".shop_name").html(shop_name);
            $(".shop_search").show();
        }
        $.ajax({
            type: "GET",
            data: "cat_id=" + cat_id + "&map="+map,
            url: TPL_PATH+"search_ajax/",
            cache: true,
            success: function(html){
                ajax_cont.html(html);
                if (window.must !== undefined) {
            		for(var k in must){
                        var v = must[k];
            			if(v == 'ON'){
            				$('input[type=checkbox][name="must['+k+']"]').attr("checked", "checked");
           				}    		    
           			}
            		for(var k in cond){
                        var v = cond[k];
            			if(v != ''){
            				$('select[name=cond_f_'+k+'] option[value='+v+']').attr("selected", "selected");
           				}    		    
           			}
                    if(sort_by != ""){
                        $('input[name=sort_by][type=radio][value='+sort_by+']').attr("checked", "checked");
                    }
                    if(desc != ""){
                        $('input[name=desc][type=checkbox]').attr("checked", "checked");
                    }
            		for(var key in fields){ 
            			if($.isArray(fields[key])){
            			    for(var k in fields[key]){
            				    var v = fields[key][k];
                                if(v != ""){
                				    if(k == 'over' || k == 'less'){
                                        $('input[name="'+key+'['+k+']"][type=number]').attr("value",v);
                                    }else{
                                        if(k == 'rate'){
                                            $('select[name="'+key+'['+k+']"] option[value='+v+']').attr("selected", "selected");
                                        }else{
                        				    if(v.length){
                        					    $('input[type=checkbox][name="'+key+'['+v+']"]').attr("checked", "checked");
                       					    }                    
                                        }
                                    }
                                }
    				        }
        				}else{
            				var val = fields[key];
                            if(val != ""){
                				if($('input[name='+key+'][type=text]').length){
                					$('input[name='+key+'][type=text]').attr("value",val);
               					}
                				if($('input[name='+key+'][type=number]').length){
                					$('input[name='+key+'][type=number]').attr("value",val);
               					}
                				if($('input[name='+key+'][type=radio]').length){
                					$('input[name='+key+'][type=radio][value='+val+']').attr("checked", "checked");
               					}
                				if($('select[name='+key+']').length){
                					$('select[name='+key+'] option[value='+val+']').attr("selected", "selected");
               					}
                				if($('textarea[name='+key+']').length){
                					$('textarea[name='+key+']').html(val);
               					}
                            }

                        }
         			}
                }

            }
        });
    }
    
    
    $(".license").click(function (event) {
        $('#license_text').modal('toggle'); 
        event.preventDefault();        
    }); 
 
});