<?php if (count($languages) > 1) { ?>
<?php 
  $tmp = array();
  foreach( $languages as $language ){
    if( $language['code'] == $code ){
      $tmp = $language;
      break;
    }
  } 
?>
<div class="language-wrapper pull-right">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-language">
  <div class="btn-group">
    <button type="button" class="form-control" data-toggle="dropdown">
      <?php if( !empty($tmp) ) { ?>
      <span>      
        <img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $tmp['name']; ?>" title="<?php echo $tmp['name']; ?>" />
        <?php echo $language['name']; ?>        
      </span>   
      <?php } ?>
      <span class="fa fa-caret-down"></span>
    </button>

    <ul class="dropdown-menu dropdown list-unstyled">
      <?php foreach ($languages as $language) { ?>
      <li><button class="language-select" type="button" name="<?php echo $language['code']; ?>">
        <span><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /></span>        
        <span class="item-name"><?php echo $language['name']; ?></span> 
      </button></li>
      <?php } ?>
    </ul>
  </div>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>
