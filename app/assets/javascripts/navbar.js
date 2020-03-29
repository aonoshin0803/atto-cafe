$(window).on('turbolinks:load', function(){
    $('.toggle-btn').click(function(){
        $('.navbar-list li').slideToggle(200);
    });
});