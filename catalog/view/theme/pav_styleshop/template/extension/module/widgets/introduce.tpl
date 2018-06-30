<div class="widget">
    <?php if( $show_title ) { ?>
        <div class="widget-heading panel-heading block-borderbox">
            <h4 class="panel-title"><?php echo $heading_title?></h4>
        </div>
    <?php } ?>
    <div class="widget-inner introduce <?php echo $addition_cls;?> <?php if (isset($stylecls)&&$stylecls){echo "block-".$stylecls;}?>">
        <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-5 col-md-5 content-introduce pull-<?php if($position == 'left'){ echo 'right';}?>">
                <div class="heading heading-v9">
                    <?php if($iconclass){ ?>
                        <i class="fa <?php echo $iconclass;?>"></i>
                    <?php } ?>
                </div>
                <div class="detail space-30">
                    <?php if($content_html) {?>
                        <?php echo $content_html; ?>
                    <?php }?>
                </div>
            </div>  
            <div class="col-xs-12 col-sm-7 col-md-7 text-center media-introduce pull-<?php if($position == 'left'){ echo 'left';}?>">
                <div class="image-item text-center">
                    <?php if($thumbnailurl){?>
                            <img class="img-responsive" src="<?php echo $thumbnailurl;?>" alt="">
                    <?php }elseif($id_video){ ?>
                            <iframe width="<?php echo $width;?>" height="<?php echo $height;?>" src="https://www.youtube.com/embed/<?php echo $id_video;?>?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
                    <?php } ?>
                </div>
            </div>   
        </div>
        </div>    
    </div>
</div>