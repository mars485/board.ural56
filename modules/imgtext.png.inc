<?php
$img = imagecreatetruecolor(200, 18);
imagesavealpha($img, true);
$trans_colour = imagecolorallocatealpha($img, 0, 0, 0, 127);
imagefill($img, 0, 0, $trans_colour);
$red = imagecolorallocate($img, 255, 0, 0);
$black = imagecolorallocate ($img, 0, 0, 0);
imagettftext ($img, 12, 0, 0, 12, $black, FULLPATH."/images/arial.ttf", $locale[844]);

imageline($img, 0, 14, 105, 14, $black);

header("Content-type: image/png");
imagepng($img);
exit();
?>