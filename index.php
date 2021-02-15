<?php

require_once 'helpers.php';

$list =
    [

        [
            'category' => 'Доски и лыжи',
            'name' => '2014 Rossignol District Snowboard',
            'price' => '10999',
            'img_url' => 'img/lot-1.jpg'
        ],

        [
            'category' => 'Крепления',
            'name' => 'DC Ply Mens 2016/2017 Snowboard',
            'price' => '159999',
            'img_url' => 'img/lot-2.jpg'
        ],

        [
            'category' => 'Ботинки',
            'name' => 'Крепления Union Contact Pro 2015 года размер L/XL',
            'price' => '8000',
            'img_url' => 'img/lot-3.jpg'
        ],

        [
            'category' => 'Одежда',
            'name' => 'Ботинки для сноуборда DC Mutiny Charocal',
            'price' => '10999',
            'img_url' => 'img/lot-4.jpg'
        ],

        [
            'category' => 'Инструменты',
            'name' => 'Куртка для сноуборда DC Mutiny Charocal',
            'price' => '7500',
            'img_url' => 'img/lot-5.jpg'
        ],

        [
            'category' => 'Разное',
            'name' => 'Маска Oakley Canopy',
            'price' => '5400',
            'img_url' => 'img/lot-6.jpg'
        ],
    ];

function get_full_price($full_price) {
    if ($full_price < 1000) {
        return $full_price;
    }
    return number_format($full_price, 0, '.', ' ');
}

$content = include_template('main.php', ['categories' => $list]);

print( include_template('layout.php', [
    'content' => $content,
    'user_name' => 'Samir',
    'title' => 'twix',
    'categories' => $list
]));

