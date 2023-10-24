function loadForm(row) {
    var id_producto = $(row).find(".td_id_producto").text();
    var nombre = $(row).find(".td_nombre").text();
    var descripcion = $(row).find(".td_descripcion").text();
    var precio_compra = $(row).find(".td_precio_compra").text();
    var precio_venta = $(row).find(".td_precio_venta").text();
    var stock = $(row).find(".td_stock").text();
    var tipo = $(row).find(".td_tipo").text();
    var proveedor = $(row).find(".td_proveedor").text();

    $("#txtIdProducto").val(id_producto);
    $("#txtIdProducto-hidden").val(id_producto);
    $("#txtNombre").val(nombre);
    $("#areaDescripcion").val(descripcion);
    $("#txtPrecioCompra").val(precio_compra);
    $("#txtPrecioVenta").val(precio_venta);
    $("#txtStock").val(stock);
    $("#txtTipo").val(tipo);
    $("#cbProveedor option:contains(" + proveedor + ")").attr('selected', true);
}

$(document).ready(function () {

    $("#modal-producto").on("hidden.bs.modal", function () {
        $('form')[0].reset();
        $("#cbProveedor option[selected]").removeAttr('selected');
    });

    $(document).on('click', '.btn-editar-producto', function () {
        $("#div-id_producto").show();
        $("#btn-agregar-producto").hide();
        $("#btn-actualizar-producto").show();
        loadForm($(this).closest('tr'));
    });

    $(document).on('click', '.btn-modal-eliminar-producto', function () {
        var idProducto = $(this).data('id');
        var nombreProducto = $(this).data('nombre');
        $("#producto-id").text(idProducto);
        $("#producto-nombre").text(nombreProducto);

        // Agregar lógica para eliminar producto
        $("#btn-eliminar-producto").on("click", function () {
            $.ajax({
                url: "/amanda-cell-sistema/SvProducto", // La URL de tu servlet
                method: "POST",
                data: {
                    action: "delete",
                    txtIdProducto: idProducto
                },
                success: function (response) {
                    // Manejar la respuesta del servidor, por ejemplo, recargar la página
                    location.reload(); // Recargar la página después de eliminar el producto
                },
                error: function (error) {
                    // Manejar errores si la solicitud falla
                    console.error("Error al eliminar producto: " + error);
                }
            });
        });
    });

    $("#abrir-modal-producto").click(function () {
        $("#div-id_producto").hide();
        $("#btn-agregar-producto").show();
        $("#btn-actualizar-producto").hide();
    });

});