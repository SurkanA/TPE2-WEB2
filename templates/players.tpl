{include 'head.tpl'}
{include 'header.tpl'}
<div class="players">
    {foreach from=$jugadores item=jugador}
        <div class="card" style="width: 16rem;">
            <a href="player/{$jugador->nombre_equipo|replace:' ':''|lower}/{$jugador->id_jugador}"><img
                    src="{$jugador->imagen_url}" class="card-img-top"></a>
            <div class="card-body">
                <a href="player/{$jugador->nombre_equipo|replace:' ':''|lower}/{$jugador->id_jugador}">
                    <h5 class="card-title">{$jugador->nombre_jugador}</h5>
                </a>
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">Equipo: {$jugador->nombre_equipo}</li>
                <li class="list-group-item">Numero: {$jugador->id_jugador}</li>
                <li class="list-group-item">Edad: {$jugador->edad}</li>
                <li class="list-group-item">Posicion: {$jugador->posicion}</li>
            </ul>
            {if isset($admin) && $admin == "S"}
                <div class="card-body">
                    <a href="deletePlayer/{$jugador->nombre_equipo|replace:' ':''|lower}/{$jugador->id_jugador}"><button
                            type="button" class="btn btn-danger"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                <path
                                    d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5" />
                            </svg></button></a>
                    <a href="modifyPlayer/{$jugador->nombre_equipo|replace:' ':''|lower}/{$jugador->id_jugador}"><button
                            type="button" class="btn btn-warning"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                                <path
                                    d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z" />
                            </svg></button></a>
                </div>
            {/if}
        </div>
    {/foreach}
</div>
{if isset($admin) && $admin == "S"}
    <div class="container-form">
        <div class="col-md-5 col-lg-8">
            <h4 class="mb-3">Añadir jugador</h4>
            <form class="needs-validation" method="post" action="addPlayer" novalidate>
                <div class="row g-3">
                    <div class="col-sm-6">
                        <label for="nombre_jugador" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="nombre_jugador" name="nombre_jugador" placeholder=""
                            value="" required>
                        <div class="invalid-feedback">
                            Por favor introduzca un nombre.
                        </div>
                    </div>
                </div>
                <br>
                <div class="row g-3">
                    <div class="col-sm-6">
                        <label for="equipo" class="form-label">Equipo</label>
                        <select class="form-select" id="nombre_equipo" name="nombre_equipo" required>
                            {if $equipos != null}
                                <option value="">Elige un equipo...</option>
                            {else}
                                <option value="">No existe ningun equipo en la base de datos</option>
                            {/if}
                            {foreach from=$equipos item=equipo}
                                <option value="{$equipo->nombre_equipo}">{$equipo->nombre_equipo}</option>
                            {/foreach}
                        </select>
                        <div class="invalid-feedback">
                            Seleccione un equipo valido.
                        </div>
                    </div>
                </div>
                <br>
                <div class="row g-3">
                    <div class="col-sm-6">
                        <label for="id_jugador" class="form-label">Numero</label>
                        <input type="number" min="0" max="100" class="form-control" id="id_jugador" name="id_jugador"
                            placeholder="" value="" required>
                        <div class="invalid-feedback">
                            Seleccione un numero valido.
                        </div>
                    </div>
                </div>
                <br>
                <div class="row g-3">
                    <div class="col-sm-6">
                        <label for="edad" class="form-label">Edad</label>
                        <input type="number" class="form-control" min="0" max="100" id="edad" name="edad" placeholder=""
                            value="" required>
                        <div class="invalid-feedback">
                            Seleccione una edad valida.
                        </div>
                    </div>
                </div>
                <br>
                <div class="row g-3">
                    <div class="col-sm-6">
                        <label for="posicion" class="form-label">Posicion</label>
                        <select class="form-select" id="posicion" name="posicion" required>
                            <option value="">Elige una posición...</option>
                            <option>Delantero</option>
                            <option>Centrocampista</option>
                            <option>Defensa</option>
                            <option>Portero</option>
                        </select>
                        <div class="invalid-feedback">
                            Seleccione una posición valida.
                        </div>
                    </div>
                </div>
                <br>
                <div class="row g-3">
                    <div class="col-sm-6">
                        <label for="biografia" class="form-label">Biografia <span
                                class="text-muted">(Opcional)</span></label>
                        <input type="text" class="form-control" id="biografia" name="biografia" placeholder="" value="">
                    </div>
                </div>
                <br>
                <div class="row g-3">
                    <div class="col-sm-6">
                        <label for="imagen_url" class="form-label">Imagen URL <span
                                class="text-muted">(Opcional)</span></label>
                        <input type="text" class="form-control" id="imagen_url" name="imagen_url" placeholder="" value="">
                    </div>
                </div>
                <br>
                <button class="w-50 btn btn-primary btn-lg" type="submit">Añadir jugador</button>
            </form>
        </div>
    </div>
{/if}
</main>
{include 'footer.tpl'}