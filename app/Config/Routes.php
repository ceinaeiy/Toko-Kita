<?php

use CodeIgniter\Router\RouteCollection;

/** @var RouteCollection $routes */
$routes->get('/', 'Home::index');
$routes->get('/produk', 'Produk::index');
$routes->get('/produk/detail/(:num)', 'Produk::detail/$1');
$routes->get('/admin', 'Admin::index');
$routes->get('/admin/tambah', 'Admin::tambah');
$routes->post('/admin/simpan', 'Admin::simpan');
$routes->get('/admin/edit/(:num)', 'Admin::edit/$1');
$routes->post('/admin/update/(:num)', 'Admin::update/$1');
$routes->get('/admin/hapus/(:num)', 'Admin::hapus/$1');