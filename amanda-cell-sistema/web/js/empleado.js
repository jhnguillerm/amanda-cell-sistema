$(document).ready(function() {
    $(document).on('click', '.btn-modal-eliminar', function () {
        var idEmpleado = $(this).data('id');
        var nombresEmpleado = $(this).data('nombre');
        $("#empleado-id").text(idEmpleado);
        $("#empleado-nombres").text(nombresEmpleado);

        $("#btn-eliminar").on("click", function () {
            $.ajax({
                url: "/amanda-cell-sistema/SvEmpleado",
                method: "POST",
                data: {
                    action: "delete",
                    txtIdEmpleado: idEmpleado
                },
                success: function (response) {
                    location.reload();
                },
                error: function (error) {
                    console.error("Error al eliminar empleado: " + error);
                }
            });
        });
    });
});
