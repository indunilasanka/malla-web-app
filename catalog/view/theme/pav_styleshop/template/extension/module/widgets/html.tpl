
<div class="widget-image <?php echo $addition_cls ?>  <?php if( isset($stylecls)&&$stylecls ) { ?>box-<?php echo $stylecls;?><?php } ?>">

	<div class="custom-v1">	
		<?php if( $show_title ) { ?>
		<h3 class="custom-heading"><?php echo $heading_title?></h3>
		<?php } ?>
		<div class="description">
		 <?php echo htmlspecialchars_decode( $html ); ?>
		</div>
	</div>	 
</div>
