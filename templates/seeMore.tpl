
<tbody>
{foreach from=$products item=product}
    <tr class="text-center fs-5">
    <td>{$product->indice_carga}</td>
    <td>{$product->indice_velocidad}</td>
    <td>{$product->precio}</td>