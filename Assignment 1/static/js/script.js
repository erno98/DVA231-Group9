$(document).ready(function() {

    $('.img-description-box').mouseenter(function(){
        $(this).parent().parent().find('.img-description-hidden').slideDown(400);
    });

    $('.img-description-hidden').mouseleave(function(){
        $(this).slideUp(400);
    })

});