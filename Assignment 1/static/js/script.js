$(document).ready(function() {

    var animation_length = 400;  // in ms

    // on hover show descriptipn
    $('.img-description-box').mouseenter(function(){
        $(this).parent().parent().find('.img-description-hidden').slideDown(animation_length);
    });

    // on mouse outside of the information block, hide it
    $('.img-description-hidden').mouseleave(function(){
        $(this).slideUp(animation_length);
    })

});