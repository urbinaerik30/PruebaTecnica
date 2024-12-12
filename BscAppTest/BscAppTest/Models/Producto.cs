using System.ComponentModel.DataAnnotations;

namespace BscAppTest.Models
{
    public class Producto
    {
        public int ProductId { get; set; }

        public string Clave { get; set; }

        [Required(ErrorMessage = "El nombre es obligatorio.")]
        [MaxLength(15, ErrorMessage = "El nombre no puede tener más de 15 caracteres.")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "La existencia es obligatoria.")]
        [Range(1, int.MaxValue, ErrorMessage = "La existencia debe ser mayor a 0 y solo números.")]
        public int Existencia { get; set; }

        public int Option { get; set; }

        public bool Activo { get; set; }
    }
}
