<?php
$span = 12/$cols; 
$id = rand(1,99) + rand();
$config = $sconfig;
$theme = $themename;
$themeConfig = (array)$config->get('themecontrol');
$listingConfig = array(
	'category_pzoom'                     => 1,
	'quickview'                          => 0,
	'show_swap_image'                    => 0,
	'product_layout'		             => 'default',
	'enable_paneltool'	                 => 0
);
$listingConfig      = array_merge($listingConfig, $themeConfig );
$categoryPzoom 	    = $listingConfig['category_pzoom'];
$quickview          = $listingConfig['quickview'];
$swapimg            = $listingConfig['show_swap_image'];
$categoryPzoom      = isset($themeConfig['category_pzoom']) ? $themeConfig['category_pzoom']:0; 

if( $listingConfig['enable_paneltool'] && isset($_COOKIE[$theme.'_productlayout']) && $_COOKIE[$theme.'_productlayout'] ){
	$listingConfig['product_layout'] = trim($_COOKIE[$theme.'_productlayout']);
} 
$productLayout = DIR_TEMPLATE.$theme.'/template/common/product/'.$listingConfig['product_layout'].'.tpl';	
if( !is_file($productLayout) ){
	$listingConfig['product_layout'] = 'default';
}
?>

<div class="box nopadding pav-categoryproducts clearfix">
	<?php if( !empty($module_description) ) { ?>
	<div class="module-desc">
		<?php echo $module_description;?>
	</div>
	<?php } ?>

	<div class="box-wapper">
		<div class="tab-nav">
			<ul class="nav nav-tabs" role="tablist" id="producttabs<?php echo $id;?>">
				<?php foreach( $tabs as $tab => $category ) { 
					if( empty($category) ){ continue;}
					$tab = 'cattabs';
					///	echo '<pre>'.print_r( $category,1 ); die; 
					$products = $category['products'];
					$caturl = $url->link('product/category', 'path='.$category['category_id']);
					?>
					<li  role="presentation"  class="<?php echo $category['class'];?> effect <?php echo $prefix_class ?>">
						<a href="#tab-cattabs<?php echo $id.$category['category_id'];?>" aria-controls="tab-cattabs<?php echo $id.$category['category_id'];?>" role="tab" data-toggle="tab" class="category_name box-heading">
							<span style="cursor: pointer;"><?php echo $category['category_name'];?></span>
						</a>
					</li>
				<?php } ?>
			</ul>			
		</div>

		<!-- ========Content======== -->
		<div class="tab-content <?php echo $prefix_class ?>"> 
			<?php foreach( $tabs as $tab => $category ) { 
				if( empty($category) ){ continue;}
				$tab = 'boxcats';
				$products = $category['products'];

				$icon = $model_resize->resize( $category['image'], 279, 414 );
				
				$hasbanner = $icon?'hasbanner':'nobanner';
				$caturl = $url->link('product/category', 'path='.$category['category_id']);
			?>	
			<div class="tab-pane <?php echo $category['class'];?> <?php echo $hasbanner; ?> clearfix active" id="tab-cattabs<?php echo $id.$category['category_id'];?>">	

			  <?php if( $icon ) { ?>
				<div class="tableft hidden-sm hidden-xs">
					<?php if ( $icon ) { ?>
					<a href="<?php echo $caturl; ?>"><img class="img-responsive" src="<?php echo $icon;?>" alt=""/></a><?php } ?>	
				</div>	
				<?php } ?>
				<?php if( count($products) > $itemsperpage ) { ?>
					<div class="carousel-controls">
						<a class="carousel-control left fa" href="#<?php echo $tab.$id.$category['category_id'];?>" data-slide="prev">
							<em class="fa fa-angle-left"></em>
						</a>
						<a class="carousel-control right" href="#<?php echo $tab.$id.$category['category_id'];?>" data-slide="next">
							<em class="fa fa-angle-right"></em>
						</a>
					</div>
				<?php } ?>

				<div class="pavproducts<?php echo $id;?> slide tabright" id="<?php echo $tab.$id.$category['category_id'];?>">
					<div class="carousel-inner">
						<?php $pages = array_chunk( $products, $itemsperpage);?>	
						<?php foreach ($pages as  $k => $tproducts ) { ?>
						<div class="item <?php if($k==0) {?>active<?php } ?>">
							<?php foreach( $tproducts as $i => $product ) { ?>
							<?php if( $i++%$cols == 0 ) { ?>
							<div class="row product-items">
							<?php } ?>
								<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-6 col-xs-12 product-cols">
									<?php require( $productLayout );  ?> 
								</div>
							<?php if( $i%$cols == 0 || $i==count($tproducts) ) { ?>
							</div>
							<?php } ?>
							<?php } ?>
						</div>
						<?php } ?>
					</div>
				</div>			
			</div>	
			<?php } ?>
		</div>

	</div>		
</div>

<script type="text/javascript">
	$(function () {
		$('#pavproducts<?php echo $id;?>').carousel({interval:9999999999,auto:false,pause:'hover'});
		$('#producttabs<?php echo $id;?> a:first').tab('show');
	});

</script>