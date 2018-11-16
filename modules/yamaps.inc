<?php
//upd1701250
if(!isset($customconfig['point'])){
    $customconfig['point'] = array(51.2, 58.4, 10);
}
if(!isset($settings['maptype'])) $settings['maptype'] = 1;

if(isset($_GET['point']) )
	{
    if($_GET['point'] != "")
        {
    	$point = explode(',', $_GET['point']);
    	}
    else
        {
        //upd1701250
        $point = $customconfig['point'];
        }
    }
else
	{
    //upd1701250
    $point = $customconfig['point'];
	}



$pName = $locale[680];
$pDesc = $locale[681].': '.$point[0].','.$point[1];
if(isset($_GET['message']))
	{
    $pName = $fields[$_GET['field']]['name'];
    $pDesc = '';
	}

if($settings['maptype'] == '1'){

    echo '
        <!DOCTYPE html>
        <html>
          <head>
            <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
            <meta charset="utf-8">
            <title></title>
            <style>
              /* Always set the map height explicitly to define the size of the div
               * element that contains the map. */
              #map {
                height: 100%;
              }
              /* Optional: Makes the sample page fill the window. */
              html, body {
                height: 100%;
                margin: 0;
                padding: 0;
              }
            </style>
          </head>
          <body>
            <div id="map" style="width:100%;height:400px"></div>
            <script>
        
              function initMap() {
                var pl = false;
                var myLatLng = {lat: '.$point[0].', lng: '.$point[1].'};
        
                var map = new google.maps.Map(document.getElementById("map"), {
                  zoom: '.$point[2].',
                  center: myLatLng
                });
        
                ';
                
            if(isset($_GET['point'])){
                echo '                
                pl = placeMarker(myLatLng);
                ';
            }
            if(!isset($_GET['message'])){
                echo '
                    
                    google.maps.event.addListener(map, "click", function(event) {
                        if(pl != false){
                            pl.setMap(null);
                        }
                        pl = placeMarker(event.latLng);
                        var lat = pl.getPosition().lat();
                        var lng = pl.getPosition().lng();
                        var geopoint = lat + "," + lng + "," + map.getZoom();
                        top.document.getElementById("'.$_GET['field'].'").value = geopoint;
                    });

                    
                ';
            }                        
            echo '

                    function placeMarker(location) {
                        var marker = new google.maps.Marker({
                            position: location, 
                            map: map
                        });
                        return marker;
                    }                
              }
            </script>
            <script async defer
            src="https://maps.googleapis.com/maps/api/js?key='.$settings['mapkey'].'&callback=initMap">
            </script>
          </body>
        </html>
    ';
    exit();
}

echo '
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="'.PATH.'js/jquery.js" type="text/javascript"></script>
    <script src="'.$settings['http'].'://api-maps.yandex.ru/2.0/?load=package.full&lang=ru-RU" type="text/javascript"></script>

    <script type="text/javascript">
        // Создание обработчика для события window.onLoad
            ymaps.ready(function () { 
                
            var myPlacemark = false;
 
            var myMap = new ymaps.Map("YMapsID", {
                    // Центр карты
                    center: ['.$point[0].', '.$point[1].'],
                    // Коэффициент масштабирования
                    zoom: '.$point[2].'
                    // Тип карты
                    //type: "yandex#satellite"
                });

            // Для добавления элемента управления на карту
            // используется поле controls, ссылающееся на
            // коллекцию элементов управления картой.
            // Добавление элемента в коллекцию производится
            // с помощью метода add().

            // В метод add можно передать строковый идентификатор
            // элемента управления и его параметры.
            myMap.controls
                // Кнопка изменения масштаба
                .add("zoomControl")
                // Список типов карты
                .add("typeSelector")
                // Кнопка изменения масштаба - компактный вариант
                // Расположим её справа

                // Стандартный набор кнопок
                .add("mapTools");

            // Также в метод add можно передать экземпляр класса, реализующего определенный элемент управления.
            // Например, линейка масштаба ("scaleLine")
            myMap.controls
                .add(new ymaps.control.ScaleLine())
                
                // В конструкторе элемента управления можно задавать расширенные
                // параметры, например, тип карты в обзорной карте
                .add(new ymaps.control.MiniMap({
                    type: "yandex#publicMap"
                }));

            ';
if(isset($_GET['point']))
	{

    echo '
            // Создание метки 
            var myPlacemark = new ymaps.Placemark(
                    // Координаты метки
                    ['.$point[0].','.$point[1].'], {
                        /* Свойства метки:
                           - контент значка метки */
                        //iconContent: "'.$pName.'",
                        // - контент балуна метки
                        //balloonContent: "'.$pDesc.'"
                    }, {
                        /* Опции метки:
                           - флаг перетаскивания метки */
                        draggable: false,
                        /* - показывать значок метки 
                           при открытии балуна */
                        hideIconOnBallon: false
                    }
                );
            
            // Добавление метки на карту
            myMap.geoObjects.add(myPlacemark);

    ';
	}
if(!isset($_GET['message']))
	{
	echo '
    
            mySearchControl = new ymaps.control.SearchControl({
                options: {
                    noPlacemark: true
                }
            });
            mySearchResults = new ymaps.GeoObjectCollection(null, {
                hintContentLayout: ymaps.templateLayoutFactory.createClass("$[properties.name]")
            });
            myMap.controls.add(mySearchControl);
            myMap.geoObjects.add(mySearchResults);
            
            /* При щелчке на карте показывается балун со
               значениями координат в месте клика */
            myMap.events.add("click",
                function(e) {
                    myMap.balloon.open(
                        // Позиция балуна
                        e.get("coordPosition"), {
                            // Свойства балуна:
                            // контент балуна
                            contentBody: "'.$locale[680].'<br />'.$locale[681].': " +
                            e.get("coordPosition") + "," + myMap.getZoom()
                        }  
                    );
                        var geopoint = e.get("coordPosition") + "," + myMap.getZoom();
                        top.document.getElementById("'.$_GET['field'].'").value = geopoint;
                }
            );    


            // Выбранный результат помещаем в коллекцию.
            mySearchControl.events.add("resultselect", function (e) {
                  var index = e.get("resultIndex");
                  var result = mySearchControl.getResult(index);
                  result.then(function(res) {
                    GeoObject=mySearchControl.getResultsArray()[index];
                    var point = GeoObject.geometry.getCoordinates();
                    var geopoint = point[0] + "," + point[1] + "," + myMap.getZoom();
                    if(myPlacemark != false){
                        myMap.geoObjects.remove(myPlacemark);
                    }
                    top.document.getElementById("'.$_GET['field'].'").value = geopoint;
                    myMap.balloon.close();
                  });

            });
            
            myMap.events.add("balloonclose", function(e) {
                    top.document.getElementById("'.$_GET['field'].'").value = "";
            });
	';
	}
echo '
        });
        
    </script>



</head>
<body>
    <div id="YMapsID" style="width:100%;height:400px"></div>
</body>
</html>';


exit();
?>