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

    var current = 0

  /*  setInterval(function(){
        $('#slide-img').attr('src', images[current])
        if(current += 1 > images.length-1) {current = 0}
        else {current += 1}
    }, 4000) */

    var slideIndex = 1;
    showDivs(slideIndex);
    
    function plusDivs(n) {
      showDivs(slideIndex += n);
    }
    
    function showDivs(n) {
      var i;
      var x = document.getElementsByClassName("img-slide");
      if (n > x.length) {slideIndex = 1}
      if (n < 1) {slideIndex = x.length} ;
      for (i = 0; i < x.length; i++) {  
        x[i].style.display = "none";
      }
      x[slideIndex-1].style.display = "block";
    }

    setInterval(function(){
        if(current += 1 > images.length-1) {current = 0}
        else {current += 1}
        plusDivs(current)
    }, 4000)

});




