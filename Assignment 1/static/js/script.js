$(document).ready(function() {

    $('.img-description-box').hover(function(){
        $(this).parent().parent().find('.img-description-hidden').slideDown(400);
    });

    $('.img-description-hidden').mouseout(function(){
        $(this).slideUp(400);
    })

});