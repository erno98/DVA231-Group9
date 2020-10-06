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

    $('#close-search-results').on('click', function(){
        $('#search-results-wrapper').hide(animation_length);
    });

    $('#input-search').on('search', function(){
        $('#search-results-wrapper').show(animation_length);
        var query = $(this).val();
        $.ajax({
            type: "POST",
            data: '{query :"' + query + '"}',
            url: "Coffee.aspx/GetData",  
            contentType: "application/json; charset=utf-8",  
            dataType: "json",  
            success: function (response) {  
                // display results
                populate_search_results(response);
                highlight_query(query);

                // make the results responsive
                activate_queries();
            },  
            failure: function (response) {  
            }  
        });          
    })

});

function populate_search_results(response){
    $('#search-results').empty();
    $.each(response.d, function (key, val){
        $('#search-results').append(
            "<li id='db-" + key + "' class='db-id'>" + val + "</li>\n"
        );             
    });
}


function highlight_query(query){
    // highlight the query 
    $('#search-results > li').each(function(){
        var words = $(this).text().split(' ');
        words[words.indexOf(query)] = "<a class='highlight-search'>" + query + "</a>"
        $(this).html(words.join(' '));
    });
}


function activate_queries(){
    $('.db-id').on('click', function () {
        $.ajax({  
            type: "POST",  
            data: '{id :"' + $(this).attr('id').replace('db-', '') + '"}', 
            url: "Coffee.aspx/change_content",  
            contentType: "application/json; charset=utf-8",  
            dataType: "json"
        });     
    });
}