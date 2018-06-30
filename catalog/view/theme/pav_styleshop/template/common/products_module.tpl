<?php 
	$cols = 4;
	$span = 12/$cols;
	$config = $sconfig; 
	$theme = $themename;
	$themeConfig  	 			= (array)$config->get('themecontrol');
	$listingConfig  			= array( 		
		'category_pzoom' 		=> 1,
		'show_swap_image' 		=> 0,
		'quickview' 			=> 1,
		'product_layout'		=> 'default',
		'catalog_mode'			=> '',
	); 
	$listingConfig  			= array_merge($listingConfig, $themeConfig );
	$categoryPzoom 	    		= $listingConfig['category_pzoom'];
	$quickview 					= $listingConfig['quickview'];
	$swapimg 					= ($listingConfig['show_swap_image'])?'swap':'';
 

	$productLayout = DIR_TEMPLATE.$theme.'/template/common/product/'.$listingConfig['product_layout'].'.tpl';	
	if( !is_file($productLayout) ){
		$listingConfig['product_layout'] = 'default';
	}
	$productLayout = DIR_TEMPLATE.$theme.'/template/common/product/'.$listingConfig['product_layout'].'.tpl';	 

?>
<div class="box-heading">
	<span class="title"><?php echo $heading_title; ?></span>
</div>  
<div class="box-content">		
	<?php foreach ($products as $i => $product) { $i=$i+1; ?>
	<?php if( $i%$cols == 1 && $cols > 1 ) { ?>
	<div class="row product-items last">
		<?php } ?> 
		<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-6 col-xs-12 product-cols">
			<?php require( $productLayout );  ?>   	
		</div>		
		<?php if( ($i%$cols == 0 || $i==count($products) ) && $cols > 1 ) { ?>
	</div>
	<?php } ?>			
	<?php } ?>		
</div>		