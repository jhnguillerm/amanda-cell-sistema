$(document).ready(function() {
    $(document).on('click', '.btn-modal-eliminar-proveedor', function () {
        var idProveedor = $(this).data('id');
        var nombreProveedor = $(this).data('nombre');
        $("#proveedor-id").text(idProveedor);
        $("#proveedor-nombre").text(nombreProveedor);

        $("#btn-eliminar-proveedor").on("click", function () {
            $.ajax({
                url: "/amanda-cell-sistema/SvProveedor",
                method: "POST",
                data: {
                    action: "delete",
                    txtIdProveedor: idProveedor
                },
                success: function (response) {
                    location.reload();
                },
                error: function (error) {
                    console.error("Error al eliminar proveedor: " + error);
                }
            });
        });
    });
});