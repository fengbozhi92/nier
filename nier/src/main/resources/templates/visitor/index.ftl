<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Pisual Mouse</title>
<#include "/visitor/common/header.ftl">
<link rel="stylesheet" type="text/css" href="/nier/css/jq22.css">
<!--[if lte IE 8]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
<style>
@font-face {
 font-family: 'xingshu';
 src: url('/nier/fonts/xingshu.ttf');
}
.lh34{
	line-height: 34px;
}
.a1{
	color: #69D2E7;
}
.a2{
	color: #FA6900;
}
.a3{
	color: #A7DBD8;
}
.a4{
	color: #FF4E50;
}

.a1:hover{
	background-color: #69D2E7;
	color: white;
}
.a2:hover{
	background-color: #FA6900;
	color: white;
}
.a3:hover{
	background-color: #A7DBD8;
	color: white;
}
.a4:hover{
	background-color: #FF4E50;
	color: white;
}
.item{
	display: inline-block; 
	width: 100%; 
	line-height: 34px;
	font-size:20px;
	-webkit-transition: all .8s;   
    -moz-transition: all .8s;   
    -ms-transition: all .8s;   
    -o-transition: all .8s;   
    transition: all .8s; 
    text-decoration: none !important;
    border-radius: 5px;
}
</style>
</head>
<body id="body">
	<div id="test" style=" position:fixed;top:0px;z-index:20;"></div>
	<div class="container">
		<div class="col-md-12 text-center">
			<h1 style="font-size: 100px;font-weight: bold;z-index:20;">
				<font color="#F9D423">N</font>
				<font color="#69D2E7">i</font>
				<font color="#FF4E50">e</font>
				<font color="#A7DBD8">r</font>
				</h1>
		</div>
		<div class="col-md-12" >
			<div class="col-md-3">
			</div>
			<div class="col-md-6 text-center menu" style="z-index: 9999">
				<div class=""><a href="javascript:void(0);" class="item a1">进入主页</a></div>
				<div><a href="javascript:void(0);" class="item a2">随便看看</a></div>
				<div><a href="javascript:void(0);" class="item a3">首页</a></div>
				<div><a href="javascript:void(0);" class="item a4">关于</a></div>
			</div>
			<div class="col-md-12 text-center" style="z-index: 9999">
			<span>
				<font color="#A7DBD8" size="30px">
					<a id = "control" href="javascript:void(0);" onclick="return start();" title="静音"><span class="glyphicon glyphicon-volume-off glyphicon-lg" style="color:#FA6900;"></span></a>
				</font>
			</span>
			</div>
		</div>
		<div class="col-md-12">
			<div class="jq22-content">
				<canvas id="clock1_" width="200px" height="200px">
				</canvas>
				<canvas id="clock2_" width="200px" height="200px">
				</canvas>
				<canvas id="clock3_" width="200px" height="200px">
				</canvas>
				<canvas id="clock4_" width="200px" height="200px">
				</canvas>
				<canvas id="clock5_" width="200px" height="200px">
				</canvas>
				<canvas id="clock6_" width="200px" height="200px">
				</canvas>
				<canvas id="clock7_" width="200px" height="200px">
				</canvas>
				<canvas id="clock8_" width="200px" height="200px">
				</canvas>
				<canvas id="clock9_" width="200px" height="200px">
				</canvas>
				<canvas id="clock10_" width="200px" height="200px">
				</canvas>
				<canvas id="clock11_" width="200px" height="200px">
				</canvas>
				<canvas id="clock12_" width="200px" height="200px">
				</canvas>
				<canvas id="clock13_" width="200px" height="200px">
				</canvas>
				<canvas id="clock14_" width="200px" height="200px">
				</canvas>
				<canvas id="clock15_" width="200px" height="200px">
				</canvas>
			</div>
		</div>
		<audio id="music" src="/nier/music/Lenka-WeArePowerful.mp3" loop="loop" preload="">
			您的浏览器不支持 audio 标签。
		</audio>
	</div>
<#include "/visitor/common/js.ftl">
<script src="/nier/js/canvas_clock.js"></script>
<script type="text/javascript" src="/nier/js/sketch.min.js"></script>
<script>
	function start(){
		if ($("#control span").hasClass("glyphicon-volume-down")){
			$("#music")[0].pause();
			$("#control span").removeClass("glyphicon-volume-down");
			$("#control span").addClass("glyphicon-volume-off");
			$("#control").attr("title","静音");
		}else {
			$("#music")[0].play();
			$("#control span").removeClass("glyphicon-volume-off");
			$("#control span").addClass("glyphicon-volume-down");
			$("#control").addClass("on");
			$("#control").attr("title","音效");
		}
	}
	
	function Particle(x, y, radius) {
		this.init(x, y, radius);
	}
	Particle.prototype = {
		init : function(x, y, radius) {
			this.alive = true;
			this.radius = radius || 10;
			this.wander = 0.15;
			this.theta = random(TWO_PI);
			this.drag = 0.92;
			this.color = '#fff';
			this.x = x || 0.0;
			this.y = y || 0.0;
			this.vx = 0.0;
			this.vy = 0.0;
		},
		move : function() {
			this.x += this.vx;
			this.y += this.vy;
			this.vx *= this.drag;
			this.vy *= this.drag;
			this.theta += random(-0.5, 0.5) * this.wander;
			this.vx += sin(this.theta) * 0.1;
			this.vy += cos(this.theta) * 0.1;
			this.radius *= 0.96;
			this.alive = this.radius > 0.5;
		},
		draw : function(ctx) {
			ctx.beginPath();
			ctx.arc(this.x, this.y, this.radius, 0, TWO_PI);
			ctx.fillStyle = this.color;
			ctx.fill();
		}
	};

	
	var MAX_PARTICLES = 100;
	var COLOURS = [ '#69D2E7', '#A7DBD8', '#E0E4CC', '#F38630', '#FA6900',
			'#FF4E50', '#F9D423' ];
	var particles = [];
	var pool = [];
	var demo = Sketch.create({
		container : document.getElementById('test')
	});
	demo.setup = function() {
		// Set off some initial particles.
		var i, x, y;
		//  for ( i = 0; i < 20; i++ ) {
		x = (demo.width * 0.5) + random(-100, 100);
		y = (demo.height * 0.5) + random(-100, 100);
		demo.spawn(0, 999);
		// }
	};
	demo.spawn = function(x, y) {
		if (particles.length >= MAX_PARTICLES)
			pool.push(particles.shift());
		particle = pool.length ? pool.pop() : new Particle();
		particle.init(x, y, random(5, 40));
		particle.wander = random(0.5, 2.0);
		particle.color = random(COLOURS);
		particle.drag = random(0.9, 0.99);
		theta = random(TWO_PI);
		force = random(2, 8);
		particle.vx = sin(theta) * force;
		particle.vy = cos(theta) * force;
		particles.push(particle);
	};
	demo.update = function() {
		var i, particle;
		for (i = particles.length - 1; i >= 0; i--) {
			particle = particles[i];
			if (particle.alive)
				particle.move();
			else
				pool.push(particles.splice(i, 1)[0]);
		}
	};
	demo.draw = function() {
		demo.globalCompositeOperation = 'lighter';
		for ( var i = particles.length - 1; i >= 0; i--) {
			particles[i].draw(demo);
		}
	};
	demo.mousemove = function() {
		var particle, theta, force, touch, max, i, j, n;
		for (i = 0, n = demo.touches.length; i < n; i++) {
			touch = demo.touches[i], max = random(1, 4);
			for (j = 0; j < max; j++) {
				demo.spawn(touch.x, touch.y);
			}
		}
	};
</script>
<script>
	  clockd1_={
			  "indicate": true,
			  "indicate_color": "#222",
			  "dial1_color": "#666600",
			  "dial2_color": "#81812e",
			  "dial3_color": "#9d9d5c",
			  "time_add": 1,
			  "time_24h": true,
			  "date_add":3,
			  "date_add_color": "#999",
			 };
	  clockd2_={
			  "indicate": true,
			  "dial1_color": "#666600",
			  "time_24h": true,
			  "timeoffset":0,
			  "date_add":3,
			  "date_add_color": "#999",
			 };
	  clockd3_={
			  "indicate": true,
			  "indicate_color": "#222",
			  "dial1_color": "#666600",
			  "dial2_color": "#81812e",
			  "dial3_color": "#9d9d5c",
			  "time_add": 1,
			  "time_24h": true,
			  "date_add":3,
			  "date_add_color": "#999",
			 };
	  clockd4_={
			  "indicate": true,
			  "indicate_color": "#222",
			  "dial1_color": "#666600",
			  "date_add":3,
			  "date_add_color": "#999",
			 };
	  clockd5_={
			  "indicate": true,
			  "indicate_color": "#222",
			  "dial1_color": "#666600",
			  "dial2_color": "#81812e",
			  "dial3_color": "#9d9d5c",
			  "time_add": 1,
			  "time_24h": true,
			  "date_add":3,
			  "date_add_color": "#999",
			 };
	  clockd6_={
			  "indicate": true,
			  "indicate_color": "#222",
			  "dial1_color": "#666600",
			  "dial2_color": "#81812e",
			  "dial3_color": "#9d9d5c",
			  "time_add": 1,
			  "time_add_color": "#ccc",
			  "time_24h": true,
			  "timeoffset":0,
			  "date_add":3,
			  "date_add_color": "#999",
			 };
	  clockd7_={
			  "indicate": true,
			  "indicate_color": "#222",
			  "dial1_color": "#666600",
			  "dial2_color": "#81812e",
			  "dial3_color": "#9d9d5c",
			  "time_add": 1,
			  "time_24h": true,
			  "date_add":3,
			  "date_add_color": "#999",
			 };
	  clockd8_={
			  "indicate": true,
			  "indicate_color": "#222",
			  "dial1_color": "#666600",
			  "dial2_color": "#81812e",
			  "dial3_color": "#9d9d5c",
			  "time_add": 1,
			  "time_24h": true,
			  "date_add":5,
			  "date_add_color": "#999",
			 };
	  clockd9_={
			  "indicate": true,
			  "indicate_color": "#222",
			  "dial1_color": "#666600",
			  "dial2_color": "#81812e",
			  "dial3_color": "#9d9d5c",
			  "time_add": 1,
			  "time_24h": true,
			  "date_add":3,
			  "date_add_color": "#999",
			 };
	  clockd10_={
			  "indicate": true,
			  "indicate_color": "#222",
			  "dial1_color": "#666600",
			  "dial2_color": "#81812e",
			  "dial3_color": "#9d9d5c",
			  "time_add": 1,
			  "time_24h": true,
			  "track": "#4b4b00",
			 };
	  clockd11_={
			  "dial1_color": "#666600",
			  "time_24h": true,
			  "date_add":3,
			  "date_add_color": "#999",
			 };
	  clockd12_={
			  "indicate": true,
			  "indicate_color": "#222",
			  "dial1_color": "#666600",
			  "dial2_color": "#81812e",
			  "dial3_color": "#9d9d5c",
			  "time_add": 1,
			  "time_24h": true,
			  "date_add":3,
			  "date_add_color": "#999",
			 };
	  clockd13_={
			  "indicate": true,
			  "indicate_color": "#222",
			  "dial1_color": "#666600",
			  "dial2_color": "#81812e",
			  "dial3_color": "#9d9d5c",
			  "time_add": 1,
			  "time_24h": true,
			  "date_add":3,
			  "date_add_color": "#999",
			 };
	  clockd14_={
			  "indicate": true,
			  "indicate_color": "#222",
			  "dial1_color": "#666600",
			  "time_add": 1,
			  "time_24h": true,
			  "date_add":3,
			  "date_add_color": "#999",
			 };
	  clockd15_={
			  "indicate": true,
			  "indicate_color": "#222",
			  "dial1_color": "#666600",
			  "dial2_color": "#81812e",
			  "dial3_color": "#9d9d5c",
			  "time_add": 1,
			  "time_24h": true,
			  "date_add":3,
			  "date_add_color": "#999",
			 };
	 
	  var c = document.getElementById('clock1_');
	  cns1_ = c.getContext('2d');
	  var c = document.getElementById('clock2_');
	  cns2_ = c.getContext('2d');
	  var c = document.getElementById('clock3_');
	  cns3_ = c.getContext('2d');
	  var c = document.getElementById('clock4_');
	  cns4_ = c.getContext('2d');
	  var c = document.getElementById('clock5_');
	  cns5_ = c.getContext('2d');
	  var c = document.getElementById('clock6_');
	  cns6_ = c.getContext('2d');
	  var c = document.getElementById('clock7_');
	  cns7_ = c.getContext('2d');
	  var c = document.getElementById('clock8_');
	  cns8_ = c.getContext('2d');
	  var c = document.getElementById('clock9_');
	  cns9_ = c.getContext('2d');
	  var c = document.getElementById('clock10_');
	  cns10_ = c.getContext('2d');
	  var c = document.getElementById('clock11_');
	  cns11_ = c.getContext('2d');
	  var c = document.getElementById('clock12_');
	  cns12_ = c.getContext('2d');
	  var c = document.getElementById('clock13_');
	  cns13_ = c.getContext('2d');
	  var c = document.getElementById('clock14_');
	  cns14_ = c.getContext('2d');
	  var c = document.getElementById('clock15_');
	  cns15_ = c.getContext('2d');
		
	  clock_conti(200,cns1_,clockd1_);
	  clock_digital(200,cns2_,clockd2_);
	  clock_norm(200,cns3_,clockd3_);
	  clock_binary(200,cns4_,clockd4_);
	  clock_follow(200,cns5_,clockd5_);
	  clock_circles(200,cns6_,clockd6_);
	  clock_dots(200,cns7_,clockd7_);
	  clock_roulette(200,cns8_,clockd8_);
	  clock_num(200,cns9_,clockd9_);
	  clock_planets(200,cns10_,clockd10_);
	  clock_digitalran(200,cns11_,clockd11_);
	  clock_bars(200,cns12_,clockd12_);
	  clock_grow(200,cns13_,clockd13_);
	  clock_random(200,cns14_,clockd14_);
	  clock_reverse(200,cns15_,clockd15_);
</script>
</body>

</html>