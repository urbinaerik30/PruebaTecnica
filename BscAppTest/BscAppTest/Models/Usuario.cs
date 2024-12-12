using System.ComponentModel.DataAnnotations;

namespace BscAppTest.Models
{
    public class Usuario
    {
        public int UserId { get; set; }

        [Required(ErrorMessage = "El nombre es obligatorio.")]
        public string Name { get; set; }

        [Required(ErrorMessage = "El email es obligatorio.")]
        public string Email { get; set; }

        [Required(ErrorMessage = "La contraseña es obligatoria.")]
        [RegularExpression(@"^[a-zA-Z]{8}$", ErrorMessage = "La contraseña debe tener exactamente 8 caracteres y contener solo letras.")]
        public string PasswordU { get; set; }
        public string Rol { get; set; }
        public int Option { get; set; }
        public bool Active { get; set; }
    }
}
