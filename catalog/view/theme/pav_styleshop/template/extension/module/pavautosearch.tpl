<div class="<?php echo $additional_class; ?>search_block">
	<form method="GET" action="index.php">
	<?php if(!empty($categories)) { ?>
	<div class="filter_type category_filter">
		<i class="fa fa-angle-down"></i>
		<select name="category_id">
			<option value="0"><?php echo $objlang->get("text_category_all"); ?></option>
			<?php foreach ($categories as $category_1) { ?>
	        <?php if ($category_1['category_id'] == $category_id) { ?>
	        <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
	        <?php } else { ?>
	        <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
	        <?php } ?>
	        <?php foreach ($category_1['children'] as $category_2) { ?>
	        <?php if ($category_2['category_id'] == $category_id) { ?>
	        <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
	        <?php } else { ?>
	        <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
	        <?php } ?>
	        <?php foreach ($category_2['children'] as $category_3) { ?>
	        <?php if ($category_3['category_id'] == $category_id) { ?>
	        <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
	        <?php } else { ?>
	        <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
	        <?php } ?>
	        <?php } ?>
	        <?php } ?>
	        <?php } ?>
		</select>
	</div>
	<?php } ?>
	<div id="search<?php echo $module ?>" class="search">
	    <input type="text" value="" size="35" autocomplete="off" placeholder="<?php echo $objlang->get("text_search");?>" name="search">
	    <button type="submit" class="button button-search" name="submit_search"><i class="fa fa-search"></i></button>
	</div>
	<input type="hidden" name="sub_category" value="1" id="sub_category"/>
	<input type="hidden" name="route" value="product/search"/>
	<input type="hidden" name="sub_category" value="true" id="sub_category"/>
	<input type="hidden" name="description" value="true" id="description"/>
	</form>
	<div class="clear clr"></div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	var selector = '#search<?php echo $module ?>';
	var text_price = "<?php echo $objlang->get("text_price");?>";
	var total = 0;
	var show_image = <?php echo ($show_image==1)?'true':'false';?>;
	var show_price = <?php echo ($show_price==1)?'true':'false';?>;
	var search_sub_category = true;
	var search_description = true;
	var width = 102;
	var height = 102;

	$(selector).find('input[name=\'search\']').autocomplete({
		delay: 500,
		source: function(request, response) {
			var category_id = $(".category_filter select[name=\"category_id\"]").first().val();
			if(typeof(category_id) == 'undefined')
				category_id = 0;
			var limit = <?php echo $limit;?>;
			var search_sub_category = search_sub_category?'&sub_category=true':'';
			var search_description = search_description?'&description=true':'';
			$.ajax({
				url: 'index.php?route=extension/module/pavautosearch/autocomplete&filter_category_id='+category_id+'&width='+width+'&height='+height+'&limit='+limit+search_sub_category+search_description+'&filter_name='+encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {		
					response($.map(json, function(item) {
						if($('.pavautosearch_result')){
							$('.pavautosearch_result').first().html("");
						}
						total = 0;
						if(item.total){
							total = item.total;
						}
						return {
							price: item.price,
							label: item.name,
							image: item.image,
							link:  item.link,
							value: item.product_id
						}
					}));
				}
			});
		},
		select: function(event, ui) {
			return false;
		},
		focus: function(event, ui) {
	      	return false;
	   	}
	})
		$(selector).find('input[name=\'search\']').data( "autocomplete" )._renderMenu = function(ul,b){
			var g=this;
			$.each(b,function(c,f){g._renderItem(ul,f)});
			var category_id = $(".category_filter select[name=\"category_id\"]").first().val();
			category_id = parseInt(category_id);
			var text_view_all = '<?php echo $objlang->get("text_view_all"); ?>';
			text_view_all = text_view_all.replace(/%s/gi, total);
			return $(ul).append('<li><a href="index.php?route=product/search&search='+g.term+'&category_id='+category_id+'&sub_category=true&description=true" onclick="window.location=this.href">'+text_view_all+'</a></li>');
		};
		$(selector).find('input[name=\'search\']').data( "autocomplete" )._renderItem = function( ul, item ) {
			var html = '<ol>';
			if(show_image){
				html += '<img style="float:left; margin:3px 8px 0 0;" src="'+item.image+'">';
			}
			html += '<strong><div class="std">'+item.label+'</div></strong>';
			if(show_price){
				var text_price = "";
				if (item.price) {
					text_price += '<div class="price">';
					if (!item.special) {
					 text_price += item.price;
					} else {
					 text_price += '  <span class="price-old">'+item.price+'</span> <span class="price-new">'+item.special+'</span>';
					}
					if (item.tax) {
				        item.text_price += '<br />';
				        item.text_price += '<span class="price-tax"><?php echo $objlang->get("text_tax");?> '+item.tax+'</span>';
			        }
					text_price += '</div>';
				}
				html += '<p style="font-size:0.9em;line-height:1.4em;margin:2px 0 0;"></p><div class="std"><?php echo $objlang->get("text_price");?>'+item.price;	
			}
			
			html += '</div><br class="clear clr"/></ol>';
			var li_element = $("<li></li>").data("item.autocomplete",item).append(html).appendTo(ul);
			
			$(li_element).click(function(el){
				$(selector+' input[name=\'search\']').val('');
				if(item.link){
					window.location = item.link.replace(/&amp;/gi,'&');
				}
			});
			
			return li_element;
		};
})
</script>