CKEDITOR.plugins.add( 'cuttable',
{
	init: function( editor )
	{
        editor.addCommand( 'insertCut',
        	{
        		exec : function( editor )
        		{    
                    var element = CKEDITOR.dom.element.createFromHtml('<hr class="cut" />');
                    editor.insertElement( element );
        			//editor.insertHtml( "<hr class=\"cut\">" );
        		}
        	});
        editor.ui.addButton( 'InsCut',
        {
        	label: 'Разрыв страницы (читать далее)',
        	command: 'insertCut',
        	icon: this.path + 'cuttable.png'
        } );
	}
} );