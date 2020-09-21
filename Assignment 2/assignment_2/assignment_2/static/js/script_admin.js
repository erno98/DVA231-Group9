$(document).ready(function() {
    $('#upload_btn').hide();

    if($('#ValidFile').text()){
        $('#ValidFile').show();
    } else{
        $('#ValidFile').hide();
    }

    if($('#Login_false').length){
        setTimeout(function(){
            $('#Login_false').animate({left:'-2000'},1000)
        }, 4000);

    };

    if($('#Login_success').length){
        setTimeout(function(){
            $('#Login_success').animate({left:'-2000'},1000)
        }, 4000);
    };

    $('#FileUploadControl').change(function(){
        if (!$('#FileUploadControl').val()){
            $('#upload_btn').hide();
        } else{
            $('#ValidFile').hide();
            $('#upload_btn').show();
        }
    })




});