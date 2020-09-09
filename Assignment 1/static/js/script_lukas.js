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
    
    var current = 0;
    var active = $('img-active')
    
    $('img-changer').each(index, element) {
        setInterval(function(){
            element.show()
            if(current === index) {
                
            }
        })

    }

    setInterval(function(){
                
      $('#img-changer').slideDown(400); //attr('src', images[current])
      current = (current < images.length - 1)? current + 1: 0;
    
    },3000); /*1000 = 1 sec*/

});




