<?php $objlang = $this->registry->get('language');?>
<?php if( isset($widget_name)){
?>
<h3 class="menu-title"><span class="menu-title"><em class="fa fa-caret-right"></em><?php echo $widget_name;?></span></h3>
<?php
}?>
<div class="widget-product-list">
	<div class="widget-inner clearfix">
		<?php foreach ($products as $product) { ?>
		<div class="product-block pull-left">
			<div class="w-product">
				<?php if ($product['thumb']) { ?>
				<div class="image">
					<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>				
				</div>
				<?php } ?>
				
				<div class="product-meta">
					<h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
					<?php if ($product['price']) { ?>
					<div class="price">
					<?php if (!$product['special']) { ?>
					<?php echo $product['price']; ?>
					<?php } else { ?>
					<span class="price-old"><?php echo $product['price']; ?></span> 
					<span class="price-new"><?php echo $product['special']; ?></span>
					<?php } ?>			
					</div>
					<?php } ?>
					
					<?php if ( isset($product['rating']) ) { ?>
			          <div class="rating">
			            <?php for ($is = 1; $is <= 5; $is++) { ?>
			            <?php if ($product['rating'] < $is) { ?>
			            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
			            <?php } else { ?>
			            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i>
			            </span>
			            <?php } ?>
			            <?php } ?>
			          </div>
			        <?php } ?>

					<div class="action hide">
						<div class="cart">  
			              <button onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-shopping-cart">
			                <span class="fa fa-shopping-cart product-icon hidden-sm hidden-md"></span>
			                <span><?php echo $objlang->get("button_cart"); ?></span>
			              </button>           
			            </div>
			            <div class="wishlist">
			              <a onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $objlang->get("button_wishlist"); ?>" class="fa fa-heart product-icon">
			                <?php echo $objlang->get("button_wishlist"); ?>
			              </a>  
			            </div>
			            <div class="compare">     
			              <a onclick="addToCompare('<?php echo $product['product_id']; ?>');" title="<?php echo $objlang->get("button_compare"); ?>" class="fa fa-exchange product-icon">
			                <?php echo $objlang->get("button_compare"); ?>
			              </a>  
			            </div>
					</div>
				</div>
			</div>			
		</div>
		<?php } ?>
	</div>
</div>