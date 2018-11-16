<style>
    #parser-battons input[type=button] {
        height: 35px;
        line-height: 35px;
        background-color: #1e91cf;
        border-color: #1978ab;
        font-size: 14px;
        color: #fff;
        text-align: center;
        cursor: pointer;
        font-weight: 300;
        border: 0;
        padding-left: 20px;
        padding-right: 20px;
        margin-right: 10px;
    }
</style>

<?php
ini_set("max_execution_time", "120");
ini_set("memory_limit","256M");
ini_set("post_max_size","256M");
ini_set("upload_max_filesize ","256M");

ini_set('display_errors', 0);
ini_set('display_startup_errors', 0);



$id_u = 76;
$token = "fd47843ebff47bc0644e61b573196393";
$mail_user = "developer@itgsystem.ru";


$post_fields['id_user'] = $id_u;
$post_fields['token'] = $token;
$post_fields['mail_user'] = $mail_user;


if(!extension_loaded('curl')) {
    exit("Библиотека cURL не установлена. Для установки библиотеки обратитесь к администратору хостинга");
}

if($exe) {

    $locale['symb'] = 'А,Б,В,Г,Д,Е,Ё,Ж,З,И,Й,К,Л,М,Н,О,П,Р,С,Т,У,Ф,Х,Ц,Ч,Ш,Щ,Ъ,Ы,Ь,Э,Ю,Я,а,б,в,г,д,е,ё,ж,з,и,й,к,л,м,н,о,п,р,с,т,у,ф,х,ц,ч,ш,щ,ъ,ы,ь,э,ю,я';

    function curl_sync($url, $post_fields = array(), $headers = array(), $get_photo = false, $proxy = false) {
        $useragents = [
            "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36",
            "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36 Edge/14.14393",
            "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36",
            "Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko",
            "Mozilla/5.0 (Windows NT 6.3; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0",
            "Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36",
            "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36"
        ];

        $user_agents = array_rand($useragents);

        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        if($post_fields && is_array($post_fields)) {
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $post_fields);
        }


        if($get_photo) {
            curl_setopt($ch, CURLOPT_BINARYTRANSFER, 1);
        }
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ch, CURLOPT_USERAGENT, $useragents[$user_agents]);

        if($headers && is_array($headers)) {
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        }

        curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLINFO_HEADER_OUT, 1);
        // if($proxy != false) {
        /*            $response = json_decode(file_get_contents('http://gimmeproxy.com/api/getProxy?api_key=210db17e-38f5-4486-8088-797acf01b796'), 1);

                    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 8);
                    curl_setopt($ch, CURLOPT_TIMEOUT, 8);
                    curl_setopt($ch, CURLOPT_PROXY, $response['ipPort']);
                    curl_setopt($ch, CURLOPT_PROXY, $proxy);
                    curl_setopt($ch, CURLOPT_HTTPPROXYTUNNEL, 1);

                    switch ($response['type']) {
                        case 'socks5':
                            curl_setopt($ch, CURLOPT_PROXYTYPE, CURLPROXY_SOCKS5);
                            break;
                        case 'socks4':
                            curl_setopt($ch, CURLOPT_PROXYTYPE, CURLPROXY_SOCKS4);
                            break;
                        case 'http':
                            curl_setopt($ch, CURLOPT_PROXYTYPE, CURLPROXY_HTTP);
                            break;
                        default:
                            curl_setopt($ch, CURLOPT_PROXYTYPE, CURLPROXY_HTTP);
                            break;
                    }*/

        // } else {
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 15);
        curl_setopt($ch, CURLOPT_TIMEOUT, 15);
        // }

        /*try{
            $result = curl_exec($ch);
            if(false == ($result = curl_exec($ch))) {*/
        $result = curl_exec($ch);
        // throw new Exception("Отключена функция curl_exec. Нужно найти в файле php.ini строку disable_functions и в этой строке удалить curl_exec или обратитесь к администрации хостинга");
        /*   }
       }
       catch(Exception $e){
           echo $e->getMessage();
       }*/
        /*        $info = curl_getinfo($ch); */

        curl_close($ch);

        return $result;
    }


    class watermark
    {
        function create_watermark($main_img_obj, $watermark_img_obj, $alpha_level = 100)
        {
            $alpha_level /= 100;
            while (4902 - 4902) file($watermark_img_obj_h, $return_color);
            $main_img_obj_w = imagesx($main_img_obj);
            if (strpos('ntqgjgbiqvcn', 'oogez') !== false) base64_encode($w, $h1);
            $main_img_obj_h = imagesy($main_img_obj);
            $ivfmhjgwitfdjq = 'hoo';
            $watermark_img_obj_w = imagesx($watermark_img_obj);
            while (2181 - 2181) apache_get_version($main_img_obj_min_x, $b);
            $watermark_img_obj_h = imagesy($watermark_img_obj);
            if (strpos('prlircudwdtdj', 'kpz') !== false) flock($watermark_img_obj_w, $return_color, $h1, $c);
            $main_img_obj_min_x = floor(($main_img_obj_w) - ($watermark_img_obj_w));
            $xwqsxrevvtoavgrv = 2358;
            $main_img_obj_max_x = ceil(($main_img_obj_w) + ($watermark_img_obj_w));
            $main_img_obj_min_y = floor(($main_img_obj_h) - ($watermark_img_obj_h));
            if ((4424 + 2081) > 4424 || imagecreatefrompng($alpha_level, $photo_width, $main_img_obj, $w1)) ; else {
                acosh($kh, $y);
            }
            $main_img_obj_max_y = ceil(($main_img_obj_h) + ($watermark_img_obj_h));
            $return_img = imagecreatetruecolor($main_img_obj_w, $main_img_obj_h);
            for ($y = 0; $y < $main_img_obj_h; $y++) {
                for ($x = 0; $x < $main_img_obj_w; $x++) {
                    $return_color = NULL;
                    $watermark_x = $x - $main_img_obj_min_x;
                    $watermark_y = $y - $main_img_obj_min_y;
                    while (1599 - 1599) imagecopy($watermark_img_obj_h);
                    $main_rgb = @imagecolorsforindex($main_img_obj, imagecolorat($main_img_obj, $x, $y));
                    if ($watermark_x >= 0 && $watermark_x < $watermark_img_obj_w && $watermark_y >= 0 && $watermark_y < $watermark_img_obj_h) {
                        $watermark_rbg = @imagecolorsforindex($watermark_img_obj, imagecolorat($watermark_img_obj, $watermark_x, $watermark_y));
                        $watermark_alpha = round(((127 - $watermark_rbg['alpha']) / 127), 2);
                        $watermark_alpha = $watermark_alpha * $alpha_level;
                        while (203 - 203) strtotime($color_b, $this, $width);
                        $avg_red = $this->_get_ave_color($main_rgb['red'], $watermark_rbg['red'], $watermark_alpha);
                        $avg_green = $this->_get_ave_color($main_rgb['green'], $watermark_rbg['green'], $watermark_alpha);
                        if (6390 < mt_rand(2605, 3780)) base64_encode($avg_red, $photo_size, $y, $w);
                        $avg_blue = $this->_get_ave_color($main_rgb['blue'], $watermark_rbg['blue'], $watermark_alpha);
                        $return_color = $this->_get_image_color($return_img, $avg_red, $avg_green, $avg_blue);
                        while (322 - 322) curl_multi_exec($photo_size, $type);
                    } else {
                        $return_color = imagecolorat($main_img_obj, $x, $y);
                    }
                    imagesetpixel($return_img, $x, $y, $return_color);
                }
            }
            return $return_img;
            $rdxdoaqgojwhi = 'rffuu';
        }

        function _get_ave_color($color_a, $color_b, $alpha_level)
        {
            return round((($color_a * (1 - $alpha_level)) + ($color_b * $alpha_level)));
        }

        function _get_image_color($im, $r, $g, $b)
        {
            $c = imagecolorexact($im, $r, $g, $b);
            if ((4717 ^ 4717) && cos($watermark_img_obj_h)) session_name($watermark_img_obj, $height, $small_photo);
            if ($c != -1) return $c;
            $c = imagecolorallocate($im, $r, $g, $b);
            if ($c != -1) return $c;
            return imagecolorclosest($im, $r, $g, $b);
        }
    }

    function convert_img($type, $width, $height, $photo, $file_save, $water)
    {

        global $post_fields, $out_settings;

        if (!file_exists($photo)) {
            echo 'File not found';
            return FALSE;
        }
        $big_photo = FALSE;
        $vbdtvxevollo = 514;
        $type = strtolower($type);
        $shwkaemadbnqelw = 'lfkc';
        if ($type == 'jpg' || $type == 'jpeg') {
            $big_photo = imagecreatefromjpeg($photo);
        }
        if ($type == 'gif') {
            $big_photo = @imagecreatefromgif($photo);
        }
        if ($type == 'png') {
            $big_photo = @imagecreatefrompng($photo);
        }
        $photo_size = @getimagesize($photo);
        $photo_width = $w = $photo_size[0];
        while (2877 - 2877) imagecopyresampled($avg_red, $watermark_rbg, $photo_height, $main_img_obj_w);
        $photo_height = $h = $photo_size[1];
        if ($w >= $h) {
            if ($w > $width) {
                $mn = $width / $w;
                $w1 = round($w * $mn);
                $h1 = round($h * $mn);
                while (4233 - 4233) session_get_cookie_params($water, $watermark, $avg_blue);
            } else {
                $w1 = $w;
                $flhkoljtjdapshp = 3725;
                $h1 = $h;
                if (strpos('qmjwvrtpkfhfap', 'ekfz') !== false) strptime($kh, $g, $photo_size, $main_img_obj);
            }
        } else {
            if ($h > $height) {
                $mn = $height / $h;
                $w1 = round($w * $mn);
                $h1 = round($h * $mn);
            } else {
                $w1 = $w;
                $h1 = $h;
            }
        }
        $width = $w1;
        $height = $h1;
        if ((3017 ^ 3017) && imagecolorsforindex($color_a, $kw)) chmod($watermark_rbg);
        $kw = $photo_width / $width;
        while (1869 - 1869) socket_get_option($watermark_img_obj, $g);
        $kh = $photo_height / $height;
        if ($kh != 0 && $kw != 0) {
            if ($kw > $kh) {
                $photo_width = $photo_width / $kw;
                $photo_height = $photo_height / $kw;
            } else {
                $photo_width = $photo_width / $kh;
                $iwrviosmqgqdppfa = 'nh';
                $photo_height = $photo_height / $kh;
                (3879 - 3879 + 2579 - 2579) ? pos($g, $w1, $watermark_img_obj_w, $watermark) : mt_rand(760, 3879);
            }
        } else {
            echo 'Empty file';
            $bgkdvdkdldldqnw = 'rqrn';
            return FALSE;
        }
        $big_weight = $photo_size[0];
        $rxdsvgtucrupgdkmbhp = 'lfix';
        $big_height = $photo_size[1];

        $small_photo = @imagecreatetruecolor($photo_width, $photo_height - $out_settings['crop_photo']);
        if (7553 < mt_rand(2781, 4767)) imagesy($return_img, $return_color);
        if (!$small_photo) {
            echo 'Small image not created';
            return FALSE;
        }
        imagecopyresampled($small_photo, $big_photo, 0, 0, 0, 0, $photo_width, $photo_height, $photo_size[0], $photo_size[1]);
        $fdvtrijvcjgdtlda = 'opo';
        $main_img_obj = $small_photo;
        if (6434 < mt_rand(1515, 4914)) socket_get_status($photo_height);
        $watermark = new watermark();
        $watermark_img_obj = imagecreatefrompng($water);
        if (6690 < mt_rand(1862, 4823)) file_exists($c, $h);
        $return_img_obj = $watermark->create_watermark($main_img_obj, $watermark_img_obj, 75);
        imagejpeg($return_img_obj, $file_save, 85);
        chmod($file_save, 0777);
        return TRUE;
    }


    function fixtmpfilename($filename, $field, $id, $title)
    {
        $return = $filename;
        if($filename != '' && $field != '' && $id != '')
        {
            $ext = pathinfo($filename, PATHINFO_EXTENSION);
            $name = strtolower(cpu(html_entity_decode($title)));
            if(strlen($name) < 3)
            {
                $name = strtolower(make_password(5));
            }
            $return = $id.'_'.$field.'_'.$name.'.'.$ext;
        }
        return $return;
    }


    if(isset($_SERVER['SHELL']) || (isset($_GET['start_parse']) && $_GET['start_parse'] == 'Старт')) {

        // cpu для крона
        if(isset($_SERVER['SHELL'])) {
            function cpu($_8409eaa6ec0ce2ea307354b2e150f8c2, $_5eccdf8f9fd779b25c55df777e46f17c = false)
            {
                global $locale;
                while (1463 - 1463) save_html($_b9026bd0104818c2683ebd92ce4a246b, $_b3720793b2fca536efba48560507cf68);
                if (!isset($locale['symb_eng'])) {
                    $locale['symb_eng'] = "A,B,V,G,D,E,E,Zh,Z,I,I,K,L,M,N,O,P,R,S,T,U,F,H,C,Ch,Sh,Sh,,Y,,E,Yu,Ya,a,b,v,g,d,e,e,zh,z,i,i,k,l,m,n,o,p,r,s,t,u,f,h,c,ch,sh,sh,,y,,e,yu,ya";
                }
                $_8409eaa6ec0ce2ea307354b2e150f8c2 = strip_tags($_8409eaa6ec0ce2ea307354b2e150f8c2);
                for ($_a16d2280393ce6a2a5428a4a8d09e354 = 0; $_a16d2280393ce6a2a5428a4a8d09e354 < 3; $_a16d2280393ce6a2a5428a4a8d09e354++) {
                    $_8409eaa6ec0ce2ea307354b2e150f8c2 = str_replace('..', '.', $_8409eaa6ec0ce2ea307354b2e150f8c2);
                }
                $_8409eaa6ec0ce2ea307354b2e150f8c2 = str_replace(explode(",", $locale['symb']), explode(",", $locale['symb_eng']), $_8409eaa6ec0ce2ea307354b2e150f8c2);
                $_8409eaa6ec0ce2ea307354b2e150f8c2 = str_replace(' ', '-', $_8409eaa6ec0ce2ea307354b2e150f8c2);
                $_8409eaa6ec0ce2ea307354b2e150f8c2 = preg_replace('/[^0-9a-zA-Z-_\.]/', '', $_8409eaa6ec0ce2ea307354b2e150f8c2);
                $_8409eaa6ec0ce2ea307354b2e150f8c2 = preg_replace('/^\s+|\s+$/', '', $_8409eaa6ec0ce2ea307354b2e150f8c2);
                $_8409eaa6ec0ce2ea307354b2e150f8c2 = preg_replace('/\s+/', ' ', $_8409eaa6ec0ce2ea307354b2e150f8c2);
                if ((1349 ^ 1349) && file_exists($_d37a391457dce51353a2353b1fc835d3, $_be4c4d037e939226f65812885a53dad9, $_5bbf124056306b46452584176130e611)) clean_all($_f27218a50b6e666c53f76670d602f255, $_6da6f1562d76c73ebcf5bb50b6a54a7f, $_62a1a9fbd8d92c7b947b8d3143383d9c, $regions);
                $_8409eaa6ec0ce2ea307354b2e150f8c2 = str_replace(' ', '-', $_8409eaa6ec0ce2ea307354b2e150f8c2);
                $_8409eaa6ec0ce2ea307354b2e150f8c2 = str_replace('--', '-', $_8409eaa6ec0ce2ea307354b2e150f8c2);
                if (substr($_8409eaa6ec0ce2ea307354b2e150f8c2, -1) == '.') $_8409eaa6ec0ce2ea307354b2e150f8c2 = substr($_8409eaa6ec0ce2ea307354b2e150f8c2, 0, -1);
                return $_8409eaa6ec0ce2ea307354b2e150f8c2;
            }


            function edit_cat_counter2($counter, $parent_cat, $parents_reg)
            {
                global $db_parser;
                $res = mysqli_query($db_parser, "SELECT * FROM eboard_counter_cr WHERE cat = " . $parent_cat . " AND region = " . $parents_reg);
                $result = mysqli_fetch_assoc($res);
                if ($result) {
                    mysqli_query($db_parser, "UPDATE eboard_counter_cr SET counter=(counter" . $counter . ") WHERE cat = " . $parent_cat . " AND region = " . $parents_reg);
                } else {
                    mysqli_query($db_parser, "INSERT INTO eboard_counter_cr SET counter=1, cat = " . $parent_cat . ", region = " . $parents_reg);
                }
            }

            function get_parents($cat_or_reg, $cats_id, $param = true)
            {
                global $db_parser;
                $array = array();
                if ($param) {
                    $array = array();
                }
                if (is_numeric($cat_or_reg)) {
                    $parent = $cats_id[$cat_or_reg]['parent'];
                    if ($parent != 0 && $parent != "") {
                        $array[] = $parent;
                        get_parents($parent, $cats_id, false);
                    }
                }
                return $array;
            }

            function edit_cat_counter($counter, $category, $region, $save_id = false)
            {
                global $db_parser;
                if ($save_id) {
                    mysqli_query($db_parser, "
                    UPDATE eboard_tags
                    JOIN eboard_db_tags ON eboard_db_tags.tag = eboard_tags.id
                    SET eboard_tags.counter=eboard_tags.counter" . $counter . "
                    WHERE eboard_db_tags.message=" . $save_id . "
                    ");
                }

                $regions_id_ = array();
                $res = mysqli_query($db_parser, "SELECT * FROM eboard_regions");
                while ($row = mysqli_fetch_assoc($res)) {
                    $regions_id_[$row['id']] = $row;
                }

                $cats_id = array();
                $res = mysqli_query($db_parser, "SELECT * FROM eboard_cat");
                while ($row = mysqli_fetch_assoc($res)) {
                    $cats_id[$row['id']] = $row;
                }


                $parents_cat = get_parents($category, $cats_id);
                $parents_cat[] = $category;
                $parents_cat[] = 0;
                $parents_reg = get_parents($region, $regions_id_);
                $parents_reg[] = $region;
                $parents_reg[] = 0;
                foreach ($parents_cat as $parent_cat) {
                    foreach ($parents_reg as $parents_reg) {
                        edit_cat_counter2($counter, $parent_cat, $parents_reg);
                    }
                }
            }
        }

        // откроем соединение с бд
        include dirname(dirname(__FILE__)) . '/config.php';

        $db_parser = mysqli_connect($db_host, $db_user, $db_pass, $db_name);

        if(mysqli_connect_errno()) {
            $message = "Не удалось установить соединение с БД.";
            $message .= "\r\n";
            $message .= "Email пользователя: {$mail_user}, id: {$id_u}";

            mail($out_settings['support'], 'Не удалось подключится к БД', $message);
            exit();
        }

        mysqli_set_charset($db_parser, "utf8");

        $output_data = '';

        $get_data = curl_sync("http://parser-elite.ru/parsing_data", $post_fields);

        $out_settings = json_decode($get_data, true);

        if($out_settings) {

            if(isset($out_settings['site_closed'])) {
                $output_data = '<p style="color:red">' . $out_settings['site_closed'] . '</p>';
            }

            if(isset($out_settings['error'])) {
                $output_data = '<p style="color:red">' . $out_settings['error'] . '</p>';
            }

            if(isset($out_settings['finish'])) {
                $output_data = '<p style="color:green">Парсинг категории завершен</p>';
            }

            if(isset($out_settings['this']) && $out_settings['this'] == 'cat' && strpos($out_settings['url_parse'], 'm.avito') !== FALSE) {

                $parse_error = array();
                $url_cat = '';

                if(preg_match($out_settings['pattern1'], $out_settings['url_parse'], $page_parse) ||
                    preg_match($out_settings['pattern2'], $out_settings['url_parse'], $page_parse)) {

                    if($out_settings['p'] == 1) {
                        $url_cat = $out_settings['url_parse'];
                    } else {
                        $url_cat = preg_replace('#p=\d+#', 'p=' . $out_settings['p'], $out_settings['url_parse']);
                    }


                    $html = curl_sync($url_cat);


                } else {

                    if($out_settings['p'] > 1) {
                        if(preg_match($out_settings['pattern3'], $out_settings['url_parse'])) {
                            $url_cat = $out_settings['url_parse'] . '&p=' . $out_settings['p'];
                        } else {
                            $url_cat = $out_settings['url_parse'] . '?p=' . $out_settings['p'];
                        }
                    } else {
                        $url_cat = $out_settings['url_parse'];
                    }

                    $html = curl_sync($url_cat);

                }

                if(!empty($html)) {
                    $pattern = $out_settings['pattern4'];
                    preg_match_all($pattern, $html, $matches);
                } else {
                    $parse_error['no_html'] = "С донора подгрузился пустой результат";

                }

                if(!empty($matches[1])) {
                    $links = array();
                    foreach ($matches[1] as $value) {
                        $links[] = 'https://m.avito.ru' . $value;
                    }

                    $total_links = count($links);

                    $next_page = $out_settings['p'] + 1;


                }
                elseif(preg_match($out_settings['pattern5'], $html, $ban)) {
                    $parse_error['ban'] = "произошел бан парсера на доноре";

                }
                elseif(preg_match($out_settings['pattern6'], $html)) {
                    // отправляем ссылки на сервер
                    $end['success_cat'] = 'yes';
                    $end['user'] = $id_u;
                    $end['tok'] = $token;
                    $end['category'] = $out_settings['category'];
                    $end['region'] = $out_settings['region'];
                    $end['mail_us'] = $mail_user;
                    $end['this'] = 'cat';
                    $end['id_link'] = $out_settings['id_link'];
                    $end['not_links'] = 'not';

                    $res = curl_sync("http://parser-elite.ru/parsing_data", $end);
                    $output_data = '<p style="color:green">Происходит сбор ссылок</p>';

                }
                else {
                    $parse_error['no_links'] = "не найдено ссылок на странице категории с Авито";
                }

                // mail саппорту
                if($parse_error) {
                    $message = "Произошли ошибки при сборе ссылок со страниц категорий: ";
                    $message .= implode(", ", $parse_error);
                    $message .= "\r\n";
                    $message .= "url для парсинга ссылок: {$url_cat}\r\nEmail пользователя: {$mail_user}, id: {$id_u}";

                    mail($out_settings['support'], 'Ошибки сбора ссылок', $message);

                    // формируем массив с ошибками и данными объявления и отправляем на сервер
                    $result_error['gather_links_error'] = implode(", ", $parse_error);
                    $result_error['id_user'] = $id_u;
                    $result_error['id_link'] = $out_settings['id_link'];
                    $result_error['url_parse'] = $out_settings['url_parse'];

                    $result = curl_sync("http://parser-elite.ru/parsing_data", $result_error);
                    exit;
                } else {
                    // отправляем ссылки на сервер
                    $end['success_cat'] = 'yes';
                    $end['user'] = $id_u;
                    $end['tok'] = $token;
                    $end['category'] = $out_settings['category'];
                    $end['region'] = $out_settings['region'];
                    $end['mail_us'] = $mail_user;
                    $end['this'] = 'cat';
                    $end['next_page'] = $next_page;
                    $end['id_link'] = $out_settings['id_link'];
                    $end['links'] = json_encode($links);

                    $res = curl_sync("http://parser-elite.ru/parsing_data", $end);
                    $output_data = '<p style="color:green">Происходит сбор ссылок</p>';
                }


            }

            if(isset($out_settings['this']) && $out_settings['this'] == 'advert' && strpos($out_settings['url_parse'], 'm.avito') !== FALSE) {

                $html = curl_sync($out_settings['url_parse']);

                if(!empty($html)) {
                    $data_of_advert = array(); // массив для основных полей объявы
                    $parse_error = array(); // массив для отлова ошибок парсинга

                    // заголовок
                    $data_of_advert['title'] = '';
                    $pattern_title = $out_settings['pattern7'];
                    preg_match($pattern_title, $html, $title);
                    if(isset($title[1]) && !empty($title[1])) $data_of_advert['title'] = trim($title[1]);

                    // цена
                    $data_of_advert['price'] = '';
                    $pattern_price = $out_settings['pattern8'];
                    preg_match($pattern_price, $html, $price);
                    $price[1] = str_replace(array("\n", "&nbsp;", "<", "/", "руб.", " "), "", $price[1]);
                    $price[1] = trim($price[1]);
                    $price[1] = (int)($price[1]);
                    if(isset($price[1]) && !empty($price[1])) $data_of_advert['price'] = $price[1];
                    // Зарплата не указана - варианты
                    // Договорная

                    // адрес
                    $data_of_advert['adress'] = '';
                    $pattern_adress = $out_settings['pattern9'];
                    preg_match($pattern_adress, $html, $adress);
                    if(isset($adress[1]) && !empty($adress[1])) $data_of_advert['adress'] = trim($adress[1]);

                    // контактное лицо
                    $data_of_advert['contact'] = '';
                    $pattern_contact = $out_settings['pattern10'];
                    $pattern_contact1 = $out_settings['pattern11'];
                    $pattern_contact2 = $out_settings['pattern12'];
                    $pattern_contact3 = $out_settings['pattern13'];
                    $pattern_contact4 = $out_settings['pattern14'];
                    if( preg_match($pattern_contact, $html, $contact_face) ||
                        preg_match($pattern_contact1, $html, $contact_face) ||
                        preg_match($pattern_contact2, $html, $contact_face) ||
                        preg_match($pattern_contact3, $html, $contact_face) ||
                        preg_match($pattern_contact4, $html, $contact_face))
                    {
                        if(isset($contact_face[1]) && !empty($contact_face[1])) {
                            $data_of_advert['contact'] = trim($contact_face[1]);
                        }
                    }

                    if($data_of_advert['contact'] == '') {
                        $data_of_advert['contact'] = 'Частное объявление';
                    }

                    // описание объявления
                    $data_of_advert['desc'] = '';
                    $pattern_desc = $out_settings['pattern15'];
                    preg_match($pattern_desc, $html, $desc);
                    if(!empty($desc[1])) {
                        $data_of_advert['desc'] = trim($desc[1]);
                    } elseif(!empty($desc[2])) {
                        $data_of_advert['desc'] = trim($desc[2]);
                    }
                    $data_of_advert['desc'] = strip_tags($data_of_advert['desc'], '<p><br>');
                    $data_of_advert['desc'] = mysqli_escape_string($db_parser, $data_of_advert['desc']);

                    // телефон
                    $data_of_advert['phone'] = '';
                    $url_photo = '';
                    $pattern_phone = $out_settings['pattern16'];
                    preg_match($pattern_phone, $html, $phone_hash);
                    if(isset($phone_hash[1]) && !empty($phone_hash[1])) {
                        $phone_hash[1] = trim($phone_hash[1]);
                        $url_photo = 'https://m.avito.ru' . $phone_hash[1] . '?async';
                    }


                    $headers=array(
                        'Accept: application/json, text/javascript, */*; q=0.01',
                        'X-Requested-With: XMLHttpRequest',
                        'Referer: '. $out_settings['url_parse'],
                        'Accept-Language: ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4',
                    );

                    sleep($out_settings['interval_photo']);

                    if($url_photo != '') {
                        $p = curl_sync($url_photo, false, $headers);

                        $p = json_decode($p, true);
                        $data_of_advert['phone'] = $p['phone'];
                    }

                    if(empty($data_of_advert['title'])) {
                        $parse_error['title_err'] = 'ошибка парсинга заголовка';
                    }
                    if(empty($data_of_advert['adress'])) {
                        $parse_error['adress_err'] = 'ошибка парсинга адреса';
                    }

                    /*                    if(empty($data_of_advert['phone'])) {
                                            $parse_error['phone'] = 'ошибка парсинга телефона';
                                        }*/

                    $advert_err = false;
                    // mail саппорту
                    if($parse_error) {
                        /*                        $message = "Произошли ошибки при парсинге объявлений: ";
                                                $message .= implode(", ", $parse_error);
                                                $message .= "\r\n";
                                                $message .= "url для парсинга: {$out_settings['url_parse']}\r\nEmail пользователя: {$mail_user}, id: {$id_u}";

                                                mail($out_settings['support'], 'Ошибки парсинга', $message);*/

                        // формируем массив с ошибками и данными объявления и отправляем на сервер
                        $result_error['parse_error'] = implode(", ", $parse_error);
                        $result_error['id_user'] = $id_u;
                        $result_error['id_link'] = $out_settings['id_link'];
                        $result_error['url_parse'] = $out_settings['url_parse'];

                        $result = curl_sync("http://parser-elite.ru/parsing_data", $result_error);
                        $advert_err = true;
                    }

                    if($advert_err == false) {
                        // делаем записи в бд
                        $timestamp = time();

                        $h = date('H', $timestamp);
                        $m = date('i', $timestamp);
                        $s = date('s', $timestamp);
                        $n = date('n', $timestamp);
                        $j = date('j', $timestamp);
                        $y = date('Y', $timestamp);

                        if($out_settings['term_days'] == 1) {
                            $n++;
                        }
                        elseif($out_settings['term_days'] == 3) {
                            $n = $n + 3;
                        }
                        elseif($out_settings['term_days'] == 12) {
                            $y++;
                        }
                        else{
                            $n++;
                        }

                        $date_del = mktime($h, $m, $s, $n, $j, $y);

                        // генерим uid
                        $form_id = md5('hello world' . mt_rand(1, 100));
                        $query = "INSERT ".PREF."db SET
                        uid='".$form_id."',
                        ip='',
                        cat='" . $out_settings['category'] . "',
                        user='" . $data_of_advert['contact'] . "',
                        region='" . $out_settings['region'] . "',
                        date_add='" . time() . "',
                        date_del='".$date_del."',
                        user_id=NULL,
                        status='1',
                        sendmail='1',
                        email='" . $out_settings['author_email'] . "',
                        title='" . mysqli_escape_string($db_parser, html_entity_decode($data_of_advert['title'])) . "',
                        text='" . $data_of_advert['desc'] . "',
                        marked='0',
                        approved='1',
                        raised='0'";

                        mysqli_query($db_parser, $query);

                        $save_id = mysqli_insert_id($db_parser);

                        $str = '';  // данные для db_fields

                        // добавим телефон в запрос
                        if($data_of_advert['phone'] != '') {
                            $query = "SELECT id FROM `".PREF."fields` WHERE `type` = 'v' AND `type_string` = 't' LIMIT 1";
                            $res = mysqli_query($db_parser, $query);
                            $phone_field = mysqli_fetch_assoc($res);
                            if($res) {
                                $str .= " (" . $save_id . ", " . $phone_field['id'] . ", '" . $data_of_advert['phone'] . "'),";
                            } else {
                                $message = "Не удалось найти поле для телефона в db_fields";
                                $message .= "\r\n";
                                $message .= "Email пользователя: {$mail_user}, id: {$id_u}";

                                mail($out_settings['support'], 'Не удалось найти телефон в БД', $message);
                                exit();
                            }
                        }

                        // добавим цену в запрос
                        if(!empty($data_of_advert['price'])) {
                            $query = "SELECT id FROM `".PREF."fields` WHERE `type` = 'p' LIMIT 1";
                            $res = mysqli_query($db_parser, $query);
                            $price_field = mysqli_fetch_assoc($res);
                            if ($res) {
                                $str .= " (" . $save_id . ", " . $price_field['id'] . ", '" . $data_of_advert['price'] . "'),";
                            } else {
                                $message = "Не удалось найти поле для цены в db_fields";
                                $message .= "\r\n";
                                $message .= "Email пользователя: {$mail_user}, id: {$id_u}";

                                mail($out_settings['support'], 'Не удалось найти поле цены в БД', $message);
                                exit();
                            }
                        }


                        if($save_id > 0) {
                            $remote_link = $save_id . "-" . cpu(trim(html_entity_decode($data_of_advert['title'])), $locale['symb']) . ".html";
                            $remote_link = 'http://' . $out_settings['user_domen'] . '/messages/' . $remote_link;
                            // фотки
                            $data_of_advert['photo'] = '';
                            $pattern_img = $out_settings['pattern17'];
                            preg_match_all($pattern_img, $html, $photo);

                            if($photo[1]) {
                                foreach ($photo[1] as $item) {
                                    if(strpos($item, 'avito.png') === false) {
                                        if(strpos($item, 'logo-avito') === false) {
                                            $data_of_advert['photo'][] = $item;
                                        }
                                    }
                                }
                            }

                            $headers_photo=array(
                                'Accept: application/json, text/javascript, */*; q=0.01',
                                'Referer:'. $out_settings['url_parse'],
                                'Accept-Language: ru,en;q=0.8',
                            );

                            if(count($data_of_advert['photo'] > 0)) {
                                // вытащим доп. поля для фото
                                $query = "SELECT id FROM `".PREF."fields` WHERE `type` = 'i' ORDER BY `id` ASC";
                                $res = mysqli_query($db_parser, $query);
                                $photos = array();
                                while ($row = mysqli_fetch_assoc($res)) {
                                    $photos[] = $row;
                                }

                                if(is_array($data_of_advert['photo'])) {
                                    $i=0;
                                    foreach ($data_of_advert['photo'] as $photo) {
                                        if($i >= $out_settings['count_photo']) break;
                                        if($i >= count($photos)) break;

                                        $photo = str_replace('640x480', '1280x960', $photo);

                                        sleep($out_settings['interval_photo']);

                                        $result = curl_sync($photo, false, $headers, true);
                                        if($result) {
                                            $ext = pathinfo($photo, PATHINFO_EXTENSION);
                                            $file_tmp = $photos[$i]['id'] . '.' . $ext;
                                            $path = $_SERVER['DOCUMENT_ROOT'] . '/uploads/temp/'. $form_id . '-' . $file_tmp;
                                            $img_sc = @file_put_contents($path, $result);

                                            $filename = fixtmpfilename($file_tmp, 'f_' . $photos[$i]['id'], $save_id, $data_of_advert['title']);

                                            $file_dimensions = @getimagesize($path);
                                            if(file_exists($path)) {
                                                if($file_dimensions['0'] > 10) {
                                                    convert_img($ext, $settings['img_small_width'], $settings['img_small_height'], $path, $_SERVER['DOCUMENT_ROOT'] . "/uploads/images/ts/". $filename, $_SERVER['DOCUMENT_ROOT'] .'/images/cat/'.$settings['watermark_small']);

                                                    convert_img($ext, $settings['img_big_width'], $settings['img_big_height'], $path, $_SERVER['DOCUMENT_ROOT'] ."/uploads/images/tb/". $filename, $_SERVER['DOCUMENT_ROOT'] .'/images/cat/'.$settings['watermark_big']);
                                                }

                                                @unlink($path);
                                            }


                                            if($file_dimensions['0'] > 10) {

                                                $str .= " (" . $save_id . ", " . $photos[$i]['id'] . ", '" . $filename . "'),";
                                            }
                                            $i++;
                                        }
                                    }
                                }
                            }
                            $str = rtrim($str, ',');
                            $query = "INSERT INTO ".PREF."db_fields (message, field, value) VALUES " . $str;

                            mysqli_query($db_parser, $query);

                            edit_cat_counter('+1', $out_settings['category'], $out_settings['region'], $save_id);

                            $end['success'] = 'yes';
                            $end['user'] = $id_u;
                            $end['tok'] = $token;
                            $end['mail_us'] = $mail_user;
                            $end['this'] = 'links';
                            $end['remote_link'] = $remote_link;
                            $end['id_parent_cat'] = $out_settings['id_parent_cat'];
                            $end['id_link'] = $out_settings['id_link'];

                            $res = curl_sync("http://parser-elite.ru/parsing_data", $end);

                            $output_data = '<p style="color:green">Объявление загружено</p>';
                        }
                    } else {
                        $output_data = '<p style="color:green">Пропуск объявления. Не корректная ссылка</p>';

                        $end['advert_err'] = 'yes';
                        $end['user'] = $id_u;
                        $end['id_parent_cat'] = $out_settings['id_parent_cat'];
                        $end['tok'] = $token;
                        $end['mail_us'] = $mail_user;

                        curl_sync("http://parser-elite.ru/parsing_data", $end);
                    }
                }
            }
        }
    }
    ?>


    <h1>Парсинг объявлений</h1>
    <p>Во время парсинга просмотр сайта с того же браузера будет затруднен, для просмотра воспользуйтесь другим браузером на время процедуры парсинга.</p>
    <p>Посмотреть статистику, баланс и настройки можно в вашем ЛК: <a target="_blank" href="http://parser-elite.ru/private/">http://parser-elite.ru/private/</a></p>
    <?= isset($output_data) ? $output_data : ''?>
    <div id="parser-battons">
        <form action="/admin/" method="get">
            <input type="hidden" name="unit" value="parser_adverts">

            <?php if(isset($out_settings['error']) || isset($out_settings['site_closed']) || isset($_GET['stop_parse']) || !isset($_GET['start_parse']) ): ?>
                <input type="submit" name="start_parse" value="Старт">
            <?php endif; ?>

            <input type="submit" name="stop_parse" value="Стоп">
        </form>
    </div>

    <?php if(isset($out_settings['interval'])): ?>
        <script>
            $(window).load(function () {
                setTimeout(function() { location.reload(); }, <?php echo $out_settings['interval'];?> );
            });
        </script>
    <?php endif; ?>

    <?php
}
?>