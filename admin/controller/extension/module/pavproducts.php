<?php
/******************************************************
 * @package Pav Product Tabs module for Opencart 1.5.x
 * @version 1.0
 * @author http://www.pavothemes.com
 * @copyright	Copyright (C) Feb 2012 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
*******************************************************/

class ControllerExtensionModulepavproducts extends Controller {
	private $error = array();

	private $data = array();

	public function index() {

		$this->data['objlang'] = $this->language;
		$this->data['objurl'] = $this->url;

		$this->load->language('extension/module/pavproducts');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		$this->load->model('extension/extension');
		$this->load->model('extension/module');
		$this->load->model('tool/image');

		if( isset($this->request->get['module_id']) && isset($this->request->get['delete']) ){
			$this->model_extension_module->deleteModule( $this->request->get['module_id'] );
			$this->response->redirect($this->url->link('extension/module/pavproducts', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

		
			$action = isset($this->request->post["action"]) ? $this->request->post["action"] : "";
			unset($this->request->post['pavproducts_module']['action']);

		 	$data = array();
			foreach ($this->request->post['pavproducts_module'] as $key => $value) {
		 	 	$data = $value;	
		 	 	break;
		 	}	

	 
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('pavproducts', $data );
			} else {
				$this->model_extension_module->editModule( $this->request->get['module_id'], $data );
			}	

			$this->session->data['success'] = $this->language->get('text_success');
			if( isset($this->request->get['module_id']) ) {
				$this->response->redirect($this->url->link('extension/module/pavproducts', 'module_id='.$this->request->get['module_id'].'&token=' . $this->session->data['token'], 'SSL'));
			}else{
				$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'].'&type=module', 'SSL'));
			}

		}

		$this->_language();


 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		if (isset($this->error['dimension'])) {
			$this->data['error_dimension'] = $this->error['dimension'];
		} else {
			$this->data['error_dimension'] = array();
		}

		$this->_breadcrumbs();


		$this->data['action'] = $this->url->link('extension/module/pavproducts', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'].'&type=module', 'SSL');

		$this->data['modules'] = array();

		if (isset($this->request->post['pavproducts_status'])) {
			$this->data['pavproducts_status'] = $this->request->post['pavproducts_status'];
		} else {
			$this->data['pavproducts_status'] = $this->config->get('pavproducts_status');
		}

		$default = array(
			'description' => array(),
			'prefix_class' => '',
			'width'		=> '202',
			'height'	=> 168,
			'itemsperpage'=> 4,
			'cols'	=> 4,
			'limit'	=> 16,
			'name'	=> ''
		);
		
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
			$module_info = array_merge( $default, $module_info );
			$this->data['selectedid'] = $this->request->get['module_id'];

			
			$this->data['subheading'] = $this->language->get('text_edit_module') . $module_info['name'];
			$this->data['action'] = $this->url->link('extension/module/pavproducts', 'module_id='.$this->request->get['module_id'].'&token=' . $this->session->data['token'], 'SSL');
		}else {
			$module_info = $default;
			$this->data['selectedid'] = 0;
			$this->data['subheading'] = $this->language->get('text_create_new_module');
			$this->data['action'] = $this->url->link('extension/module/pavproducts', 'token=' . $this->session->data['token'], 'SSL');
		}

		$modules = array( 0=> $module_info );

		$moduletabs = $this->model_extension_module->getModulesByCode( 'pavproducts' );
	 	$this->data['link'] = $this->url->link('extension/module/pavproducts', 'token=' . $this->session->data['token'] . '', 'SSL');
 		$this->data['modules'] = $modules; 
 	 	

 		$this->data['moduletabs'] = $moduletabs;

 
 		$this->data['olang']  = $this->language; 

 

		$this->load->model('catalog/category');
		if( VERSION == '1.5.4' ){
			$results = $this->model_catalog_category->getCategories(0);
		}else {
			$results = $this->model_catalog_category->getCategories( array('limit' => 999999999 , 'start'=>0 ) );
		}

		$this->data['product_categories'] = $results;


		$this->load->model('design/layout');

		$this->data['layouts'] = array();
		$this->data['layouts'][] = array('layout_id'=>99999, 'name' => $this->language->get('all_page') );

		$this->data['layouts'] = array_merge($this->data['layouts'],$this->model_design_layout->getLayouts());

		$this->load->model('design/banner');

		$this->data['banners'] = $this->model_design_banner->getBanners();
		$tabs = array(
			'latest' 	 => $this->language->get('text_latest'),
			'featured'   => $this->language->get('text_featured'),
			'bestseller' => $this->language->get('text_bestseller'),
			'special'   => $this->language->get('text_special'),
			'mostviewed' => $this->language->get('text_mostviewed')
		);

		$this->data['tabs'] = $tabs;
		$this->data['model_tool_image'] = $this->model_tool_image;
		$this->data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		$this->data['header'] = $this->load->controller('common/header');
		$this->data['column_left'] = $this->load->controller('common/column_left');
		$this->data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/pavproducts.tpl', $this->data));
	}

	public function _language(){
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_edit'] = $this->language->get('text_edit');
		$this->data['text_save_edit'] = $this->language->get('text_save_edit');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
 		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');
		$this->data['no_image'] = '';

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_tabs'] = $this->language->get('entry_tabs');
		$this->data['entry_banner'] = $this->language->get('entry_banner');
		$this->data['entry_dimension'] = $this->language->get('entry_dimension');
		$this->data['entry_carousel'] = $this->language->get('entry_carousel');

		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_category'] = $this->language->get( 'entry_category' );


		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_module_add'] = $this->language->get('button_module_add');
		$this->data['button_remove'] = $this->language->get('button_remove');


		$this->load->model('localisation/language');
		$this->data['tab_module'] = $this->language->get('tab_module');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		$this->data['token'] = $this->session->data['token'];

	}

	public function  _breadcrumbs(){
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/extension', 'token=' . $this->session->data['token'].'&type=module', 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/module/pavproducts', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/pavproducts')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (isset($this->request->post['pavproducts_module'])) {
			foreach ($this->request->post['pavproducts_module'] as $key => $value) {

				if( (isset($value['width'])) && (isset($value['height'])) ){
					if (!$value['width'] || !$value['height']) {
						$this->error['dimension'][$key] = $this->language->get('error_dimension');
					}
				}

				if( isset($value['category_tabs'] )){
					if( !isset($value['category_tabs']) ){
						$this->error['dimension'][$key] = $this->language->get('error_category_tabs');
					}
				}
				if(isset($value['limit'])){
					if (!$value['limit'] || !$value['cols'] || !$value['itemsperpage'] ) {
						$this->error['dimension'][$key] = $this->language->get('error_carousel');
					}
				}
			}
		}
		return !$this->error;
	}
}
?>
