 <header id="header">
	<div id="topbar">
	  	<div class="container">
		    <div class="show-desktop">
				<div class="quick-top-link">
					<!-- Single button -->
					<div class="language btn-top pull-left">
						<?php echo $language; ?>
					</div>
					<div class="currency btn-top pull-left">
						<?php echo $currency; ?>
					</div>	
					<div class="quick-access btn-group btn-top pull-left">
						<button type="button" class="form-control" data-toggle="dropdown">
							<span class="quick-icon">
								<?php echo $text_account; ?>
								<span class="fa fa-caret-down"></span>
							</span>	
						</button>													
							<div class="dropdown-menu">
								<ul class="links">
									<li><a href="<?php echo $account; ?>"><span><?php echo $text_account; ?></span></a></li>
						            <li><a id="wishlist-total" href="<?php echo $wishlist; ?>"><span><?php echo $text_wishlist; ?></span></a></li>
						            <li><a href="<?php echo $shopping_cart; ?>"><span><?php echo $text_shopping_cart; ?></span></a></li>
						            <li><a href="<?php echo $checkout; ?>"><span><?php echo $text_checkout; ?></span></a></li>			
								</ul>
							</div>					
					</div>
					<div class="welcome pull-right hidden-sm hidden-xs">
						<?php if ($logged) { ?>
			            <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a> -
			            <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
			            <?php } else { ?>
			            <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a> or
			            <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
			            <?php } ?>
					</div>	
				</div>
			</div>
	  	</div>
	</div>

	<div id="header-main">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 logo">
					<?php if( $logoType=='logo-theme'){ ?>
					<div id="logo-theme"><a href="<?php echo $home; ?>"><span><?php echo $name; ?></span></a></div>
					<?php } elseif ($logo) { ?>
					<div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
					<?php } ?>					
				</div>

				<div class="hidden-xs hidden-sm inner pull-left">
					<div class="support">			
						<?php if( $content=$helper->getLangConfig('widget_custom') ) {?>
							<div class="box-services"><span class="pull-left"><i class="fa fa-group">&nbsp;</i></span> 
							<div class="media-body">  	<h3>Working hours</h3>  <small>08 AM to 09 PM</small>     </div> </div> 	
							<div class="box-services"><span class="pull-left"><i class="fa fa-refresh">&nbsp;</i></span>    				
							<div class="media-body">  	<h3>Return &amp; Exchange</h3>  <small>in 3 working days</small></div> </div>
                            <div class="box-services" style="margin-left: 20px;"><span class="pull-left"><i class="fa fa-phone">&nbsp;</i></span>    			
							<div class="media-body">  	<h3>011 4248715</h3><h3> 071 7469082</h3></div>  </div>
							
						<?php } ?>
					</div>	
				</div>	

				<div class="pull-right shopping-cart hidden-xs hidden-sm">
					<div class="cart-top">
						<?php echo $cart; ?>
					</div>
				</div>

				<?php echo $search; ?>
			</div>
		</div>
	</div>

	<div id="pav-mainnav">
		<div class="container">
		<?php
		/**
		 * Main Menu modules: as default if do not put megamenu, the theme will use categories menu for main menu
		 */
		$modules = $helper->renderModule('pavmegamenu');

		if (count($modules) && !empty($modules)) { ?>

		    
		<?php echo $modules; ?>
		 

		<?php } elseif ($categories) { ?>

		    <div class="navbar navbar-inverse"> 
		        <nav id="mainmenutop" class="pav-megamenu" role="navigation"> 
		            <button data-toggle="offcanvas" class="btn btn-link btn-sm canvas-menu hidden-lg hidden-md" type="button"><span class="fa fa-bars"></span></button>

		            <div class="collapse navbar-collapse navbar-ex1-collapse">
		                <ul class="nav navbar-nav">
		                    
		                    <?php foreach ($categories as $category) { ?>

		                        <?php if ($category['children']) { ?>			
		                            <span class="parent dropdown deeper ">
		                                <a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?>
		                                    <b class="fa fa-angle-down"></b>
		                                    <span class="triangles"></span>
		                                </a>
		                            <?php } else { ?>
		                            <span>
		                                <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
		                            <?php } ?>
		                            <?php if ($category['children']) { ?>
		                                <ul class="dropdown-menu">
		                                    <?php for ($i = 0; $i < count($category['children']);) { ?>
		                                        <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
		                                        <?php for (; $i < $j; $i++) { ?>
		                                            <?php if (isset($category['children'][$i])) { ?>
		                                                <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
		                                            <?php } ?>
		                                        <?php } ?>
		                                    <?php } ?>
		                                </ul>
		                            <?php } ?>
		                        </li>
		                    <?php } ?>
		                </ul>
		            </div>	
		        </nav>
		    </div>   
		<?php } ?>
		</div>
	</div>
</header>