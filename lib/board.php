
<?php
function show_board() {
	global $mysqli;
	
	$sql = 'select * from board';
	$st = $mysqli->prepare($sql);
	
	$st->execute();
	$res = $st->get_result();
	
/*	$b=current_color($input['token']);
	if($b) {
		show_board_by_player($b);
	} else {
		*/
		header('Content-type: application/json');
		print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
	
//}}

function reset_board() {
	global $mysqli;
	$sql = 'call clean_board()';
	$mysqli->query($sql);
	show_board();
	
}




}
?>