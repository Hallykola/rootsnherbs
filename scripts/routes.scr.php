<?php

Routes::set('', function(){
    ControllerRoutes::RenderPage('login');
});
Routes::set('/', function(){
    ControllerRoutes::RenderPage('login');
});


Routes::set('index', function(){
    ControllerRoutes::RenderPage('index');
});
Routes::set('login', function(){
    ControllerRoutes::RenderPage('login');
});
Routes::set('profile', function(){
    ControllerRoutes::RenderPage('profile');
});
Routes::set('registeradmin', function(){
    ControllerRoutes::RenderPage('registeradmin');
});
Routes::set('register', function(){
    ControllerRoutes::RenderPage('register');
});
Routes::set('rank', function(){
    ControllerRoutes::RenderPage('rank');
});
Routes::set('dashboard', function(){
    ControllerRoutes::RenderPage('dashboard');
});

Routes::set('forgot-password', function(){
    ControllerRoutes::RenderPage('forgot-password');
});



Routes::set('bonuses', function(){
    ControllerRoutes::RenderPage('bonuses');
});
Routes::set('issuebv', function(){
    ControllerRoutes::RenderPage('issuebv');
});
Routes::set('users', function(){
    ControllerRoutes::RenderPage('users');
});
Routes::set('./scripts/logout.scr', function(){
    ControllerRoutes::RenderPage('logout.scr');
});
Routes::set('suggestusers', function(){
    ControllerRoutes::RenderPage('suggestusers');
});
Routes::set('getname', function(){
    ControllerRoutes::RenderPage('getname');
});
Routes::set('nopermission', function(){
    ControllerRoutes::RenderPage('nopermission');
});
Routes::set('404', function(){
    ControllerRoutes::RenderPage('404');
});

