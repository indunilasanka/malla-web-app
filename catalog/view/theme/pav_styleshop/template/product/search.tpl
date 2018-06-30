<?php require( PAVO_THEME_DIR."/template/common/config_layout.tpl" );  ?>
<?php echo $header; ?>
<?php require( PAVO_THEME_DIR."/template/common/breadcrumb.tpl" );  ?>

<div class="container">
  <div class="row">
    <?php if( $SPAN[0] ): ?>
      <aside id="sidebar-left" class="col-md-<?php echo $SPAN[0];?>">
        <?php echo $column_left; ?>
      </aside>  
    <?php endif; ?> 

    <?php $class_3cols = (!empty($column_left) && !empty($column_left))?'three-columns':''; ?>
    <div class="col-md-<?php echo $SPAN[1];?> <?php echo $class_3cols;?> "> 
      <div id="content">
        <?php echo $content_top; ?>
        <div class="search">
          <h1><?php echo $heading_title; ?></h1>
          <label class="control-label"><?php echo $entry_search; ?></label>
          <div class="content">
            <div class="wrapper">
              <div class="row">
                <!-- ===================== -->
                <div class="col-md-4">
                  <div class="form-horizontal">
                    <div class="form-group">
                      <label class="col-md-3 hidden-xs hidden-sm"><?php echo $entry_search; ?></label>
                      <div class="col-md-9">
                        <?php if ($search) { ?>
                        <input type="text" name="search" value="<?php echo $search; ?>" class="input-text form-control" />
                        <?php } else { ?>
                        <input type="text" name="search" value="<?php echo $search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;"  class="input-text form-control" />
                        <?php } ?>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- ===================== -->
                <div class="col-md-4">
                  <select name="category_id" class="form-control">
                    <option value="0"><?php echo $text_category; ?></option>
                    <?php foreach ($categories as $category_1) { ?>
                    <?php if ($category_1['category_id'] == $category_id) { ?>
                    <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
                    <?php } ?>
                    <?php foreach ($category_1['children'] as $category_2) { ?>
                    <?php if ($category_2['category_id'] == $category_id) { ?>
                    <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                    <?php } ?>
                    <?php foreach ($category_2['children'] as $category_3) { ?>
                    <?php if ($category_3['category_id'] == $category_id) { ?>
                    <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
                <!-- ===================== -->
                <div class="col-md-4">
                  <label class="checkbox">
                    <?php if ($sub_category) { ?>
                    <input type="checkbox" name="sub_category" value="1" id="sub_category" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="sub_category" value="1" id="sub_category" />
                    <?php } ?>
                    <?php echo $text_sub_category; ?>
                  </label>
                </div>
              </div> 
              <!-- ========= End Row ============ -->
              <p>
                <label class="checkbox">
                  <?php if ($description) { ?>
                  <input type="checkbox" name="description" value="1" id="description" checked="checked" />
                  <?php } else { ?>
                  <input type="checkbox" name="description" value="1" id="description" />
                  <?php } ?>
                  <?php echo $entry_description; ?></label>
              </p>
            </div>
            <!-- ===================== -->
          </div>
          
          <div class="buttons">
            <div class="left">
              <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button btn btn-theme-default" />
            </div>
          </div>

          <h2><?php echo $text_search; ?></h2>

          <?php if ($products) { ?>
           <?php require( ThemeControlHelper::getLayoutPath( 'common/product_collection.tpl' ) );  ?> 
          <?php } else { ?>
          <div class="content"><div class="wrapper"><?php echo $text_empty; ?></div></div>
          <?php } ?>

        <?php echo $content_bottom; ?>
        </div>
      </div>
      </div>
      <!-- ==========  End Content =========== -->

    </div>
    <?php if( $SPAN[2] ): ?>
      <aside id="sidebar-right" class="col-md-<?php echo $SPAN[2];?>">  
        <?php echo $column_right; ?>
      </aside>
    <?php endif; ?>
  </div>
<?php echo $footer; ?> 