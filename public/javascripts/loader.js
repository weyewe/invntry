
$(document).ready(function()
{
	//----------------------------
	//      Web charts
	//----------------------------	
	$('table.stats').each(function() {
					
					if($(this).attr('rel')) {
									var statsType = $(this).attr('rel');
					} else {
									var statsType = 'area';
					}
					
					var chart_width = ($(this).parent('div').width()) - 20;					
													
					if(statsType == 'line' || statsType == 'pie') {     
						$(this).hide().visualize({
							type: statsType,    // 'bar', 'area', 'pie', 'line'
							width: chart_width,
							height: '240px',
							colors: ['#6fb9e8', '#ec8526', '#9dc453', '#ddd74c'],							
							lineDots: 'double',
							interaction: true,
							multiHover: 5,
							tooltip: true,
							tooltiphtml: function(data) {
								var html ='';
								for(var i=0; i<data.point.length; i++){
												html += '<p class="chart_tooltip"><strong>'+data.point[i].value+'</strong> '+data.point[i].yLabels[0]+'</p>';
								}   
								return html;
							}
						});
				} else {
						$(this).hide().visualize({
							type: statsType,    // 'bar', 'area', 'pie', 'line'
							width: chart_width,
							height: '240px',
							colors: ['#6fb9e8', '#ec8526', '#9dc453', '#ddd74c']
						});
					}
	});
	//----------------------------
	//        Box toggling
	//----------------------------
	function boxToggle(target)
	{		
		var boxparent = $(target).closest('.box'); //get box parent element
		
		if($(boxparent).hasClass("hidden")) //parent is hidden //toggle box parent
		{						
			$(boxparent).removeClass("hidden"); //remove hidden css class			
			$(boxparent).children('.content').slideDown(); //show box content
		}
		else
		{
			//parent is visible			
  	$(boxparent).addClass("hidden"); //apply hidden css class
			$(boxparent).children('.content').slideUp(); //hide box content
		}
	}
	/*Triggers*/	
	$('.toggle').click(function(e)  /*toggle button*/
	{
		e.preventDefault();	
		boxToggle($(this));
	});
	
	$('.box .header h2 a').click(function(e) /*header title*/
	{
	  if( $(this).hasClass("addEntry") ){
	    e.preventDefault();	
	  }else{
	    e.preventDefault();	
  		boxToggle($(this));
	  }
		
	});
	
	//----------------------------
	//        		Tabs
	//----------------------------
	// loop through all tabs container and
	// perform actions
		$('div.tabs').each(function(index) {					
				
			 $(this).children('.tab').hide(); //hide all tabs from current tabs container				 
			 //set containers variables
			 var container = $(this);
		  var tabContainers = $(this).children('.tab')			  
		  
		  tabContainers.hide().filter(':first').show().addClass("active"); //show first tab in list and set to active			  
		  
		  $('ul.navigation li',this).click(function() //handle tab navigation click events
		  {			  	
		   $(this).parent().find('li a.current').removeClass("current"); //remove current state from navigation			   
		   $('a',this).addClass("current"); //add current state to clicked navigation			   
		   container.find('.tab.active').hide().removeClass("active"); //hide current tab			   			
		   //find tab to display and find it under the tabs container
		   var activeTab = $(this).find("a").attr("href");
		   $(activeTab,container).fadeIn().addClass("active");
		   
		   return false;

			});
				
		}); 
	//----------------------------
	//         Accordion
	//----------------------------		
	// loop through all accordions container and
	// perform actions
		$('div.accordion').each(function(index) {					
				
			 $(this).children('.panel').children('.content').hide(); //hide all contents from current accordion container				 
			 //set containers variables
			 var container = $(this);
			 var trigger = $(this).children('.panel');
		  var acordionContainer = $(this).children('.content');	
		  
		  acordionContainer.hide();
		  
		  acordionContainer.filter(':first').show();//show first tab in list and set to active			  
		  trigger.filter(':first').addClass('active');
		  trigger.click(function(e) //handle tab navigation click events
		  {
		  	e.preventDefault();
					if ( $(this).next ().is (':hidden') )
					{
					 trigger.removeClass('active').next().slideUp();
					 $(this).toggleClass('active').next().slideDown();
					}                   
					return false;
		  });
				
		});
	//----------------------------
	//        	Messages
	//----------------------------			
	$('.message .close').click(function()	{
			$(this).parent().fadeOut();
	});
	//----------------------------
	//     Child Navigation
	//----------------------------	
	if(!$('body').hasClass('altlayout'))
 {
		$("#navigation").superfish({ speed: 'fast',delay: 300, autoArrows: false });
	}
	$('.altlayout #navigation li a').click(function(e){		
		var target = $(this).attr("href");
		if(target == '#')
		{
				$(this).parent().siblings().find("ul").slideUp("normal"); 
				$(this).next().slideToggle("normal"); // Slide down the clicked sub menu
			//$('.altlayout #navigation li a').next().slideUp();
			//$(this).next().slideToggle('normal');
		}
	});
	// jQuery Facebox Modal
	$('a[rel*=modal]').facebox({ opacity: 0.6 }); 
	// jQuery Datables
	var dataTableCollection= new Object();
	$(".datatable").each(function(){
	  var id = $(this).attr("id");
	  dataTableCollection[id] = $(this).dataTable ({ "sPaginationType": "full_numbers" });
	});
  // $('.datatable').dataTable ({ "sPaginationType": "full_numbers" });
	// JQuery Uniform
	$("select, input[type='checkbox'], input[type='radio'], input[type='file']").uniform();
	// jQuery Tipsy
	$('[rel=tooltip]').tipsy({gravity:'s', fade:true}); // Tooltip Gravity Orientation: n | w | e | s
	// jQuery Superfish
	$("#menu").superfish({ speed: 'fast',delay: 300,autoArrows: false });
	
	
	//----------------------------
	//     App-specific
	//----------------------------
	$("form#new_master_category input.modal_submit").live('click', function(){
    $(this).hide();
    var form = $(this).parents("form.modal_form");
    $("img.ajax-loader", form).show();
    $.ajax({
      url: form.attr('action'),
      type: "POST",
      data: form.serialize(),
      dataType: "json",
      success: function( returnValue ){
        // alert( returnValue.length ) ;
        // add to the corresponding dataTable
        // if save is successful
        // addToDataTable( returnValue ); 
        // else 
        // add the error notification
        // end
        // console.log( returnValue instanceof Array  ) ;
        //     console.log( returnValue );
        //     
        //     for( var property in  returnValue ) {
        //       console.log( property );
        //     }
        var category = returnValue["category"];
        var edit_href = $("a#edit_category_link").attr("href").replace(/:id/g, category["id"]);
        var edit_link = "<a href=\"" + edit_href + "\" >Edit</a>";
        dataTableCollection["category"].fnAddData(
            [category["name"], 29, edit_link ]
          );
        // $("table#category").fnAddData([category["name"], 29, "Boom | Desob"]);
      }
    });
    
    $.facebox.close(); 
	  return false;
	  
	});
	
	
	// add the loader to all modal_submit
	$("form input.modal_submit").each(function(){
	  var ajax_loader = $("img#ajax-loader").clone();
	  ajax_loader.attr("id", "");
	  $(this).after( ajax_loader );
	});
});