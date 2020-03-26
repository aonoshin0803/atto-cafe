// [フェードイン]
$(document).on('turbolinks:load', window).scroll(function(){
    $('').each(function(){
        let dummy = $(this).offset().top,
        scroll = $(window).scrollTop(),
        windowHeight = $(window).height();
        if (scroll > dummy - windowHeight + 50){
            $(this).addClass('scroll');
        }
    });
});

