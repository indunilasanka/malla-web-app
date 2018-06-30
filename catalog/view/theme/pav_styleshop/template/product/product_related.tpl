<?php if ($products) { ?>

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

<div class="box product-related clearfix">
	<div class="box-heading heighlight"><span><?php echo $heading_title; ?> (<?php echo count($products); ?>)</span></div>

	<div id="related" class="slide row-fuild" data-interval="0">
		<?php if( count($products) > $cols ) { ?> 
	    <div class="carousel-controls">
	      <a class="carousel-control left fa fa-angle-left" href="#related" data-slide="prev"></a>
	      <a class="carousel-control right fa fa-angle-right" href="#related" data-slide="next"></a>
	    </div>
	    <?php } ?>

	    <div class="box-content carousel-inner">
	    	<?php  $pages = array_chunk( $products, $cols); ?>

	    	<?php foreach ($pages as  $k => $tproducts ) {   ?>
			<div class="item <?php if($k==0) {?>active<?php } ?>">
			<?php foreach( $tproducts as $i => $product ) {  $i=$i+1;?>
				<?php if( $i%$cols == 1 ) { ?>
				  <div class=" box-product">
				<?php } ?>
					<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-3 col-xs-12 product-cols">
						<?php require( $productLayout ); ?>
					</div>
				<?php if( $i%$cols == 0 || $i==count($tproducts) ) { ?>
				</div>
				<?php } ?>
			<?php } //endforeach; ?>
			</div>
			<?php } ?>				
	    </div>
	</div>
</div>

<?php } ?>