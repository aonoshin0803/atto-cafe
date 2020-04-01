// // [トップ画fadein]
$(window).on('turbolinks:load', function(){
    $('.home-index-title h1').fadeIn(2500);
});

$(window).on('turbolinks:load', function(){
    $('.home-index-title h2').fadeIn(2500);
});

// // [下からfadein]
$(document).on('turbolinks:load', window).scroll(function(){
    $('.content-1-sub h1, .content-1-sub li, .home-index-content-2 h2, .content-2-1-text span, .content-2-1-text p, .content-2-2-text span, .content-2-2-text p, .content-2-3-text span, .content-2-3-text p, .content-2-4-text span, .content-2-4-text p, .content-2-5-text span, .content-2-5-text p, .btn-area-login, .btn-area-sign-up, .btn-area-contact').each(function(){
        let dummy = $(this).offset().top,
        scroll = $(window).scrollTop(),
        windowHeight = $(window).height();
        if (scroll > dummy - windowHeight + 50){
            $(this).addClass('scroll');
        }
    });
});

// // [cursolの動き]
$(function(){
    setTimeout('anime()');
});
function anime(){
    $('.content-2-1 > i').animate({'right' : '430px'}, 3000).animate({'right' : '30px'}, 3000);
    setTimeout('anime()');
}

