<form action="index.php" method="POST" class="text-center p-3">
    <input type="hidden" name="action" value="btneditItem">
    <input type="hidden" name="idProduct" value="{$idProduct}"/>

    <label>Nombre:</label>
    <input type="text" name="nombre_producto" value="{$nombre}" class="form-control"/><br/>

    <label>Talle:</label>
    <input type="text" name="talle" value="{$talle}" class="form-control"/><br/>

    <label>Color:</label>
    <input type="text" name="color" value="{$color}" class="form-control"/><br/>

    <label>Precio:</label>
    <input type="text" name="precio" value="{$precio}" class="form-control"/><br/>

    <label>Categoría:</label>
    <select name="categorias" class="form-control">
        {foreach from=$categorias item=cat}
            <option value="{$cat->id_categorias}" {if $cat->id_categorias == $categoria}selected{/if}>
                {$cat->nombre_categoria}
            </option>
        {/foreach}
    </select><br/>

    <button type="submit" name="action" value="btneditItem" class="btn btn-warning">Guardar cambios</button>

</form>
