<?php $objlang = $this->registry->get('language');  $ourl = $this->registry->get('url');?>
 <?php
 $objlang->load('extension/module/themecontrol');

 // echo "<pre>";
 // print_r($product); die;

 // echo $product['reviews']; die;
 ?>
 <div class="product-block item-healthcare" itemtype="http://schema.org/Product" itemscope>
    
    <div class="block-img">
        <?php if ($product['thumb']) {    ?>
            <?php if( $product['special'] ) {   ?>
            <span class="product-label exist">
                <span class="product-label-special"><?php echo $objlang->get( 'text_sale' ); ?></span>
            </span>
        <?php } ?>

            <div class="image">
                <a class="img" itemprop="url" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>">
                    <img class="img-responsive" itemprop="image" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                </a>
            </div>

            <div class="cart-inner">
                <?php if ($product['price']) { ?>
                <div class="price">
                    <?php if (!$product['special']) {  ?>
                        <span class="special-price"><?php echo $product['price']; ?></span>
                        <?php if( preg_match( '#(\d+).?(\d+)#',  $product['price'], $p ) ) { ?>
                        <?php } ?>
                    <?php } else { ?>
                        <span class="price-old"><?php echo $product['price']; ?></span>
                        <span class="price-new"><?php echo $product['special']; ?></span>

                        <?php if( preg_match( '#(\d+).?(\d+)#',  $product['special'], $p ) ) { ?>
                        
                        <?php } ?>

                    <?php } ?>
                </div>
                <?php } ?>

                <?php if( !isset($listingConfig['catalog_mode']) || !$listingConfig['catalog_mode'] ) { ?>
                 <div class="cart">
                     <button onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-default">
                         <i class="fa fa-shopping-cart"></i>
                         <span><?php echo $objlang->get("button_cart"); ?></span>
                     </button>
                 </div>
                <?php } ?>
                </div>
        <?php } ?>


        <!-- button active -->
         <div class="action">
             <div class="quick-view">
                 <?php //#2 Start fix quickview in fw?>
                 <?php if ( isset($quickview) && $quickview ) { ?>
                     <a data-toggle="tooltip" data-placement="top" title="<?php echo $objlang->get('quick_view'); ?>" class=" btn btn-default" href="<?php echo $this->url->link("themecontrol/product",'product_id='.$product['product_id'] );?>">
                        <i class="fa fa-eye"></i>
                        <!-- <span><?php echo $objlang->get('quick_view'); ?></span> -->
                     </a>
                 <?php } ?>
                 <?php //#2 End fix quickview in fw?>
             </div>
             <div class="wishlist">
                <a data-toggle="tooltip" data-placement="top" onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $objlang->get("button_wishlist"); ?>" class="btn btn-default">
                <i class="fa fa-heart"></i>
                </a>
            </div>

            <div class="compare">
                <a data-toggle="tooltip" data-placement="top" title="<?php echo $objlang->get("button_compare"); ?>" class="btn btn-default" onclick="addToCompare('<?php echo $product['product_id']; ?>');">
                    <i class="fa fa-refresh"></i>
                </a>
            </div>
        </div>
    </div>

    <div class="product-meta">

        <div class="meta">
            <h3 class="name" itemprop="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
            
            <?php if ($product['price']) { ?>
                <div class="price price_sidebar">
                    <?php if (!$product['special']) {  ?>
                        <span class="special-price"><?php echo $product['price']; ?></span>
                        <?php if( preg_match( '#(\d+).?(\d+)#',  $product['price'], $p ) ) { ?>
                        <?php } ?>
                    <?php } else { ?>
                        <span class="price-old"><?php echo $product['price']; ?></span>
                        <span class="price-new"><?php echo $product['special']; ?></span>

                        <?php if( preg_match( '#(\d+).?(\d+)#',  $product['special'], $p ) ) { ?>
                        
                        <?php } ?>

                    <?php } ?>
                </div>
            <?php } ?>

            <?php if ( isset($product['rating']) && $product['rating'] ) { ?>
                <div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['rating']; ?>">
                <span class="text-review"> | <?php echo preg_replace( '/[^0-9]/', '', $product['reviews'] ).$objlang->get('text_review'); ?></span>
                </div>
            <?php } else { ?>
            <div class="norating"><img alt="0" src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-0.png">
            <span class="text-review"> | <?php echo preg_replace( '/[^0-9]/', '', $product['rating'] ).$objlang->get('text_review'); ?></span>
            </div>
            <?php } ?>

            <?php if( isset($product['description']) ){ ?>
                <p class="description" itemprop="description"><?php echo utf8_substr( strip_tags($product['description']),0,220);?>...</p>
            <?php } ?>
        </div>
    </div>

</div>