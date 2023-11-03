$(document).ready(function () {
    $(document).on('click', '.btn-modal-eliminar-producto', function () {
        var idProducto = $(this).data('id');
        var nombreProducto = $(this).data('nombre');
        $("#producto-id").text(idProducto);
        $("#producto-nombre").text(nombreProducto);

        $("#btn-eliminar-producto").on("click", function () {
            $.ajax({
                url: "/amanda-cell-sistema/SvProducto",
                method: "POST",
                data: {
                    action: "delete",
                    txtIdProducto: idProducto
                },
                success: function (response) {
                    location.reload();
                },
                error: function (error) {
                    console.error("Error al eliminar producto: " + error);
                }
            });
        });
    });
});