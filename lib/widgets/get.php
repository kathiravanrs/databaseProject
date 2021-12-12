<?php
header("Access-Control-Allow-Origin: *");
$entityBody = file_get_contents('php://input');
require_once('db.php');
-- $query = 'INSERT INTO `posts` (`id`, `post_header`, `post_body`) VALUES (5, "test3",' .{$entityBody}.')';
$stm = $db->prepare($entityBody);
$stm->execute();
echo $entityBody;
// $row = $stm->fetchAll(PDO::FETCH_ASSOC);
// echo json_encode($row);
?>