<div class="product-filter "> 
  <div class="inner clearfix">
  <div class="display">
    <div class="btn-group group-switch">
      <button type="button" id="list-view" class="btn btn-switch list" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
      <button type="button" id="grid-view" class="btn btn-switch grid active" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
    </div>
  </div>
  <div class="filter-right">
     <div class="product-compare"><a href="<?php echo $compare; ?>" class="btn btn-compare btn-theme-default" id="compare-total"><?php echo $text_compare; ?></a></div>

      <div class="sort">
        <span><?php echo $text_sort; ?></span>
        <select onchange="location = this.value;">
          <?php foreach ($sorts as $sorts) { ?>
          <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
          <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
          <?php } ?>
          <?php } ?>
        </select>
      </div>

      <div class="limit">
        <span><?php echo $text_limit; ?></span>
        <select onchange="location = this.value;">
          <?php foreach ($limits as $limits) { ?>
          <?php if ($limits['value'] == $limit) { ?>
          <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
          <?php } ?>
          <?php } ?>
        </select>
      </div>

    </div> 
  </div>    
</div> 
 
