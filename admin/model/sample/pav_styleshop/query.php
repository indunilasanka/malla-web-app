<?php 

$query['pavmegamenu'][]  = "DELETE FROM `".DB_PREFIX ."setting` WHERE `code`='pavmegamenu' and `key` = 'pavmegamenu_module'";
$query['pavmegamenu'][] =  " 
INSERT INTO `".DB_PREFIX ."setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(0, 0, 'pavmegamenu', 'pavmegamenu_module', '', 0);
";

$query['pavmegamenu'][]  = "DELETE FROM `".DB_PREFIX ."setting` WHERE `code`='pavmegamenu_params' and `key` = 'params'";
$query['pavmegamenu'][] =  " 
INSERT INTO `".DB_PREFIX ."setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(0, 0, 'pavmegamenu_params', 'pavmegamenu_params', '[{\"submenu\":1,\"subwidth\":1140,\"id\":51,\"align\":\"aligned-left\",\"code\":0,\"cols\":1,\"rows\":[{\"cols\":[{\"widgets\":\"wid-22\",\"colwidth\":3},{\"widgets\":\"wid-19\",\"colwidth\":2},{\"widgets\":\"wid-18\",\"colwidth\":2},{\"widgets\":\"wid-17\",\"colwidth\":2},{\"widgets\":\"wid-16\",\"colwidth\":3}]}]},{\"submenu\":1,\"subwidth\":795,\"id\":49,\"align\":\"aligned-left\",\"code\":0,\"cols\":1,\"rows\":[{\"cols\":[{\"widgets\":\"wid-20\",\"colwidth\":3},{\"widgets\":\"wid-21\",\"colwidth\":9}]}]},{\"submenu\":1,\"id\":52,\"align\":\"aligned-left\",\"code\":0,\"cols\":1,\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]},{\"id\":60,\"code\":0,\"cols\":1,\"submenu\":1,\"align\":\"aligned-left\",\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]},{\"id\":59,\"code\":0,\"cols\":1,\"submenu\":1,\"align\":\"aligned-left\",\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]},{\"id\":54,\"code\":0,\"cols\":1,\"submenu\":1,\"align\":\"aligned-left\",\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]}]', 0);
";

$query['pavverticalmenu'][]  = "DELETE FROM `".DB_PREFIX ."setting` WHERE `code`='pavverticalmenu_params' and `key` = 'params'";
$query['pavverticalmenu'][] =  " 
INSERT INTO `".DB_PREFIX ."setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES

(0, 0, 'pavverticalmenu_params', 'params', '[{\"id\":44,\"group\":0,\"cols\":1,\"subwidth\":600,\"submenu\":1,\"rows\":[{\"cols\":[{\"widgets\":\"wid-7\",\"colwidth\":4},{\"widgets\":\"wid-8\",\"colwidth\":8}]},{\"cols\":[{\"widgets\":\"wid-9\",\"colwidth\":4},{\"widgets\":\"wid-10\",\"colwidth\":8}]}]},{\"submenu\":1,\"subwidth\":600,\"id\":49,\"cols\":2,\"group\":0,\"rows\":[{\"cols\":[{\"widgets\":\"wid-3\",\"colwidth\":12}]}]},{\"id\":46,\"group\":0,\"cols\":1,\"submenu\":1,\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]},{\"id\":53,\"group\":0,\"cols\":1,\"submenu\":1,\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]},{\"id\":76,\"group\":0,\"cols\":1,\"submenu\":1,\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]},{\"id\":60,\"group\":0,\"cols\":1,\"submenu\":1,\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]}]', 0);
";

$query['pavblog'][] ="
INSERT INTO `".DB_PREFIX ."layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(0, 14, 0, 'pavblog/%');
";
$query['pavblog'][] ="
INSERT INTO `".DB_PREFIX ."layout` (`layout_id`, `name`) VALUES
(0, 'Pav Blog');
";
?>
