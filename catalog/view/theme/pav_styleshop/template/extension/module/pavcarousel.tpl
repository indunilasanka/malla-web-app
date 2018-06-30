<?php 
$id = rand(1,10); 
$span = floor(12/$columns);
?>
<div id="pavcarousel<?php echo $id;?>" class="box carousel slide pavcarousel  clearfix hidden-sm hidden-xs">
	<div class="box-heading col-lg-2 col-md-2">
		<span><?php echo $text_logo_brand; ?></span>
	</div> 

	<div class="carousel-inner col-lg-10 col-md-10">
		<?php
		$pages = array_chunk( $banners, $itemsperpage );?>

		<?php foreach ($pages as $k => $tbanners) {?>
		<div class="item <?php if($k==0) {?>active<?php } ?>">
			<?php foreach( $tbanners as $i => $banner ) {  $i=$i+1;?>
			<?php if( $i%$columns == 1 ) { ?>
			<div class="row">
				<?php } ?>

				<div class="col-lg-2-2">
					<div class="item-inner">
						<?php if ($banner['link']) { ?>
						<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
						<?php } else { ?>
						<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
						<?php } ?>
					</div>
				</div>

				<?php if( $i%$columns == 0 || $i==count($tbanners) ) { ?>
			</div>
			<?php } ?>
			<?php } //endforeach; banner ?>
		</div>
		<?php } //endforeach; pages?>	
	</div>

	<?php if( count($banners) > $itemsperpage ){ ?>	
	<div class="carousel-controls">
		<a class="carousel-control left" href="#pavcarousel<?php echo $id;?>" data-slide="prev">
			<em class="fa fa-angle-left"></em>
		</a>
		<a class="carousel-control right" href="#pavcarousel<?php echo $id;?>" data-slide="next">
			<em class="fa fa-angle-right"></em>
		</a>
	</div>		
	<?php } ?>
	
</div>
<?php if( count($banners) > 1 ){ ?>
<script type="text/javascript"><!--
	$('#pavcarousel<?php echo $id;?>').carousel({interval:<?php echo $interval;?>});
--></script>
<?php } ?>