    <?php if ($thumb || $images) { ?>
<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 image-container">
     <div class="thumbnails thumbs-preview">
        <?php if ($images) { ?>
         <div class="image-additional slide carousel horical col-lg-2 col-md-12" id="image-additional">
            <a class="carousel-control left center" href="#image-additional" data-slide="next">
                <i class="fa fa-angle-double-left"></i>
            </a>
            <div id="image-additional-carousel" class="carousel-inner">
                <?php 
                if( $productConfig['product_zoomgallery'] == 'slider' && $thumb ) {  
                    $eimages = array( 0=> array( 'popup'=>$popup,'thumb'=> $thumb )  ); 
                    $images = array_merge( $eimages, $images );
                }
                $icols = 4; $i= 0;
                foreach ($images as  $image) { ?>
                    <?php if( (++$i)%$icols == 1 ) { ?>
                    <div class="item clearfix">
                    <?php } ?>
                        <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="imagezoom" data-zoom-image="<?php echo $image['popup']; ?>" data-image="<?php echo $image['popup']; ?>">
                            <img src="<?php echo $image['thumb']; ?>" style="max-width:<?php echo $config->get('config_image_additional_width');?>px"  title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $image['popup']; ?>" class="product-image-zoom img-responsive" />
                        </a>
                    <?php if( $i%$icols == 0 || $i==count($images) ) { ?>
                    </div>
                  <?php } ?>
                <?php } ?>      
            </div>

            <!-- Controls -->
            <a class="carousel-control right center" href="#image-additional" data-slide="prev">
                <i class="fa fa-angle-double-right"></i>
            </a>
        </div>          
        <script type="text/javascript">
            $('#image-additional .item:first').addClass('active');
            $('#image-additional').carousel({interval:false})
        </script>
        <?php } ?> 
    </div>   

    <?php if ($thumb) { ?>
    <div class="thumbnail image img-detail col-lg-10 col-md-12">

        <?php if( isset($date_available) && $date_available == date('Y-m-d')) {   ?>            
        <span class="product-label product-label-new">
            <span><?php echo 'New'; ?></span>  
        </span>                                             
        <?php } ?>  
        <?php if( $special )  { ?>          
            <span class="product-label exist product-label-special">
                <span class="product-label-special"><?php echo 'Sale'; ?></span>
            </span>
        <?php } ?>

        <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="imagezoom">
            <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image"  data-zoom-image="<?php echo $popup; ?>" class="product-image-zoom img-responsive"/>
        </a>

    </div>
    <?php } ?>   
</div>          
<?php } ?>

