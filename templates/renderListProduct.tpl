<table class="table table-dark table-striped">
<thead>
<tr>
    <th>Nombre</th>
    <th>Talle</th>
    <th>Categoría</th>
    <th>Acciones</th>
</tr>
</thead>
<tbody>
{foreach from=$products item=product}
<tr>
    <td>{$product->nombre_producto}</td>
    <td>{$product->talle}</td>
    <td>{$product->nombre_categoria}</td>
    <td>
        <form action="index.php" method="GET" style="display:inline-block;">
            <input type="hidden" name="action" value="seeMore">
            <input type="hidden" name="id" value="{$product->id_productos}">
            <button type="submit" class="btn btn-info">See More</button>
        </form>

      {if $log}
        <form action="index.php" method="GET" style="display:inline-block;">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="idProduct" value="{$product->id_productos}">
            <button type="submit" class="btn btn-warning">Edit</button>
        </form>

        <form action="index.php" method="GET" style="display:inline-block;">
            <input type="hidden" name="action" value="erase">
            <input type="hidden" name="idProduct" value="{$product->id_productos}">
            <button type="submit" class="btn btn-danger" onclick="return confirm('¿Estás seguro que querés eliminar este producto?');">
                Eliminar
            </button>
        </form>
      {/if}
    </td>
</tr>
{/foreach}
</tbody>
</table>


