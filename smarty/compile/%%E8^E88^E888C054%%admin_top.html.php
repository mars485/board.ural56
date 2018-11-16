<?php /* Smarty version 2.6.25, created on 2018-04-18 16:16:54
         compiled from admin_top.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'cat', 'admin_top.html', 103, false),array('modifier', 'md5', 'admin_top.html', 104, false),array('modifier', 'date_format', 'admin_top.html', 350, false),)), $this); ?>
<html>
    <head>
    <title><?php echo $this->_tpl_vars['locale']['308']; ?>
 / <?php echo $this->_tpl_vars['mod']['name']; ?>
</title>
    <meta http-equiv='content-type' content='text/html; charset=<?php echo $this->_tpl_vars['locale']['charset']; ?>
' />
    <meta http-equiv='pragma' content='no-cache' />


    <link href='<?php echo $this->_tpl_vars['settings']['path']; ?>
admin/tpl/css/style.css' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="<?php echo $this->_tpl_vars['settings']['path']; ?>
admin/tpl/css/font-awesome-4.4.0/css/font-awesome.css">
    <script type="text/javascript" src="<?php echo $this->_tpl_vars['settings']['path']; ?>
js/jquery.js"></script>
    
    <script type="text/javascript" src="<?php echo $this->_tpl_vars['settings']['path']; ?>
js/tip.js"></script>
    <script type="text/javascript" src="<?php echo $this->_tpl_vars['settings']['path']; ?>
js/functions.js"></script>
    <script>
        var CKToolbal = 'Full';
    </script>
    <script src="<?php echo $this->_tpl_vars['settings']['path']; ?>
ckeditor/ckeditor.js"></script>
    <?php if (in_array ( $this->_supers['get']['unit'] , array ( 'fields' , 'nav' , 'blocks' , 'seo' , 'packages' ) )): ?>
        <script type="text/javascript" src="<?php echo $this->_tpl_vars['settings']['path']; ?>
js/jquery-ui-1.8.11.custom.min.js"></script> 
        <script type="text/javascript">
        $(document).ready(function(){
            
            var fixHelper = function(e, ui) {
                ui.children().each(function() {
                    $(this).width($(this).width());
                });
                $('#savesort').attr('disabled', false);
                $('#savesort').val('*<?php echo $this->_tpl_vars['locale']['872']; ?>
');        
                return ui;
            }; 
            $(".fields_sort tbody").sortable({
                helper: fixHelper
            }).disableSelection();
            
            $('#savesort').click(function(){
                var sort = [];
                $(".fields_sort tbody tr").each(function() {
                    sort.push($(this).attr('data-id'));
                });
                $.ajax({
                    type: "POST",
                    data: {data:sort},
                    url: "?unit=<?php echo $this->_supers['get']['unit']; ?>
&act=savesort",
                    cache: true,
                    success: function(html){
                        if(html == 'ok'){
                            $('#savesort').attr('disabled', true);
                            $('#savesort').val('<?php echo $this->_tpl_vars['locale']['872']; ?>
');
                        }else{
                            alert(html);
                        }
                    }
                });
        
            });
            $('.block_type_cat').click(function(){
                $('.block_type_select').attr('disabled', 'disabled');
                $('.block_type_ajax').removeClass('block_type_disabled');
            });
            $('.block_type_mod').click(function(){
                $('.block_type_select').removeAttr('disabled');
                $('.block_type_ajax').addClass('block_type_disabled');
            });
        });



        </script>
        <style>
        .block_type_disabled{
            pointer-events: none;
            opacity: 0.4;
        }
        </style>
    <?php elseif ($this->_supers['get']['unit'] == 'cat' || $this->_supers['get']['unit'] == 'region'): ?>
    
        <script type="text/javascript" src="<?php echo $this->_tpl_vars['settings']['path']; ?>
js/jquery-ui-1.8.11.custom.min.js"></script> 
        <script type="text/javascript" src="<?php echo $this->_tpl_vars['settings']['path']; ?>
js/jquery.ui.nestedSortable.js"></script>
    	
        <script type="text/javascript">
          $(document).ready(function(){
        
    
            $('ol.sortable').nestedSortable({
              disableNesting: 'no-nest',
              forcePlaceholderSize: true,
              handle: 'div',
              helper:  'clone',
              items: 'li',
              /*maxLevels: 3,*/
              opacity: .6,
              placeholder: 'placeholder',
              revert: 250,
              tabSize: 25,
              tolerance: 'pointer',
              toleranceElement: '> div',
              stop: function(){
                $('#savesort').attr('disabled', false);
                $('#savesort').val('*<?php echo $this->_tpl_vars['locale']['872']; ?>
');
                }
            });
        
            <?php $this->assign('ajax_key', ((is_array($_tmp=$this->_tpl_vars['settings']['admin_login'])) ? $this->_run_mod_handler('cat', true, $_tmp, $this->_tpl_vars['settings']['admin_password']) : smarty_modifier_cat($_tmp, $this->_tpl_vars['settings']['admin_password']))); ?>
            <?php $this->assign('ajax_key', ((is_array($_tmp=$this->_tpl_vars['ajax_key'])) ? $this->_run_mod_handler('md5', true, $_tmp) : md5($_tmp))); ?>
        
        
            function reindex2(){
                $.ajax({
                    type: 'POST',
                    url: '?indexing=recount',
                    data: 'key=<?php echo $this->_tpl_vars['ajax_key']; ?>
&unit=<?php echo $this->_supers['get']['unit']; ?>
',
                    //async: false,
                    success: function(data) {
                        if(data.status == 1){
                            $('#savesort').val('<?php echo $this->_tpl_vars['locale']['1316']; ?>
 '+data.load+'...');
                            reindex2();
                        }else{
                            if(data.status == 0){
                                $('#savesort').val('<?php echo $this->_tpl_vars['locale']['872']; ?>
');
                                $('#savesort').attr('disabled', true);
                            }else{
                                reindex2();
                            }
                        }
                    }, 
                    error: function(jqXHR) {
                        console.log(jqXHR);
                        reindex2();
                    }
                });  
            }
            function reindex3(link, disabled=false){
                if(disabled){
                    document.location.href=link;
                    return true;
                }
                $.ajax({
                    type: 'POST',
                    url: '?indexing=recount',
                    data: 'key=<?php echo $this->_tpl_vars['ajax_key']; ?>
&unit=<?php echo $this->_supers['get']['unit']; ?>
',
                    success: function(data) {
                        if(data.status == 1){
                            $('#reindex_info').html('<i class="fa fa-spinner fa-pulse fa-fw"></i> <?php echo $this->_tpl_vars['locale']['1319']; ?>
 '+data.load+'...');
                            reindex3(link);
                        }else{
                            if(data.status == 0){
                                $('#reindex_info').html('<?php echo $this->_tpl_vars['locale']['752']; ?>
!');
                                document.location.href=link;
                            }else{
                                reindex3(link);
                            }
                        }
                    }, 
                    error: function(jqXHR) {
                        console.log(jqXHR);
                        reindex3(link);
                    }
                });  
            }
            
            reindex4 = function(link, disabled=false){
                $('#reindex_info').html('<i class="fa fa-spinner fa-pulse fa-fw"></i> <?php echo $this->_tpl_vars['locale']['1318']; ?>
 ');
                reindex3(link, disabled);
            }
            
            $('#savesort').click(function(){
              serialized = $('ol.sortable').nestedSortable('serialize');
        
                  $.ajax({
                    type: "POST",
                    data: serialized,
                     url: "<?php echo $this->_tpl_vars['settings']['patch']; ?>
admin/?unit=<?php echo $this->_supers['get']['unit']; ?>
&act=savesort&cat=<?php echo $this->_supers['get']['cat']; ?>
",
                     cache: true,
                     success: function(html){
                        if(html == 'ok')
                        {
                        reindex2();
                        } 
                     else
                         {
                         alert(html);
                         }
                     }
                  });
        
            });
        
          });
    
    
    
        </script>

    <?php endif; ?>
    
    
    
  <script type="text/javascript">

  function sh(id)
    {
    var klappText = document.getElementById('s' + id);
    if (klappText.style.display == 'none')
      {
      klappText.style.display = 'block';
      }
    else
      {
      klappText.style.display = 'none';
      }
    }
  function mp(img_this,img_src)
    {
    img_this.src=img_src;
    }
  </script>

    <?php echo $this->_tpl_vars['add_head']; ?>

		    <script>
			

    $(document).ready(function(){
        var admin_counter = 0;
        var admin_counter_timeout = 20000;
      $(document).ready(function($) {

  
        function check_admin_counter() {
              $.ajax({
                url: '?unit=edit&act=counter',
                success: function(data) {
                  if($.isNumeric(data)){
                    $('#count').html(+ data);
                    admin_counter = data;
                  }
                }
              });
              setTimeout(check_admin_counter, admin_counter_timeout); 
            }
           check_admin_counter();
        });
        
        

        var multiselect_prev = 0;
        function make_select_field_admin(obj, type, id_start, main_cont, root_cat = true){
            var valueobj = main_cont.find('.multiselect_value');
            var loadobj = main_cont.find('.multiselect_load');
            multiselect_prev = valueobj.val();
            valueobj.val(id_start);
            loadobj.show();
            $.ajax({
                type: "GET",
                url: "../ajax_data/list/"+type+"/",
                cache: false,
                data: 'id='+id_start,
                success: function(data){
                    var cnt = 0;
                    loadobj.hide();
                    $.each(data, function( i, val ) {
                        cnt++; // :(
                    });
                    
                    if(cnt > 0){
                        var select_cont = $("<div></div>");
                        var select = $("<select class='form-control' size=1></select>");
                        var text_root_cat = "<?php echo $this->_tpl_vars['locale']['1328']; ?>
";
                        if(root_cat) text_root_cat = "<?php echo $this->_tpl_vars['locale']['312']; ?>
";
                        select.append("<option value=0>"+text_root_cat+"</option>");
                        $.each(data, function( i, val ) {
                            select.append("<option value='"+val.id+"'>"+val.name+"</option>");
                        });   
                        select_cont.append(select);
                        obj.append(select_cont);
                        select.on("change", function(e) {
                            select_cont.find('div').remove();
                            id_start = $(this).val();
                            if(id_start != 0){
                                make_select_field_admin(select_cont, type, id_start, main_cont, false);
                            }else{
                                valueobj.val(multiselect_prev);
                            }
                            
                            
                        });
                    }
                    return false;
    
    
                }
            });
        } 
                   
        $('.multiselect_change').click(function (e) {
            var main_cont = $(this).parents('.multiselect_root');
            main_cont.find('.multiselect_text').hide();
            var obj = main_cont.find(".multiselect_admin");
            var type = obj.attr("data-name");
            var rootvalue = obj.attr("data-root");
            make_select_field_admin(obj, type, 0, main_cont);
            main_cont.find('.multiselect_cont').show();
            e.preventDefault();
        });        
    
    });
    </script>
<script type='text/javascript'>
//<![CDATA[
$(function(){
 if ($(window).scrollTop()>="250") $("#ToTop").fadeIn("slow")
 $(window).scroll(function(){
  if ($(window).scrollTop()<="250") $("#ToTop").fadeOut("slow")
  else $("#ToTop").fadeIn("slow")
 });

 if ($(window).scrollTop()<=$(document).height()-"999") $("#OnBottom").fadeIn("slow")
 $(window).scroll(function(){
  if ($(window).scrollTop()>=$(document).height()-"999") $("#OnBottom").fadeOut("slow")
  else $("#OnBottom").fadeIn("slow")
 });

 $("#ToTop").click(function(){$("html,body").animate({scrollTop:0},"slow")})
 $("#OnBottom").click(function(){$("html,body").animate({scrollTop:$(document).height()},"slow")})
});
//]]>
</script>
	</head>
	<body>
	<!--Кнопки наверх и вниз-->
<div class="go-up" title="<?php echo $this->_tpl_vars['locale']['246']; ?>
" id='ToTop'><i class="fa fa-sort-asc"></i></div>
<div class="go-down" title="<?php echo $this->_tpl_vars['locale']['247']; ?>
" id='OnBottom'><i class="fa fa-sort-desc"></i></div>



     <div id='mess' class='tip'></div>
     <div class="navbar">  
      <div class="navbar-inner">
		  
          <div class="brand" >
              <i class="fa fa-cog"></i><?php echo $this->_tpl_vars['locale']['607']; ?>
: 
              <a target='_blank' href="<?php echo $this->_tpl_vars['settings']['path']; ?>
">
               <?php echo $this->_supers['server']['SERVER_NAME']; ?>

              </a>
          </div>
          <div class="nav-collapse">
            <ul class="nav">
              <li><a href='../' target='_blank'><i class="icn-eye--pencil link-icon-left"></i> <?php echo $this->_tpl_vars['locale']['249']; ?>
</a></li>
              <li><a href='?unit=conf#indexing'><i class="icn-broom link-icon-left"></i> <?php echo $this->_tpl_vars['locale']['953']; ?>
</a></li>
              <li><a href='out.php' target='_blank'><i class="icn-door-open-out link-icon-left"></i> <?php echo $this->_tpl_vars['locale']['250']; ?>
</a></li>
              <li><a href="#"><i class="icn-clock link-icon-left"></i> <?php echo ((is_array($_tmp=$this->_tpl_vars['settings']['time'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%Y-%m-%d %H:%M") : smarty_modifier_date_format($_tmp, "%Y-%m-%d %H:%M")); ?>
</a></li>
            </ul>
          </div>      

      </div>
    </div>  
	
    <table width="100%" cellpadding="0" cellspacing="0">
    <tr><td valign="top" style="width: 250px; ">
	<div id="left_menu_t">
	
       <div id="pri_menu_t">
	      <div id="ava"><i class="fa fa-user"></i></div>
		  <div id="privet"><span class="privet_s"><?php echo $this->_tpl_vars['locale']['18']; ?>
,</span><br/><?php if ($this->_tpl_vars['settings']['user']): ?><?php echo $this->_tpl_vars['settings']['user']['name']; ?>
<?php else: ?><?php echo $this->_tpl_vars['locale']['1325']; ?>
<?php endif; ?></div>
       </div>
	   
	
	
	
	   <div id="count_t"><div id="nov"><a href="?unit=edit"><?php echo $this->_tpl_vars['locale']['1326']; ?>
</a></div><div id="count"></div></div>

    <div id="left_menu_m">
    <ul class="dropdown-menu span3 leftside adminnav" aria-labelledby="dropdownMenu" role="menu">
    <?php $_from = $this->_tpl_vars['modules']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['m']):
?>
        <?php if ($this->_tpl_vars['m']['name'] != ""): ?>
            <li <?php if ($this->_supers['get']['unit'] == $this->_tpl_vars['m']['id']): ?> class="actives_menu"<?php endif; ?>>
                <a href="?unit=<?php echo $this->_tpl_vars['m']['id']; ?>
">
                    <i class="fa <?php if (isset ( $this->_tpl_vars['modules_classes'][$this->_tpl_vars['m']['id']] )): ?><?php echo $this->_tpl_vars['modules_classes'][$this->_tpl_vars['m']['id']]; ?>
<?php else: ?>fa-square-o<?php endif; ?>"></i>
                    <?php echo $this->_tpl_vars['m']['name']; ?>

                </a>
            </li>
        <?php endif; ?>
    <?php endforeach; endif; unset($_from); ?>
    </ul>
  </div>
  <div style="" class="right-blocks-dropdown span3 leftside adminnav">
    	<h3><i class="fa fa-server"></i><?php echo $this->_tpl_vars['locale']['1072']; ?>
:</h3>
    	<?php $_from = $this->_tpl_vars['infoblock']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['inf']):
?>
    	<ul>
       	<li><?php echo $this->_tpl_vars['inf']['k']; ?>
: <b><?php echo $this->_tpl_vars['inf']['v']; ?>
</b></li>
	</ul>
  <?php endforeach; endif; unset($_from); ?>
	</div>
	<div  class="right-blocks-dropdown span3 leftside adminnav">
	<h3><i class="fa fa-user-md"></i><?php echo $this->_tpl_vars['locale']['1327']; ?>
:</h3>
  <iframe src='//illusionweb.org/board_support/' style=' height:250px;' frameborder='no'></iframe>
	</div>
	</div>
      </td>
      <td  valign="top" id="right_menu_t">
    
<h1><?php echo $this->_tpl_vars['mod']['name']; ?>
</h1>
