<div class="box pavblogs-comments-box">
	<div class="box-heading"><span><?php echo $heading_title; ?></span></div>
	<div class="box-content">
		<?php if( !empty($comments) ) { ?>
		<div class="pavblog-comments clearfix">
			 <?php $default=''; foreach( $comments as $comment ) { ?>
				<div class="pav-comment media">
					<a class="media-left" href="<?php echo $comment['link'];?>" title="<?php echo $comment['user'];?>">
						<img src="<?php echo "http://www.gravatar.com/avatar/" . md5( strtolower( trim( $comment['email'] ) ) ) . "?d=" . urlencode( $default ) . "&s=60" ?>" alt=""/>
					</a>
					<div class="content media-right">
						<div class="comment"><?php echo utf8_substr( $comment['comment'],0, 50 ); ?>...</div>
						<div class="comment-author text-primary"><?php echo $objlang->get('text_postedby');?> <?php echo $comment['user'];?>...</div>
					</div>
				</div>
			 <?php } ?>
		</div>
		<?php } ?>
	</div>
</div>