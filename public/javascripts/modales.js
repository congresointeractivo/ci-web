$(document).ready(function() {
	var h = $(window).height()*.8;
	var w = $(window).width ()*.8;
	
	//Formulario Twitter
	$("#form-twitter-legislador").colorbox({
		iframe : true,
		innerWidth : w,
		innerHeight : h
	});
	//Formulario Sumate
	$("#form-sumate").colorbox({
		iframe : true,
		innerWidth : w,
		innerHeight : h
	});
	//Formulario Sumate
	$(".sumate a").colorbox({
		iframe : true,
		innerWidth : w,
		innerHeight : h
	});
});
