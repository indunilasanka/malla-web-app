<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
          <a class="btn btn-primary" onclick="$('#form').submit();"><?php echo $button_save; ?></a>
	        <a class="btn btn-success" onclick="$('#action').val('saveedit');$('#form').submit();"><?php echo $objlang->get('text_save_edit'); ?></a>
	        <a class="btn btn-danger" href="<?php echo $cancel; ?>"><?php echo $button_cancel; ?></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div><!-- End div#page-header -->
  <div id="page-content" class="container-fluid">
    <?php if ($error_warning) { ?>
    	<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      	<button type="button" class="close" data-dismiss="alert">&times;</button>
    	</div>
     	<?php } ?>
	<?php if (isset($success) && !empty($success)) { ?>
	<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $subheading; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <input type="hidden" name="pavproducts_module[action]" id="action" value=""/>

          <!-- Nav tabs -->
                <div class="row">
                  <ul class="nav nav-tabs" role="tablist">
                    <li <?php if( $selectedid ==0 ) { ?>class="active" <?php } ?>> <a href="<?php echo $link; ?>"> <span class="fa fa-plus"></span> <?php echo $olang->get('button_add_module');?></a></li>
                    <?php $i=1; foreach( $moduletabs as $key => $module ){ ?>
                    <li role="presentation" <?php if( $module['module_id']==$selectedid ) {?>class="active"<?php } ?>>
                      <a href="<?php echo $link; ?>&module_id=<?php echo $module['module_id']?>" aria-controls="bannermodule-<?php echo $key; ?>"  >
                        <span class="fa fa-pencil"></span> <?php echo $module['name']?>
                       </a>
                      </li>
                    <?php $i++ ;} ?>
                  
                  </ul>
                </div>
                <!-- Tab panes -->


          <div class="row">
            
            <div class="col-sm-12">
            <div >
      <?php $module_row = 1; ?>
      <?php foreach ($modules as $module) { ?>
      <?php if( $selectedid ){ ?>
               <div class="pull-right">
                      <a href="<?php echo $action;?>&delete=1" class="remove btn btn-danger" ><span><i class="fa fa-remove"></i> Delete This</span></a>
                    </div>  
                    <?php } ?>
      <div  id="tab-module<?php echo $module_row; ?>">
                    <ul class="nav nav-tabs" id="language<?php echo $module_row; ?>">
                      <?php foreach ($languages as $language) { ?>
                      <li><a href="#tab-module<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                      <?php } ?>
                    </ul>
        <div class="tab-content">
                  <?php foreach ($languages as $language) { ?>
                   <div class="tab-pane" id="tab-module<?php echo $module_row; ?>-language<?php echo $language['language_id']; ?>">
         <table class="table">
              <tr>
                <td class="col-sm-2"><?php echo $entry_description; ?></td>
                <td class="col-sm-10"><textarea class="pavo-editor" name="pavproducts_module[<?php echo $module_row; ?>][description][<?php echo $language['language_id']; ?>]" id="description-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($module['description'][$language['language_id']]) ? $module['description'][$language['language_id']] : ''; ?></textarea></td>
              </tr>
            </table>
          </div>
          <?php } ?>

      <div>
        <?php if (isset($error_dimension[$module_row])) { ?>
           <span class="error"><?php echo $error_dimension[$module_row]; ?></span>
         <?php } ?>
      </div>
   
    <table class="table">
      <tr>
        <td class="col-sm-2"><?php echo $objlang->get('entry_name'); ?></td>
        <td class="col-sm-10"><input class="form-control" style="width:55%;" name="pavproducts_module[<?php echo $module_row; ?>][name]" value="<?php echo isset($module['name'])?$module['name']:''; ?>"/></td>
      </tr>
      <tr>
          <td class="col-sm-2"><?php echo $objlang->get('entry_status'); ?></td>
          <td class="col-sm-10"><select name="pavproducts_module[<?php echo $module_row; ?>][status]" class="form-control" style="width:10%;">
            <?php if ( isset($module['status']) && $module['status'] ) { ?>
            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
            <option value="0"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_enabled; ?></option>
            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
          </select></td>
        </tr>


      <tr>
        <td class="col-sm-2"><?php echo $objlang->get('entry_prefix_class'); ?></td>
        <td class="col-sm-10"><input class="form-control" style="width:55%;" name="pavproducts_module[<?php echo $module_row; ?>][prefix_class]" value="<?php echo isset($module['prefix_class'])?$module['prefix_class']:''; ?>"/></td>
      </tr>
			<tr>
				<td class="col-sm-2"><?php echo $entry_dimension; ?></td>
				<td class="col-sm-10"><input class="form-control" style="width:55%;" name="pavproducts_module[<?php echo $module_row; ?>][width]" value="<?php echo $module['width']; ?>" size="3" />
                <input class="form-control" style="width:55%;" name="pavproducts_module[<?php echo $module_row; ?>][height]" value="<?php echo $module['height']; ?>" size="3"/>
              </td>
			</tr>
			<tr>
				 <td class="col-sm-2"><?php echo $entry_carousel; ?></td>
				  <td class="col-sm-10"><input class="form-control" style="width:55%;" name="pavproducts_module[<?php echo $module_row; ?>][itemsperpage]" value="<?php echo $module['itemsperpage']; ?>" size="3" /> -
                <input class="form-control" style="width:55%;" name="pavproducts_module[<?php echo $module_row; ?>][cols]" value="<?php echo $module['cols']; ?>" size="3"/> -
				<input class="form-control" style="width:55%;" name="pavproducts_module[<?php echo $module_row; ?>][limit]" value="<?php echo $module['limit']; ?>" size="3"/>
                <?php if (isset($error_carousel[$module_row])) { ?>
                <span class="error"><?php echo $error_carousel[$module_row]; ?></span>
                <?php } ?></td>
			</tr>
          </table>


    <div class="category-tabs">
       <?php if (isset($error_category_tabs[$module_row])) { ?>
                <span class="error"><?php echo $error_category_tabs[$module_row]; ?></span>
                <?php } ?>

      <div class="box-head">
         <td class="text-left"><button type="button" onclick="addCategoryTab('category-tabs<?php echo $module_row; ?>',<?php echo $module_row;?>);" data-toggle="tooltip" title="<?php echo $objlang->get('text_add_category'); ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i><?php echo $objlang->get('text_add_category'); ?></button></td>
      </div>
        <div id='category-tabs<?php echo $module_row; ?>'>
          <?php if( isset($module['category_tabs']) && $module['category_tabs'] ) {  ?>

            <?php foreach( $module['category_tabs'] as $idx => $category ) { ?>
             <table class="table table-striped table-bordered table-hover" id="category-tab-wrapper<?php echo $idx+1;?>">
                <tr>
                  <td><?php echo $objlang->get('entry_category');?></td>
                  <td>
                    <select name="pavproducts_module[<?php echo $module_row;?>][category_tabs][]">
                     <?php foreach( $product_categories as $category){ ?>
                     <option <?php if( $module['category_tabs'][$idx] == $category['category_id'] ) {?>selected="selected"<?php } ?> value="<?php echo $category['category_id'];?>"><?php echo addslashes($category['name']);?> [ID:<?php echo $category['category_id'];?>]</option>
                     <?php } ?>
                     </select>
                  </td>
                  <td> <?php echo $objlang->get( 'entry_icon_image' );?> </td>
                  <td>
                     <?php
                      $imgidx = $module_row."-".$idx;
                    $thumb = isset( $module['image'][$idx]) ?  $model_tool_image->resize( $module['image'][$idx], 32, 32) : $placeholder;
                    $image = isset($module['image'][$idx])?$module['image'][$idx]:"";

                     ?>

                  <a href="" id="thumb-image<?php echo $imgidx; ?>" data-toggle="image" class="img-thumbnail">
                  <img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                      <input type="hidden" name="pavproducts_module[<?php echo $module_row; ?>][image][]" value="<?php echo $image; ?>" id="input-image<?php echo $imgidx; ?>" />

                  </td>
                  <td><?php echo $objlang->get('entry_addition_class');?></td>
                  <td>
                      <input class="form-control" style="width:55%;" name="pavproducts_module[<?php echo $module_row;?>][class][]" value="<?php echo $module['class'][$idx];?>">
                  </td>
                  <td class="text-left"><button type="button" onclick="$('#category-tab-wrapper<?php echo $idx+1;?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                </tr>
            </table>
         <?php }  ?>
         <?php } ?>
       </div>
    </div>
    </div>
    </div>
        <?php $module_row++; ?>
        <?php } ?>
    </div>
    </div>
    </div>
  </div>
      </form>
    </div>
  </div>
</div>


<script type="text/javascript">

  function addCategoryTab( wrapper,mid ){
    var index =  $("#"+wrapper+" table").length + 1;
    var _class= (index%2==0 ? "odd":"eve");
    var banner_row = mid+ '-'+index;
    var html  = '';
     html = '<table class="table table-striped table-bordered table-hover '+_class+'" id="category-tab-wrapper'+index+'">';
     html +=     '<tr>';
     html +=      '<td><?php echo $objlang->get("entry_category");?></td>';
     html +=       ' <td>';

     html += '<select name="pavproducts_module['+mid+'][category_tabs][]">';
     <?php foreach( $product_categories as $category){ ?>
      html +='<option value="<?php echo $category['category_id'];?>"><?php echo addslashes($category['name']);?> [ID:<?php echo $category['category_id'];?>]</option>';
     <?php } ?>
     html += '</select>';
     html += '</td>';
     html += '<td>  <?php echo $objlang->get( 'entry_icon_image' );?> </td>';
      html += '<td> ';
     html += '<a href="" id="thumb-image' + banner_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="pavproducts_module[' + mid + '][image][]" value="" id="input-image' + banner_row + '" /></td>';

     html +=        '<td><?php echo $objlang->get("entry_addition_class");?></td>';
     html +=       '<td><input class="form-control" style="width:55%;" name="pavproducts_module['+mid+'][class][]"></td>';
     html += '  <td class="text-left"><button type="button" onclick="$(\'#category-tab-wrapper'+index+'\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
     html +=     '</tr>'
     html +=    '</table> ';
    $('#'+wrapper).append( html );
  }

</script>
<script type="text/javascript"><!--
$('.pavo-editor').summernote({
    height: 300
  });
//--></script>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

 
//--></script>
 <script type="text/javascript"><!--
 <?php $module_row = 1; ?>
$('#module li:first-child a').tab('show');
<?php foreach ($modules as $module) { ?>
$('#language<?php echo $module_row; ?> li:first-child a').tab('show');
<?php $module_row++; ?>
<?php } ?>
//--></script>
<?php echo $footer; ?>