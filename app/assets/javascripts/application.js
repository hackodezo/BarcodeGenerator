// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require_tree .

$(document).ready(function(){
    $(".types").hide();
    $(".url_type").show();
    $(".btn-success").click(function(){
        $("#image").empty()
        $(".types").hide();
        $("#type_name").val(event.target.id);
        var identity = event.target.id + "_type";
        $("."+identity).show()
    });

    $("#submit_form").click(function(){
        var type = $("#type_name").val();
        $.post("/qr_codes/create", $("."+type+"_type :input").serialize()+"&type="+type);
        return false
    })
});

