<?php
/******************************************************
 * @package Pav Product Tabs module for Opencart 1.5.x
 * @version 1.0
 * @author http://www.pavothemes.com
 * @copyright	Copyright (C) Feb 2012 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
*******************************************************/

class ControllerExtensionModulepavproducts extends Controller {
	public $data =  array();

	public function index($setting) {

		// pavo 2.2 fix
		$this->load->language('extension/module/themecontrol');

		$config_theme = $this->config->get('theme_default_directory');
		
		$this->data['objlang']   = $this->language;
		$this->data['ourl']      = $this->url;
		$this->data['sconfig']   = $this->config;
		$this->data['themename'] = $config_theme;
		// pavo 2.2 fix

		static $module = 0;

		$this->data['objconfig'] = $this->config;

		$this->load->model('catalog/product');
		$this->load->model('catalog/category');
		$this->load->model('tool/image');
		$this->language->load('extension/module/pavproducts');

		$this->data['button_cart'] = $this->language->get('button_cart');
		if (file_exists('catalog/view/theme/' . $config_theme . '/stylesheet/pavproducts.css')) {
			$this->document->addStyle('catalog/view/theme/' . $config_theme . '/stylesheet/pavproducts.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/pavproducts.css');
		}
		if( !isset($setting['category_tabs']) ){
			return ;
		}

		$default = array(
			'latest' => 1,
			'limit' => $setting['limit']
		);

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['model_resize'] = $this->model_tool_image;

		$this->data['url'] = $this->url;

		$this->data['width'] = $setting['width'];
		$this->data['height'] = $setting['height'];
		$this->data['cols']   = (int)$setting['cols'];
		$this->data['itemsperpage']   = (int)$setting['itemsperpage'];

		$this->data['prefix_class']   = isset($setting['prefix_class'])?$setting['prefix_class']:'';


		$this->data['tabs'] = array();


		$data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		foreach( $setting['category_tabs'] as  $key => $categoryID ){

			$category = $this->model_catalog_category->getCategory( $categoryID );
			if( $category ) {
				$data['filter_category_id'] = $categoryID;
				$products =  $this->getProducts( $this->model_catalog_product->getProducts( $data ), $setting, $categoryID );
				$this->data['tabs'][] = array( 'products' 	   => $products,
											   'class' 		   => $setting['class'][$key],
											   'image'		   => $setting['image'][$key],
											   'category_name' => $category['name'],
											   'category_id'   => $categoryID

				);
			}
		}

		$this->data['module'] = $module++;

		return $this->load->view('extension/module/pavproducts', $this->data);
		
	}

	private function getProducts( $results, $setting, $catid=0 ){


		$products = array();
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				$product_images = $this->model_catalog_product->getProductImages($result['product_id']);
				if(isset($product_images) && !empty($product_images)) {
					$thumb2 = $this->model_tool_image->resize($product_images[0]['image'], $setting['width'], $setting['height']);
				}
			} else {
				$image = false;
			}

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$price = false;
			}

			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				$discount = floor((($result['price']-$result['special'])/$result['price'])*100);
			} else {
				$special = false;
			}

			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}

			$products[] = array(
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,
				'thumb2'   	 => isset($thumb2)?$thumb2:'',
				'name'    	 => $result['name'],
				'price'   	 => $price,
				'date_added' => $result['date_added'],
				'discount'   => isset($discount)?'-'.$discount.'%':'',
				'special' 	 => $special,
				'rating'     => $rating,
				'description'=> (html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')),
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'path='.$catid.'&product_id=' . $result['product_id']),
			);
		}
		return $products;
	}
}
?>