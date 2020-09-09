$(document).ready(function() {

    $('.img-description-box').hover(function(){
        $(this).parent().parent().find('.img-description-hidden').slideDown(400);
    });

    $('.img-description-hidden').mouseout(function(){
        $(this).slideUp(400);
    })

    var images = [
      "static/img/Coffee_content_2.jpg",
      "static/img/Coffee_content_3.jpg",
      "static/img/coffee2.jpg"
    ];
    
    $('img-changer').each(function(index, element) {
        setInterval(function(){
            if(element.hasClass('img-active')) {
                element.show()
            }
            else {
                $('active-img').removeClass('img-active').hide()
                element.addClass('img-active')
                element.show()
            }
        }, 2000)
    
    })
});




