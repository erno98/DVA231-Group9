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

    $('#input-search').on('search', function(){
        $('#search-results-wrapper').show(400);
        var query = $(this).val();
        $.ajax({  
            type: "POST",  
            data: '{query: "' + query +'"}',
            url: "Coffee.aspx/GetData",  
            contentType: "application/json; charset=utf-8",  
            dataType: "json",  
            success: function (response) {  
                // display results
                populate_search_results(response)
                highlight_query(query);

            },  
            failure: function (response) {  
                 // TODO
            }  
        });  
        // display results
        
    })

});

function populate_search_results(response){
    $('#search-results').empty();
    response.d.forEach(function(val){
        $('#search-results').append(
            "<li>" + val + "</li>\n"
        );             
    });
}

function highlight_query(query){
    // highlight the query 
    $('#search-results > li').each(function(){
        var words = $(this).text().split(' ');
        // TODO: add link
        words[words.indexOf(query)] = "<a class='highlight-search'>" + query + "</a>"
        $(this).html(words.join(' '));
    });
}