
<div class="widget-html box <?php echo $addition_cls ?>  <?php if( isset($stylecls)&&$stylecls ) { ?>box-<?php echo $stylecls;?><?php } ?>">
	<?php if( isset($widget_name)){
		?>
		<h3 class="menu-title"><span class="menu-title"><em class="fa fa-caret-right"></em><?php echo $widget_name;?></span></h3>
		<?php
	}?>
	<div class="widget-inner clearfix">
		 <?php echo htmlspecialchars_decode( $html ); ?>
	</div>
</div>
