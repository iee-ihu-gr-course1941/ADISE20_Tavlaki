var me={token:null,piece_color:null};
var game_status={};
var board={};
var last_update=new Date().getTime();
var timer=null;



$(function () {
	draw_empty_board();
	fill_board();
	
	$('#chess_login').click( login_to_game);
	$('#chess_reset').click( reset_board);
	//$('$roll_dices').clock( roll_dices);
	$('#do_move').click( do_move);
	$('#move_div').hide();
	game_status_update();
	//$('#the_move_src').change( update_moves_selector);
	//$('#do_move2').click( do_move2);
});


/*$(function() {
    console.log( "ready!" );
  function init(){
    //initial board state
  	  
  };
  
  function drawBoard(){
    console.log ("Drawing the Board");
    
   drawPiece();
    
  };
  
  function drawPiece(){
    console.log( "Drawing a piece!" );
    //add piece to the DOM
    //manipulate position & color
    
  };
  
  //drawBoard();
  
}); */

function draw_empty_board(p) {
	
	if(p!='G') {p='R';}
	var draw_init = {
		'R': {i1:13,i2:19,istep:-1,i3:19,i4:25,istep:1},
		'G': {i1:7,i2:1,istep:-1, i1:19,i4:25,istep:-1}
	};
	var s=draw_init[p];
	
	

	
	var typeClass;
	var top_row ='<div class="top-row">';
	for (var i=s.i1; i!=s.i2; i+= s.istep) {
      	typeClass = i % 2 === 0 ? 'even' : 'odd';
      	top_row += '<div class="arrow-down '+typeClass+'"></div>';
  	}
  	top_row +='</div>';

  	// Field 1 - Bottom Left
  	var bottom_row ='<div class="bottom-row">';
	for (var i=s.i3; i!=s.i4; i+= s.istep) {
      	typeClass = i % 2 === 0 ? 'odd' : 'even';
      	bottom_row += '<div class="arrow-up '+typeClass+'"></div>';
  	}
  	bottom_row +='</div>';
  	

  	// Field 2 - Top Right
  	var top_row ='<div class="top-row">';
	for (var i=s.i1; i!=s.i2; i+= s.istep) {
      	typeClass = i % 2 === 0 ? 'even' : 'odd';
      	top_row += '<div class="arrow-down '+typeClass+'"></div>';
  	}
  	top_row +='</div>';

  	// Field 3 - Bottom Right
  	var bottom_row ='<div class="bottom-row">';
	for (var i=s.i3; i!=s.i4; i+= s.istep) {
      	typeClass = i % 2 === 0 ? 'odd' : 'even';
      	bottom_row += '<div class="arrow-up '+typeClass+'"></div>';
  	}
  	bottom_row +='</div>';
	
	
 //	if (counter == 0){
  //		$('.left-bin').append(top_row, bottom_row);
  //		$('.right-bin').append(top_row, bottom_row);
  //	}

//  	counter=1;

//	$('.chess_square').click(click_on_piece);
}










function fill_board() {
	$.ajax({url: "chess.php/board/", 
		headers: {"X-Token": me.token},
		success: fill_board_by_data });
}


function fill_board_by_data(data) {

	for(var i=0;i<data.length;i++) {
		
		var o = data[i];		
		var id = '#square_'+ o.x +'_' + o.y;
		var c = (o.piece!=null)?o.piece_color + o.piece:'';
		var pc = (o.piece!=null)?o.piece_color:'';
		var im = (o.piece!=null)?'<img class="piece_1" src="images/'+pc+'.png">':'';
		$(id).addClass(o.b_color+'_square').html(im);
		
		/*
		var o = data[i];
		var id = '#square_'+ o.x +'_' + o.y;
		var c = (o.piece!=null)?o.piece_color + o.piece:'';
		var pc= (o.piece!=null)?'piece'+o.piece_color:'';
		var im = (o.piece!=null)?'<img class="piece '+pc+'" src="images/'+c+'.png">':'';
		$(id).addClass(o.b_color+'_square').html(im);
		*/
	}
 
}

function login_to_game() {
	if($('#username').val()=='') {
		alert('You have to set a username');
		return;
	}
	var p_color = $('#pcolor').val();
	draw_empty_board(p_color);
	fill_board();
	
	$.ajax({url: "chess.php/players/"+p_color, 
			method: 'PUT',
			dataType: "json",
			headers: {"X-Token": me.token},
			contentType: 'application/json',
			data: JSON.stringify( {username: $('#username').val(), piece_color: p_color}),
			success: login_result,
			error: login_error});
}


function login_result(data) {
	me = data[0];
	$('#game_initializer').hide();
	update_info();
	game_status_update();
}

function login_error(data,y,z,c) {
	var x = data.responseJSON;
	alert(x.errormesg);
}

function game_status_update() {
	$.ajax({url: "chess.php/status/", success: update_status});
}

function update_status(data) {
	last_update=new Date().getTime();
	var game_stat_old = game_status;
	game_status=data[0];
	update_info();
	clearTimeout(timer);
	if(game_status.p_turn==me.piece_color &&  me.piece_color!=null) {
		x=0;
		// do play
		if(game_stat_old.p_turn!=game_status.p_turn) {
			fill_board();
		}
		$('#move_div').show(1000);
		timer=setTimeout(function() { game_status_update();}, 15000);
	} else {
		// must wait for something
		$('#move_div').hide(1000);
		timer=setTimeout(function() { game_status_update();}, 4000);
	}
 	
}

function update_info(){
	$('#game_info').html("I am Player: "+ me.piece_color +", my name is "+me.username +'<br>Token='+me.token+'<br>Game state: '+game_status.status+', '+ game_status.p_turn+' must play now.');
	
	
}


function roll_dices(){
	var dice1 = Math.floor(Math.random() * 6) + 1;
	var dice2 = Math.floor(Math.random() * 6) + 1;
	$("#dices_results").text("Φέρατε με τα ζάρια σας : "+dice1+' '+dice2);
	$.ajax({url: "chess.php/board/dice/"+dice1+'/'+dice2,
			method: 'PUT',
			dataType: "json",
			contentType: 'application/json',
			data: JSON.stringify( {dice1: dice1, dice2: dice2}),
			headers: {"X-Token": me.token},
			success: drawDice
			
});
}

function drawDice(){
		$.ajax({url: "chess.php/status/", 
			method: 'GET',
			dataType: "json",
			contentType: 'application/json',
			headers: {"X-Token": me.token},
			success: function(data){drawDice_by_data(data);}
		});
}

function drawDice_by_data(data){
	if(data[0].p_turn != null || data[0].dice1 != null || data[0].dice2 != null){
		$('.dice1').html(d1); $('.dice2').html(d2);		
	}	
}
function do_move() {
	var s = $('#the_move').val();
	
	var a = s.trim().split(/[ ]+/);
	if(a.length!=4) {
		alert('Must give 4 numbers');
		return;
	}
	$.ajax({url: "chess.php/board/piece/"+a[0]+'/'+a[1], 
			method: 'PUT',
			dataType: "json",
			contentType: 'application/json',
			data: JSON.stringify( {x: a[2], y: a[3]}),
			headers: {"X-Token": me.token},
			success: move_result,
			error: login_error});
	
}

function move_result(data){
	game_status_update();
	fill_board_by_data(data);
}

function reset_board() {
	$.ajax({url: "chess.php/board/", headers: {"X-Token": me.token}, method: 'POST',  success: fill_board_by_data, drawDice_by_data });
	$('#move_div').hide();
	$('#game_initializer').show(2000);
}
