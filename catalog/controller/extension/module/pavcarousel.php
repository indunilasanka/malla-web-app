<?php
class ControllerExtensionModulePavcarousel extends Controller {
	public  $data = array();

	public function index($setting) {

		static $module = 0;

		$this->data['objlang'] = $this->language;
		$this->data['objurl'] = $this->url;

		$this->load->model('design/banner');
		$this->load->model('tool/image');
		$this->load->language('extension/module/pavcarousel');

		$this->data['text_logo_brand'] = $this->language->get('text_logo_brand');


		if (file_exists('catalog/view/theme/' . $this->config->get('theme_default_directory') . '/stylesheet/pavcarousel.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('theme_default_directory') . '/stylesheet/pavcarousel.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/pavcarousel.css');
		}
		
		// merge data
		$default = array(
			'itemsperpage' => 4,
			'columns' => 4,
			'limit' => 8,
			'interval' => 3000,
			'auto_play' => 1
		);

		$mdata = array_merge($default, $setting);

		$this->data['name'] = isset($mdata['name']) ? $mdata['name'] : '';
		$this->data['itemsperpage'] = $mdata['itemsperpage'];
		$this->data['columns'] = $mdata['columns'];
		$this->data['limit'] = $mdata['limit'];
		$this->data['interval'] = $mdata['interval'];
		if($mdata['auto_play'] == 0){
			$this->data['interval'] = "false";
		}

		$this->data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (file_exists(DIR_IMAGE . $result['image'])) {
				$this->data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}

		$this->data['module'] = $module++;
	
		return $this->load->view('extension/module/pavcarousel', $this->data);

	
	}
}
?>