<?php

require_once 'helpers.php';

$list =
    [

        [
            'category' => 'Доски и лыжи',
            'name' => '2014 Rossignol District Snowboard',
            'price' => '10999',
            'img_url' => 'img/lot-1.jpg',
            'date' => '1991-01-09'
        ],

        [
            'category' => 'Крепления',
            'name' => 'DC Ply Mens 2016/2017 Snowboard',
            'price' => '159999',
            'img_url' => 'img/lot-2.jpg',
            'date' => '2021-05-09'
        ],

        [
            'category' => 'Ботинки',
            'name' => 'Крепления Union Contact Pro 2015 года размер L/XL',
            'price' => '8000',
            'img_url' => 'img/lot-3.jpg',
            'date' => '2021-06-09'
        ],

        [
            'category' => 'Одежда',
            'name' => 'Ботинки для сноуборда DC Mutiny Charocal',
            'price' => '10999',
            'img_url' => 'img/lot-4.jpg',
            'date' => '2021-07-09'
        ],

        [
            'category' => 'Инструменты',
            'name' => 'Куртка для сноуборда DC Mutiny Charocal',
            'price' => '7500',
            'img_url' => 'img/lot-5.jpg',
            'date' => '2021-08-09'
        ],

        [
            'category' => 'Разное',
            'name' => 'Маска Oakley Canopy',
            'price' => '5400',
            'img_url' => 'img/lot-6.jpg',
            'date' => '2021-03-16 23:00'
        ],
    ];

function get_full_price($full_price) {
    if ($full_price < 1000) {
        return $full_price;
    }
    return number_format($full_price, 0, '.', ' ');
}

//function get_dt_range($timestamp, &$h, &$m) {
function get_dt_range($timestamp) {
    $date1 = new DateTime();
    $date2 = new DateTime($timestamp);
    $date = $date1->diff($date2);
    /*********************/
//    if ($date1 <= $date2) {
//        return [0,0];
//    }
    /*********************/
    if ($date->invert === 1) {
        return [0,0];
//        $h = 0;
//        $m = 0;
    }
//    } else  {
            return [$date->days*24+$date->h, $date->i];
//        $h = $date->days*24+$date->h;
//        $m = $date->i;
//    }
}


$content = include_template('main.php', ['categories' => $list]);

print( include_template('layout.php', [
    'content' => $content,
    'user_name' => 'Samir',
    'title' => 'twix',
    'categories' => $list
]));

