<?php

require_once 'app/controllers/jugador.controller.php';
require_once 'app/controllers/usuario.controller.php';
require_once 'app/controllers/equipo.controller.php';

define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

$action = 'home';
if (!empty($_GET['action'])) {
    $action = $_GET['action'];
}

$params = explode('/', $action);

switch ($params[0]) {
    case 'home':
        $controller = new UsuarioController();
        $controller->showHome();
        break;
    case 'loginUser':
        $controller = new UsuarioController();
        $controller->loginUser();
        break;
    case 'logoutUser':
        $controller = new UsuarioController();
        $controller->logoutUser();
    case 'registerUser':
        $controller = new UsuarioController();
        $controller->registerUser();
        break;
    case 'addUser':
        $controller = new UsuarioController();
        $controller->addUser();
    case 'authUser':
        $controller = new UsuarioController();
        $controller->authUser();
        break;
    case 'showPlayers':
        $controller = new JugadorController();
        $controller->showPlayers();
        break;
    case 'showPlayer':
        $controller = new JugadorController();
        if (isset($params[1])) {
            $controller->showPlayer($params[1]);
        } else {
            $controller->showPlayers();
        }
        break;
    case 'showModPlayer':
        $controller = new JugadorController();
        if (isset($params[1]) && isset($params[2])) {
            $controller->showModPlayer($params[1], $params[2]);
        } else {
            $controller->showPlayers();
        }
        break;
    case 'updatePlayer':
        $controller = new JugadorController();
        if (isset($params[1]) && isset($params[2])) {
            $controller->updatePlayer($params[1], $params[2]);
        } else {
            $controller->showPlayers();
        }
        break;
    case 'deletePlayer':
        $controller = new JugadorController();
        if (isset($params[1]) && isset($params[2])) {
            $controller->deletePlayer($params[1], $params[2]);
        } else {
            $controller->showPlayers();
        }
        break;
    case 'addPlayer':
        $controller = new JugadorController();
        $controller->insertPlayer();
        break;
    case 'equipos':
        $controller = new EquiposController();
        $controller->showEquipos();
        break;
    case 'editar':
        $controller = new EquiposController();
        if (isset($params[1])) {
            $controller->editarEquipo($params[1]);
        } else {
            $controller->showEquipos();
        }
        break;
    default:
        echo "404 not found";
        break;
}