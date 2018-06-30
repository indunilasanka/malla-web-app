<div class="box category highlights">
  <div class="box-heading"><span><?php echo $heading_title; ?></span></div>
  <div class="box-content   tree-menu">
    <ul id="accordion" class="box-category box-panel js-hover">
      <?php 
        $k=0;
        foreach ($categories as $key => $category) {        
        $class = "";
          if(isset($category["children"]) && !empty($category["children"])){
          $class = "haschild";
        }
        $name = str_replace("", '<span class="">',  $category['name'] );
        $category['name'] = str_replace("", '</span>', $name); 
      ?>
      
      <li class="<?php echo $class; ?>">
        <?php if ($category['category_id'] == $category_id) { ?>
        <a data-id="<?php echo $key; ?>" href="<?php echo $category['href']; ?>" class="active item"><?php echo $category['name']; ?></a>
        <?php } else { ?>
        <a data-id="<?php echo $key; ?>" href="<?php echo $category['href']; ?>" class="item"><?php echo $category['name']; ?></a>
        <?php } ?>
        <?php if ($category['children']) { $k++; ?>               
        <span class="head">
          <a href="#collapseOne<?php echo $k ;?>" class="accordion-toggle <?php echo $category_id==0?($k==1?'':'collapsed'):($category['category_id'] == $category_id?'':'collapsed') ?>" data-toggle="collapse" data-parent="#cat-accordion" >
          <i class="icon-collapse collapse-<?php echo $key; ?>"></i></a></span>       
        <ul id="collapseOne<?php echo $k ;?>" class="collapse <?php echo $category_id==0?($k==1?'in':''):($category['category_id'] == $category_id?'in':'') ; ?>">
          <?php foreach ($category['children'] as $child) { ?>
          <?php
            $child['name'] = str_replace("", '<span class="">',  $child['name'] );
            $child['name'] = str_replace("", '</span>', $child['name']);  
          ?>
          <li>
            <?php if ($child['category_id'] == $child_id) { ?>
            <a href="<?php echo $child['href']; ?>" class="active"> <?php echo $child['name']; ?></a>
            <?php } else { ?>
            <a href="<?php echo $child['href']; ?>"> <?php echo $child['name']; ?></a>
            <?php } ?>
          </li>
          <?php } ?>
        </ul>
        <?php } ?>
      </li>
      <?php } ?>
    </ul>
  </div>
</div>
<script>
  $(document).on('click', '#cat-accordion .accordion-toggle', function(event) {
        event.stopPropagation();
        var $this = $(this);
        var parent = $this.data('parent');
        var actives = parent && $(parent).find('.collapse.in');
        var target = $this.attr('data-target') || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, ''); 
        if (actives && actives.length) {
            actives.collapse('hide');
            $(parent).find('.accordion-toggle').not($(event.target)).addClass('collapsed');
      }
        $(this).removeClass('collapsed');
        $(target).collapse('show');
        $(target).addClass('collapse','1000');
        $(target).css('height','auto');
        $(target).animate({height:"auto"});
});
</script>

