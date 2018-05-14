var fieldsHTML = 'none';
var maskOpts = false;
$(document).ready(function () {



    /*==================================
     Carousel
     ====================================*/

    // Featured Listings  carousel || HOME PAGE
    var owlitems = $(".item-carousel");
    var owl = new Array();
    owlitems.each(
      function(){
        var owl_item = $(this);
        var el_width = owl_item.width();
        var items=1;
        if(el_width > 400) items = 3;
        if(el_width > 600) items = 5;
        if(el_width > 1000) items = 8;
        owl_item.owlCarousel({
            //navigation : true, // Show next and prev buttons
            navigation: false,
            pagination: true,
            items: items,
            itemsDesktopSmall: [979, 3],
            itemsTablet: [768, 3],
            itemsTabletSmall: [660, 2],
            itemsMobile: [400, 1],
            autoPlay: TPL_AUTOROTATE,
            stopOnHover: true
        });
      }
    );


    // Custom Navigation Events
    $(".nextItem").click(function () {
        var target = $(this).parent().parent().find(".item-carousel");
        target.trigger('owl.next');
    })
    $(".prevItem").click(function () {
        var target = $(this).parent().parent().find(".item-carousel");
        target.trigger('owl.prev');
    })


    /*==================================
     Ajax Tab || CATEGORY PAGE
     ====================================*/


    $("#ajaxTabs li > a").click(function () {

        $("#allAds").empty().append("<div id='loading text-center'> <br> <img class='center-block' src='images/loading.gif' alt='Loading' /> <br> </div>");
        $("#ajaxTabs li").removeClass('active');
        $(this).parent('li').addClass('active');
        $.ajax({
            url: this.href, success: function (html) {
                $("#allAds").empty().append(html);
                $('.tooltipHere').tooltip('hide');
            }
        });
        return false;
    });

/*
    urls = $('#ajaxTabs li:first-child a').attr("href");
    //alert(urls);
    $("#allAds").empty().append("<div id='loading text-center'> <br> <img class='center-block' src='images/loading.gif' alt='Loading' /> <br>  </div>");
    $.ajax({
        url: urls, success: function (html) {
            $("#allAds").empty().append(html);
            $('.tooltipHere').tooltip('hide');

            // default grid view class invoke into ajax content (product item)
            $(function () {
                $('.hasGridView .item-list').addClass('make-grid');
                $('.hasGridView .item-list').matchHeight();
                $.fn.matchHeight._apply('.hasGridView .item-list');
            });
        }
    });
  */  

    /*==================================
     List view clickable || CATEGORY
     ====================================*/

    // List view , Grid view  and compact view

    //  var selector doesn't work on ajax tab category.hhml. This variables elements disable for V1.6
    //  var listItem = $('.item-list');
    //  var addDescBox = $('.item-list .add-desc-box');
    //  var addsWrapper = $('.adds-wrapper');

    $('.list-view,#ajaxTabs li a').click(function (e) { //use a class, since your ID gets mangled
        e.preventDefault();
        $('.grid-view,.compact-view').removeClass("active");
        $('.list-view').addClass("active");
        $('.item-list').addClass("make-list").removeClass("make-grid make-compact");


        if ($('.adds-wrapper').hasClass('property-list')) {
           $('.item-list .add-desc-box').removeClass("col-sm-10").addClass("col-sm-6");
        }else {
           $('.item-list .add-desc-box').removeClass("col-sm-10").addClass("col-sm-8");
        }

        $(function () {
            $('.item-list').matchHeight('remove');
        });
    });

    $('.grid-view').click(function (e) { //use a class, since your ID gets mangled
        e.preventDefault();
        $('.list-view,.compact-view').removeClass("active");
        $(this).addClass("active");
        $('.item-list').addClass("make-grid").removeClass("make-list make-compact");


        if ($('.adds-wrapper').hasClass('property-list')) {
           // keep it for future
        } else {
           //
        }

        $(function () {
            $('.item-list').matchHeight();
            $.fn.matchHeight._apply('.item-list');
        });

    });

    $(function () {
        $('.hasGridView .item-list').matchHeight();
        $.fn.matchHeight._apply('.hasGridView .item-list');
    });

    $(function () {
        $('.row-featured .f-category').matchHeight();
        $.fn.matchHeight._apply('.row-featured .f-category');
    });

    $(function () {
        $('.has-equal-div > div').matchHeight();
        $.fn.matchHeight._apply('.row-featured .f-category');
    });


    $('.compact-view').click(function (e) { //use a class, since your ID gets mangled
        e.preventDefault();
        $('.list-view,.grid-view').removeClass("active");
        $(this).addClass("active");
        $('.item-list').addClass("make-compact").removeClass("make-list make-grid");


       if ($('.adds-wrapper').hasClass('property-list')) {
           $('.item-list .add-desc-box').addClass("col-sm-10").removeClass('col-sm-6');
        } else {
            if($('.item-list .add-desc-box').hasClass("col-sm-8")){
                $('.item-list .add-desc-box').removeClass('col-sm-8').addClass("col-sm-10");
            }
           
        }

        $(function () {
            $('.adds-wrapper .item-list').matchHeight('remove');
        });


    });


    /*==================================
     Global Plugins ||
     ====================================*/

    $('.long-list').hideMaxListItems({
        'max': 5,
        'speed': 500,
        'moreText': TPL_L_07 + " ([COUNT])",
        'lessText': TPL_L_08 + " ([COUNT])"
    });

    $('.long-list-user').hideMaxListItems({
        'max': 5,
        'speed': 500,
        'moreText': TPL_L_07 + " ([COUNT])",
        'lessText': TPL_L_08 + " ([COUNT])"
    });

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

    //$(".scrollbar").scroller(); // custom scroll bar plugin
/*
    $("select.selecter").selecter({ // custom scroll select plugin
        label: "Select An Item",
        mobile: true
        });
    


    $(".selectpicker").selecter({ // category list Short by
        customClass: "select-short-by",
        mobile: true
    });
    */


    // smooth scroll to the ID
    $(document).on('click', 'a.scrollto', function(event){
        event.preventDefault();

        $('html, body').animate({
            scrollTop: $( $.attr(this, 'href') ).offset().top
        }, 500);
    });


    /*=======================================================================================
     cat-collapse Hmepage Category Responsive view
     ========================================================================================*/


    $(window).on('resize load', function () {


        if ($(this).width() < 767) {

            $('.cat-collapse').collapse('hide');

            $('.cat-collapse').on('shown.bs.collapse', function () {
                $(this).prev('.cat-title').find('.icon-down-open-big').addClass("active-panel");
                //$(this).prev('.cat-title').find('.icon-down-open-big').toggleClass('icon-down-open-big icon-up-open-big');
            });

            $('.cat-collapse').on('hidden.bs.collapse', function () {
                $(this).prev('.cat-title').find('.icon-down-open-big').removeClass("active-panel");
            })

            $('.user-panel-sidebar .panel-collapse').removeClass('in');
    
        } else {

            $('.cat-collapse').removeClass('out').addClass('in').css('height', 'auto');
            
            $('.user-panel-sidebar .panel-collapse').addClass('in');

        }

    });

    // DEMO PREVIEW

    $(".tbtn").click(function () {
        $('.themeControll').toggleClass('active')
    })

    // jobs

    $("input:radio").click(function () {
        if ($('input:radio#job-seeker:checked').length > 0) {
            $('.forJobSeeker').removeClass('hide');
            $('.forJobFinder').addClass('hide');
        } else {
            $('.forJobFinder').removeClass('hide');
            $('.forJobSeeker').addClass('hide')

        }

    })

    $(".filter-toggle").click(function () {
        $('.mobile-filter-sidebar').prepend("<div class='closeFilter'>X</div>");
        $(".mobile-filter-sidebar").animate({"left": "0"}, 250, "linear", function () {
        });
        $('.menu-overly-mask').addClass('is-visible');
    })
    $(".filter-toggle2").click(function () {
        $('.mobile-filter-sidebar2').prepend("<div class='closeFilter2'>X</div>");
        $(".mobile-filter-sidebar2").animate({"right": "0"}, 250, "linear", function () {
        });
        $('.menu-overly-mask').addClass('is-visible');
    })

    $(".menu-overly-mask").click(function () {
        $(".mobile-filter-sidebar").animate({"left": "-251px"}, 250, "linear", function () {
        });
        $(".mobile-filter-sidebar2").animate({"right": "-251px"}, 250, "linear", function () {
        });
        $('.menu-overly-mask').removeClass('is-visible');
    })


    $(document).on('click', '.closeFilter', function () {
        $(".mobile-filter-sidebar").animate({"left": "-251px"}, 250, "linear", function () {
        });
        $('.menu-overly-mask').removeClass('is-visible');
    });
    $(document).on('click', '.closeFilter2', function () {
        $(".mobile-filter-sidebar2").animate({"right": "-251px"}, 250, "linear", function () {
        });
        $('.menu-overly-mask').removeClass('is-visible');
        $(this).remove();
    });




    $("#checkAll").click(function () {
        $('.add-img-selector input:checkbox').not(this).prop('checked', this.checked);
    });

    $('.select_redirect').change(function() {
        if($(this).val() != ""){
            window.location = $(this).val();
        }
      
    });
    
    $('#autocomplete-ajax').autocomplete({
        serviceUrl: TPL_PATH + 'ajax_data/autocomplete/',
        onSelect: function (suggestion) {
            $('#ajax_region_id').val(suggestion.data);
        }
    });
/*
    $('#region-state').change(function() {
        var id=0;
        id = $(this).val();
        load_region_list(id);
    });
*/
    function make_region_redirect(id){
        if(TPL_REGION_ID != id){
            document.location.href = TPL_PATH + "ajax_data/redirect/?region="+id;
        }
    }   
    
    function load_region_list(id){
        current_region = id;
        $('#regionlist').hide();
        $('#region_loader_img').css('visibility', 'inherit');
        if(id == 0){
            $("#region_select_current").hide();       
        }
        $.ajax({
            type: "GET",
            url: TPL_PATH + "ajax_data/list/region/",
            cache: false,
            data: 'id='+id,
            success: function(data){
                var cnt = 0;
                $.each(data, function( i, val ) {
                    cnt++; // :(
                });
                
                
                if(TPL_REGION_ID == id && id !== 0 && cnt ==0){
                    $('#selectRegion').modal('toggle'); 
                    $('#regionlist').show();
                    return false;
                }
                
                
                if(cnt == 0){
                    make_region_redirect(id);
                }else{
                    $('#regionlist').html('');
                    $.each(data, function( i, val ) {
                        $('#region_loader_img').css('visibility', 'hidden');
                        $('#regionlist').show();
                        var class_name = '';
                        if(TPL_REGION_ID == val.id){
                            class_name = 'active';
                        }
                        $('#regionlist').append('<li><a href="#" class="'+class_name+'" id="rl'+val.id+'">'+val.name+'</li>');
                        $("#rl"+val.id).on("click", function(e) {
                            $('#region_select_current_name').html($(this).html());
                            $('#region_select_current').show();
                            load_region_list(val.id);
                            return false;
                        });
                    });   
                }
                


            }
        });
        
    }
    $(".selectRegion").click(function (event) {
        if(window.parent_region !== undefined){
            load_region_list(parent_region);
        }
    });

    $("#region_select_back").click(function (event) {
        if(back_region == 0 && current_region == 0){
            $('#selectRegion').modal('toggle'); 
            return false;
        }
        load_region_list(back_region);
        event.preventDefault();        
    });
    $("#region_select_all").click(function (event) {
        document.location.href = TPL_PATH + "change_region/?act=change_region&clean_region";
        event.preventDefault();        
    });
    $("#region_select_current").click(function (event) {
        make_region_redirect(current_region);
        event.preventDefault();
    });
    

    

    $('.btn-phone').click(function (e) {
        var el=$(this);
        var id=el.attr('id');
        var href=el.attr('href');
        if(href == '#'){
            $.ajax({
                type: "GET",
                url: TPL_PATH + "ajax_data/phone/",
                cache: false,
                data: 'data='+id,
                success: function(data){
                    if(data){
                        if(data.hide == '1'){
                            alert(TPL_L_00);
                        }else{
                            if(data.phone != ""){
                                el.children('span').html(data.phone);
                                el.attr('href', 'tel:'+data.phone);
                            }
                        }
                    }
                }
            });
            e.preventDefault();
        }

    });    
    $('.contact_modal').click(function (e) {
        $('#contact_iframe').attr('src', $(this).attr('href'));
        $('#contact_iframe').ready(function () {
            $('#contact_autor_div').modal('toggle');
        });
        e.preventDefault();
    });
    $('.premium_modal').click(function (e) {
        $('#premium_iframe').attr('src', $(this).attr('href'));
        $('#premium_iframe').ready(function () {
            $('#premium_div').modal('toggle');
        });
        e.preventDefault();
    });




    $('.blogs-comment-wrapper').mouseover(function() {
        $(this).find(".editblock").css('visibility', 'visible');
      });
    $('.blogs-comment-wrapper').mouseout(function() {
        $(this).find(".editblock").css('visibility', 'hidden');
      });
      
      
    $('.com_delete').click(function (e) {      
        var id=$(this).attr("data-id");
        var li=$(this).parent().parent().parent().parent();
        if(confirm(TPL_L_03)){
        	$.ajax({
            type: "GET",
            data: "id="+id+"&act=delete",
             url: TPL_PATH+"comment_edit/",
             cache: true,
             success: function(html){
                if(html == 'ok'){
                    li.hide(500);
                } 
             }
        	});
            
        }

        e.preventDefault();
    });      
    $('.com_edit').click(function (e) {
        var btns = $(this).parent();
        btns.hide();
        var el=$(this).parent().parent().find(".blogs-comment-description p");
        var id=$(this).attr("data-id");
        var user_text = el.html();
        var user_text2 = user_text.replace(/<br\s*[\/]?>/gi, "");
        el.html('');
        var editTextarea = $("<textarea class='form-control'>"+user_text2+"</textarea>");
        var editBtnSave = $("<a class='btn btn-success btn-sm' href=#>"+TPL_L_02+"</a>");
        var editBtnCansel = $("<a class='btn btn-warning btn-sm' href=#>"+TPL_L_01+"</a>");
        el.append(editTextarea);
        el.append(editBtnSave);
        el.append(editBtnCansel);
        editBtnCansel.on("click", function(e) {
            el.html(user_text);
            btns.show();
            return false;
        });
        editBtnSave.on("click", function(e) {
        	$.ajax({
                type: "POST",
                data: "id="+id+"&act=save&content="+editTextarea.val(),
                url: TPL_PATH+"comment_edit/",
                cache: true,
                success: function(ans){
                    el.html(ans);
                    btns.show();
                }
            });
            return false;
        });
        e.preventDefault();
    }); 
    
    
    
    function make_select_field(obj, type, id_start, action){
        $("#alert_"+type+"_success").hide();
        if(id_start != 0){
            $("#alert_"+type+"_warning").show();
        }
        $.ajax({
            type: "GET",
            url: TPL_PATH + "ajax_data/list/"+type+"/",
            cache: false,
            data: 'id='+id_start,
            success: function(data){
                var cnt = 0;
                $.each(data, function( i, val ) {
                    cnt++; // :(
                });
                
                if(cnt == 0){
                    $("#add_"+type).val(id_start);
                    if(id_start == 0){
                        $("#alert_"+type+"_success").hide();
                        $("#alert_"+type+"_warning").show();
                    }else{
                        $("#alert_"+type+"_success").show();
                        $("#alert_"+type+"_warning").hide();
                        if(action == 'load'){
                            load_adding_form(id_start);
                        }
                    }
                }else{
                    $("#add_"+type).val("");
                    var select_cont = $("<div></div>");
                    var select = $("<select class='form-control' size=1></select>");
                    select.append("<option value=''>"+TPL_L_04+"</option>");
                    $.each(data, function( i, val ) {
                        select.append("<option value='"+val.id+"'>"+val.name+"</option>");
                    });   
                    select_cont.append(select);
                    obj.append(select_cont);
                    select.on("change", function(e) {
                        select_cont.find('div').remove();
                        id_start = $(this).val();
                        make_select_field(select_cont, type, id_start, action)
                        
                    });
                }
                return false;


            }
        });
    }    
    


    $(".multiselect").each(function(){
        var obj = $(this);
        var type = obj.attr("data-name");
        var action = obj.attr("data-action");
        var id_start = 0;
        var id_default = obj.attr("data-default");
        if(id_default == "" || id_default == "0"){
            obj.find('p').remove();
            make_select_field(obj, type, id_start, action);
        }else{
            if(action == 'load'){
                load_adding_form(id_default);
            }
        }
      }
    );
    $(".multiselect a.btn").click(function (e) { 
        var obj = $(this).parent().parent();
        var type = obj.attr("data-name");
        var id_start = 0;
        var action = '';
        if(type == 'cat') action = 'load';
        make_select_field(obj, type, id_start, action);
        $(this).parent().remove();
        e.preventDefault();
    });  

    function load_adding_form(cat){
        $("#fields_loading").show();
        $.ajax({
            type: "GET",
            url: TPL_PATH+"add_fields/",
            cache: false,
            data: "c="+cat+"&form_id="+form_id,
            success: function(html){
            	if(html != fieldsHTML){
            		$("#fields").html(html);
                    $("#fields").find('label i').tooltip();
                    $("#fields").find('.calcletters').keyup(function (e) { 
                        calcletters($(this));
                    });
                    var phonefields = $("#fields").find('.phonemask');
                    if(phonefields.length > 0){
                        if(!maskOpts){
                            maskOpts = getMaskOpts();
                        }
                        phonefields.inputmasks(maskOpts);
                    }

            		for(var key in yamaps){
            		    var val = yamaps[key];
            		    $('#frame-'+key).attr('src', TPL_PATH+'yamaps/?field='+key+'&point='+val);
            		    $('#'+key).attr("value",val);
           			}
            		for(var key in fields){
            			if($.isArray(fields[key])){
            			    for(var k in fields[key]){
            				    var v = fields[key][k];
            				    if(v == 'ON'){
            					    $('input[type=checkbox][name="'+key+'\['+k+'\]"]').attr("checked", "checked");
           					    }
           				    }
           				}else{
            				var val = fields[key];
                            if(val != ""){
                				if($('input[name='+key+'][type=text]').length){
                					$('input[name='+key+'][type=text]').val(val);
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
            	fieldsHTML = html;
            }
        });
    }   
    
    function calcletters(el){
        var maxletters = el.attr('maxlength');
        if(maxletters != "" && maxletters != "0" && maxletters != 0){
            var box=el.val();
            var box_name = el.attr('name');
            var main = box.length *100;
            var value= (main / maxletters);
            var count= maxletters - box.length;
            if($('#bar_'+box_name).length == 0){
                el.parent().append($('<div class="bar" id="bar_'+box_name+'"><div></div></div>'));
            }
    		if(box.length <= maxletters){
    			$('#bar_'+box_name+' div').animate(
    			{
    				"width": value+'%',
    			}, 1);
    		}
            return true;
        }
    }
    
    
    $(".calcletters").keyup(function (e) { 
        calcletters($(this));
    });  
        
    /*
    $('#fields').on('mouseenter', 'label i', function() {
        $(this).tooltip('show');
    }); 
    $('#fields').on('mouseleave', 'label i', function() {
        $(this).tooltip('hide');
    }); 
    
    $('#fields').on('keyup', '.calcletters', function() {
        calcletters($(this));
    });
    */
    
    $("#password1").focusin(function (e) { 
        $("#password2").show();
        e.preventDefault();
    });  
    $("#password1").focusout(function (e) { 
        if($(this).val() == ""){
            $("#password2").hide();
        }
        e.preventDefault();
    });  

    $("#tag_block a").click(function (e) { 
        var tag = $(this).html();
        var tagsinput = $("#tagsinput");
        if(tag == ""){
            tagsinput.val("");
        }else{
            if(tagsinput.val() != ""){
                tagsinput.val(tagsinput.val() + ", " + tag);
            }else{
                tagsinput.val(tag);
            }
        }
        e.preventDefault();
    }); 
    
    $("#password2, #password1").keyup(function (e) { 
        compare_passwords();
    });    
 

    function compare_passwords(){
        var p1 = $("#password1").val();
        var p2 = $("#password2").val();
        if(p1.length < 6 && p1 != ""){
            $("#password_info").show();
        }else{
            $("#password_info").hide();
        }
        if(p1.length > 5 && p2.length > 1){
            if(p1 != p2){
                $("#password_success").hide();
                $("#password_warning").show();
            }else{
                $("#password_success").show();
                $("#password_warning").hide();
            }
        }
    }
    
    
    $(".m_delete").click(function (e) { 
        var id = $(this).attr('data-id');
        if(confirm(TPL_L_03)){
    		$.ajax({
                type: "GET",
                url: $(this).attr('href'),
                cache: false,
                success: function(html){
                    $('#message_'+id).hide(500);
                }
    		});
            
        }
        e.preventDefault();
    });
    
    
    $('#panel_delete').click(function(event) {
        var str = "";
        var selected = false;
        $(".panel_check").each(
          function(){
            var el = $(this);
            if(el.prop("checked")){
                str = str + '&id[]=' + el.val();
                selected = true;
            }
          }
        );
        if(selected == false){
            alert(TPL_L_06);
        }else{
            if(confirm(TPL_L_03)){
            	$.ajax({
                type: "GET",
                 url: TPL_PATH+"group_actions/?ok"+str,
                 cache: true,    
                 success: function(html){
                    if(html == 'restore'){
                        document.location.href = TPL_PATH+"restore/?array"+str
                    }else{
                        $(".panel_check").each(
                          function(){
                            var el = $(this);
                            if(el.prop("checked")){
                                $('#message_' + el.val()).hide(500);
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

    $('#panel_upd').click(function(event) {
        var str = "";
        var selected = false;
        var frm = $("#upd_form");
        frm.html("");
        $(".panel_check").each(
          function(){
            var el = $(this);
            if(el.prop("checked")){
                frm.append('<input type=hidden name=msg[] value='+el.val()+'>')
                selected = true;
            }
          }
        );
        if(selected == false){
            alert(TPL_L_06);
        }else{
            if(confirm(TPL_L_03)){
                 frm.submit();
            }                
        }
       	event.preventDefault();   
  });

  
    $('#shop_pay_prolong').click(function(event) {
        var el = $('#shop_pay_prolong_cont');
        if(el.css('display') == 'none'){
            el.show(500);
        }else{
            el.hide(500);
        }
        event.preventDefault();
      });




    

    if($('.phonemask').length > 0){
        if(!maskOpts){
            maskOpts = getMaskOpts();
        }
        $('.phonemask').inputmasks(maskOpts);
    }
    
    if($('#rphone').length > 0){
        var maskList = $.masksSort($.masksLoad(TPL_PATH_THEME+"assets/plugins/inputmask/phone-codes.json"), ['#'], /[0-9]|#/, "mask");
        var maskOpts = {
            inputmask: {
                definitions: {
                    '#': {
                        validator: "[0-9]",
                        cardinality: 1
                    }
                },
                clearIncomplete: false,
                showMaskOnHover: false,
                autoUnmask: true,
                oncomplete: function(){ 
                    var text1 = $(this).attr('data-text1');
                    $("#sendsms").attr('value', text1+': '+$(this).val());
                    $("#sendsms").attr('name', $(this).val());
                    $("#phone_confirm").show(500);
                } 
            },
            match: /[0-9]/,
            replace: '#',
            list: maskList,
            listKey: "mask",
            onMaskChange: function(maskObj, completed) {
                $(this).attr("placeholder", $(this).inputmask("getemptymask"));
            }
        };
        $('#rphone').inputmasks(maskOpts);
    }

	$('#sendsms').click(function(event){
    	var phonenumber = $(this).attr('name');
        var text1 = $(this).attr('data-text1');
    		$.ajax({
    	    type: "GET",
    	     url: TPL_PATH+"sendsms/?num="+phonenumber,
    	     cache: true,
    	     success: function(html){
    	     	if(html == 'ok')
    		     	{
    			    alert(text1+': '+phonenumber);
    		     	}
    			else
    				{
    			    alert(html);
    				}
    			}
   		});
        event.preventDefault();
	});    

    $('#changephone').click(function(event) {
        $("#phone_field").toggle(500);
        event.preventDefault();
      });

    function getMaskOpts(){
        var maskList = $.masksSort($.masksLoad(TPL_PATH_THEME+"assets/plugins/inputmask/phone-codes.json"), ['#'], /[0-9]|#/, "mask");
        var maskOpts = {
            inputmask: {
                definitions: {
                    '#': {
                        validator: "[0-9]",
                        cardinality: 1
                    }
                },
                //clearIncomplete: true,
                showMaskOnHover: false,
                autoUnmask: true
                //oncomplete: function(){ alert('inputmask complete'); } 
            },
            match: /[0-9]/,
            replace: '#',
            list: maskList,
            listKey: "mask",
            onMaskChange: function(maskObj, completed) {
                /*
                if (completed) {
                    var hint = maskObj.name_ru;
                    if (maskObj.desc_ru && maskObj.desc_ru != "") {
                        hint += " (" + maskObj.desc_ru + ")";
                    }
                    $("#descr").html(hint);
                } else {
                    $("#descr").html("Mask");
                }
                */
                
                // $("#date").inputmask("99/99/9999",{ "oncomplete": function(){ alert('inputmask complete'); } });
                $(this).attr("placeholder", $(this).inputmask("getemptymask"));
            }
        };
        return maskOpts;
    }

    $('.notepad').click(function(event){
        var id=$(this).attr("data-id");
        var el = $(this);
        var n_count = $('.n_count').html();
    	$.ajax({
        type: "GET",
         url: TPL_PATH + "fav/",
         cache: false,
         data: "id="+id,
         success: function(html){
            n_count = parseInt(n_count);
         	if(html == '1'){
   	            el.removeClass('btn-success',500);
    			el.addClass('btn-default',500);
                $('.n_count').html(n_count - 1);
  			}
         	if(html == '2'){
   	            el.removeClass('btn-default',500);
    			el.addClass('btn-success',500);
                $('.n_count').html(n_count + 1);
                $('.n_count').css('display', 'inline');
  			}

        }
	   });
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
 
    $(".license").click(function (event) {
        $('#license_text').modal('toggle'); 
        event.preventDefault();        
    });   
    $("#menu-user").mouseover(function (event) {
        $('.menu-user-content').show(); 
        event.preventDefault();        
    });   

    $('#menu-user').mouseenter(function(){
        if($(document).width() > 600){
            $("#menu-user-content").show(); 
        }
    });
	$('#menu-user,#menu-user-content').mouseleave(function(e){
		if(e.relatedTarget.id == 'menu-user' || e.relatedTarget.id == 'menu-user-content') return;
		$('#menu-user-content').hide();
	});
	   
        $('#welcome_region').modal('toggle'); 
        $("#welcome_region_cansel").click(function (event) {
            $('#welcome_region').modal('toggle'); 
            event.preventDefault();        
        });
        $("#welcome_region_change").click(function (event) {
            load_region_list(0);
            $('#welcome_region').modal('toggle');
            $('#welcome_region').on('hidden.bs.modal', function () {
                $('#selectRegion').modal('toggle');
                $('#welcome_region').off('hidden.bs.modal');  
            });
            event.preventDefault();        
        });

    function ScrollToFrom(msg){
        $('html, body').animate({
                scrollTop: $("#order_iframe").offset().top-100
            }, 1000);
        $('#order_iframe').attr('src', TPL_PATH+'services.html?message_id='+msg+'&service='+$('#load_order_iframe').attr('data-type'));     
    }
 
    $('#load_order_iframe .panel_check').click(function (event) {
        ScrollToFrom($(this).val());
    });
    
    if(window.ScrollToFromGl !== undefined) ScrollToFrom(ScrollToFromGl);       

}); // end Ready


	
