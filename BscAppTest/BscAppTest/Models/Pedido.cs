using System.ComponentModel.DataAnnotations;

namespace BscAppTest.Models
{
    public class Pedido
    {
        public int Option { get; set; }
        public int IdPedidoP { get; set; }
        public string Clave { get; set; }

        [Required(ErrorMessage = "El nombre es obligatorio.")]
        [MaxLength(15, ErrorMessage = "El nombre no puede tener más de 15 caracteres.")]
        public string Nombre { get; set; }
        public string Cliente { get; set; }
        public string Fecha { get; set; }

        public string Estatus { get; set; }

        [Required(ErrorMessage = "La cantidad es obligatoria.")]
        [Range(1, int.MaxValue, ErrorMessage = "La cantidad debe ser mayor a 0 y solo números.")]
        public int Cantidad { get; set; }

        public int Existencia { get; set; }
        public int ProductId { get; set; }

        public int IdCliente { get; set; }

    }
}
