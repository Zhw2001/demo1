$(document).ready(function(){
$("#back").click(function(){
    $("#productFunction").find("ul").removeClass("box-item-content_x")
    $("#orderFunction").find("ul").removeClass("box-item-content_x")
    $("#memberFunction").find("ul").removeClass("box-item-content_x")
});
$("#productFunction").click(function(){$(this).find("ul").addClass("box-item-content_x")});
$("#orderFunction").click(function(){$(this).find("ul").addClass("box-item-content_x")});
$("#memberFunction").click(function(){$(this).find("ul").addClass("box-item-content_x")});
$("#left_body_button").click(function(){
    $("#left_body").css("width","60px")
    $(".container-body-right").css("margin-left","70px")
    $(".bootstrap-frm").css("margin-left","430px")
    $(this).attr("hidden","hidden")
    $("#left_body_button2").removeAttr("hidden")
});
$("#left_body_button2").click(function(){
    $("#left_body").css("width","180px")
    $(this).attr("hidden","hidden")
    $("#left_body_button").removeAttr("hidden")
    $(".container-body-right").css("margin-left","190px")
    $(".bootstrap-frm").css("margin-left","310px")
});



});