<?php 
	$objlang = $this->registry->get('language');
	$config = $this->registry->get('config');
?>
<?php if( !empty($blogs) ) { ?>
<div id="blog-carousel" class="widget-blogs  latest-posts latest-posts-v1 panel panel-default <?php echo $addition_cls;?> <?php $addition_cls?> <?php if ( isset($stylecls)&&$stylecls) { ?>box-<?php echo $stylecls; ?><?php } ?>">
	<?php if( $show_title ) { ?>
	<div class="panel-heading none-border"><h4 class="panel-title"><?php echo $heading_title?></h4></div>
	<?php } ?>
<div class="owl-carousel-play" data-ride="owlcarousel">

	<div class="owl-carousel" data-show="1" data-pagination="false" data-navigation="true">

			<?php 
				$pages = array_chunk( $blogs, $itemsperpage); $span = 12/$cols;
			?>

			<?php foreach ($pages as  $k => $tblogs ) {   ?>
				<div class="row item <?php if($k==0) {?>active<?php } ?>">
					<?php foreach( $tblogs as $i => $blog ) {  $i=$i+1;?>
						
							<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-<?php  echo ($cols > 2 && $cols % 2 == 0) ? $span * 2 : $span; ?> col-xs-12 product-col">
					  			<div class="latest-posts-item">
									<div class="latest-posts-body media">
										<div class="latest-posts-image pull-left">
											<?php if( $blog['thumb']  )  { ?>
												
														<a href="<?php echo $blog['link'];?>" class="blog-article">
												<img src="<?php echo $blog['thumb'];?>" title="<?php echo $blog['title'];?>" alt="<?php echo $blog['title'];?>" class="img-responsive"/>
														</a>								
							
											<?php } ?>							
										</div>
										<div class="latest-posts-meta media-body">
											<h3 class="latest-posts-title">
												<a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a>
											</h3>	
											<div class="latest-posts-profile">						
												<span class="created"><i class="zmdi zmdi-time zmdi-hc-fw"></i><?php echo date("d M, Y",strtotime($blog['created']));?></span>																				
											</div>			
											<div class="shortinfo">
												<?php $blog['description'] = strip_tags($blog['description']); ?>
												<?php echo utf8_substr( $blog['description'],0, 90 );?>...
											</div>
											
											<div class="blog-readmore space-top-20">
												<a class="btn btn-default btn-arrow-right" href="<?php echo $blog['link'];?>"><?php echo $objlang->get('text_readmore');?></a>
											</div>
										</div>						
									</div>						
								</div>   		
							</div>

					<?php } //endforeach; ?>
				</div>
			<?php } ?>
		
	</div>

	<?php if( count($blogs) >= 3 ) { ?>	
		<div class="carousel-controls">
			<a class="carousel-control left" href="#blog-carousel"   data-slide="prev"><i class="zmdi zmdi-arrow-left zmdi-hc-fw"></i></a>
			<a class="carousel-control right" href="#blog-carousel"  data-slide="next"><i class="zmdi zmdi-arrow-right zmdi-hc-fw"></i></a>
		</div>		
	<?php } ?>

	</div>
</div>
<?php } ?>