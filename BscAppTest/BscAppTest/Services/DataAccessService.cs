using System.Data;
using System.Data.Common;
using System.Threading.Tasks;
using BscAppTest.Models;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;

public class DataAccessService
{
    private readonly string _connectionString;

    public DataAccessService(IConfiguration configuration)
    {
        _connectionString = configuration.GetConnectionString("DefaultConnection");
    }

    public async Task<bool> TestConnection()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                await conn.OpenAsync();
                Console.WriteLine("Conectado");
                return true;
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error al intentar conectarse a la base de datos: {ex.Message}");
            return false;
        }
    }

    public async Task<bool> ValidateUserLogin(string email, string password)
    {
        try
        {
            var factory = SqlClientFactory.Instance;
            using (DbConnection conn = factory.CreateConnection())
            {
                conn.ConnectionString = _connectionString;
                await conn.OpenAsync();

                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "ValidateUserLogin";

                    var emailParam = cmd.CreateParameter();
                    emailParam.ParameterName = "@Email";
                    emailParam.DbType = DbType.String;
                    emailParam.Value = email;
                    cmd.Parameters.Add(emailParam);

                    var passwordParam = cmd.CreateParameter();
                    passwordParam.ParameterName = "@Password";
                    passwordParam.DbType = DbType.String;
                    passwordParam.Value = password;
                    cmd.Parameters.Add(passwordParam);

                    var result = await cmd.ExecuteScalarAsync();
                    return result != null;
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error al ejecutar ValidateUserLogin: {ex.Message}");
            return false;
        }
    }

    public async Task<object> OptionAdminUser(int userId, string name, string Email, string Password, string rol, int option, int active)
    {
        try
        {
            var factory = SqlClientFactory.Instance;
            using (DbConnection conn = factory.CreateConnection())
            {
                conn.ConnectionString = _connectionString;
                await conn.OpenAsync();

                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "OptionAdminUser";

                    var userIdParam = cmd.CreateParameter();
                    userIdParam.ParameterName = "@userId";
                    userIdParam.DbType = DbType.Int32;
                    userIdParam.Value = userId;
                    cmd.Parameters.Add(userIdParam);

                    var nameParam = cmd.CreateParameter();
                    nameParam.ParameterName = "@name";
                    nameParam.DbType = DbType.String;
                    nameParam.Value = name;
                    cmd.Parameters.Add(nameParam);

                    var EmailParam = cmd.CreateParameter();
                    EmailParam.ParameterName = "@Email";
                    EmailParam.DbType = DbType.String;
                    EmailParam.Value = Email;
                    cmd.Parameters.Add(EmailParam);

                    var PasswordParam = cmd.CreateParameter();
                    PasswordParam.ParameterName = "@Password";
                    PasswordParam.DbType = DbType.String;
                    PasswordParam.Value = Password;
                    cmd.Parameters.Add(PasswordParam);

                    var rolParam = cmd.CreateParameter();
                    rolParam.ParameterName = "@rol";
                    rolParam.DbType = DbType.String;
                    rolParam.Value = rol;
                    cmd.Parameters.Add(rolParam);

                    var optionParam = cmd.CreateParameter();
                    optionParam.ParameterName = "@option";
                    optionParam.DbType = DbType.Int32;
                    optionParam.Value = option;
                    cmd.Parameters.Add(optionParam);

                    var activeParam = cmd.CreateParameter();
                    activeParam.ParameterName = "@active";
                    activeParam.DbType = DbType.Int32;
                    activeParam.Value = active;
                    cmd.Parameters.Add(activeParam);

                    if (option == 3)
                    {
                        var usuarios = new List<Usuario>();

                        using (SqlDataAdapter adapter = new SqlDataAdapter((SqlCommand)cmd))
                        {
                            DataTable dataTable = new DataTable();
                            adapter.Fill(dataTable);

                            foreach (DataRow row in dataTable.Rows)
                            {
                                var usuario = new Usuario
                                {
                                    UserId = Convert.ToInt32(row["userId"]),
                                    Name = row["Nombre"].ToString(),
                                    Email = row["Correo"].ToString(),
                                    PasswordU = row["Contraseña"].ToString(),
                                    Rol = row["Rol"].ToString(),
                                    Active = Convert.ToBoolean(row["Estatus"])
                                };
                                usuarios.Add(usuario);
                            }
                        }


                        return usuarios;

                    }
                    else
                    {
                        var result = await cmd.ExecuteScalarAsync();
                        return result != null;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error al ejecutar OptionAdminUser: {ex.Message}");
            return false;
        }
    }


    public async Task<object> OptionProducts(int option, int activo, string clave, string nombre, int existencia, int productId)
    {
        try
        {
            var factory = SqlClientFactory.Instance;
            using (DbConnection conn = factory.CreateConnection())
            {
                conn.ConnectionString = _connectionString;
                await conn.OpenAsync();

                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "OptionProducts";

                    var optionParam = cmd.CreateParameter();
                    optionParam.ParameterName = "@option";
                    optionParam.DbType = DbType.Int32;
                    optionParam.Value = option;
                    cmd.Parameters.Add(optionParam);

                    var activoParam = cmd.CreateParameter();
                    activoParam.ParameterName = "@activo";
                    activoParam.DbType = DbType.Int32;
                    activoParam.Value = activo;
                    cmd.Parameters.Add(activoParam);

                    var claveParam = cmd.CreateParameter();
                    claveParam.ParameterName = "@clave";
                    claveParam.DbType = DbType.String;
                    claveParam.Value = clave;
                    cmd.Parameters.Add(claveParam);

                    var nombreParam = cmd.CreateParameter();
                    nombreParam.ParameterName = "@nombre";
                    nombreParam.DbType = DbType.String;
                    nombreParam.Value = nombre;
                    cmd.Parameters.Add(nombreParam);

                    var existenciaParam = cmd.CreateParameter();
                    existenciaParam.ParameterName = "@existencia";
                    existenciaParam.DbType = DbType.Int32;
                    existenciaParam.Value = existencia;
                    cmd.Parameters.Add(existenciaParam);

                    var productIdParam = cmd.CreateParameter();
                    productIdParam.ParameterName = "@productId";
                    productIdParam.DbType = DbType.Int32;
                    productIdParam.Value = productId;
                    cmd.Parameters.Add(productIdParam);

                    if (option == 3)
                    {
                        var productos = new List<Producto>();

                        using (SqlDataAdapter adapter = new SqlDataAdapter((SqlCommand)cmd))
                        {
                            DataTable dataTable = new DataTable();
                            adapter.Fill(dataTable);

                            foreach (DataRow row in dataTable.Rows)
                            {
                                var producto = new Producto
                                {
                                    ProductId = Convert.ToInt32(row["ID"]),
                                    Clave = row["Clave"].ToString(),
                                    Nombre = row["Nombre"].ToString(),
                                    Existencia = Convert.ToInt32(row["Cantidad"]),
                                };
                                productos.Add(producto);
                            }
                        }

                        return productos;
                    }
                    else if (option == 0)
                    {
                        var result = await cmd.ExecuteScalarAsync();
                        return result != null;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error al ejecutar OptionProducts: {ex.Message}");
            return false;
        }
    }

    public async Task<object> OptionPedidos(int option, int idPedidoP, string clave, string nombre, int cantidad, int productId, int idcliente)
    {
        try
        {
            var factory = SqlClientFactory.Instance;
            using (DbConnection conn = factory.CreateConnection())
            {
                conn.ConnectionString = _connectionString;
                await conn.OpenAsync();

                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "OptionPedidos";

                    var optionParam = cmd.CreateParameter();
                    optionParam.ParameterName = "@option";
                    optionParam.DbType = DbType.Int32;
                    optionParam.Value = option;
                    cmd.Parameters.Add(optionParam);

                    var idPedidoPParam = cmd.CreateParameter();
                    idPedidoPParam.ParameterName = "@idPedidoP";
                    idPedidoPParam.DbType = DbType.Int32;
                    idPedidoPParam.Value = idPedidoP;
                    cmd.Parameters.Add(idPedidoPParam);

                    var claveParam = cmd.CreateParameter();
                    claveParam.ParameterName = "@clave";
                    claveParam.DbType = DbType.String;
                    claveParam.Value = clave;
                    cmd.Parameters.Add(claveParam);

                    var nombreParam = cmd.CreateParameter();
                    nombreParam.ParameterName = "@nombre";
                    nombreParam.DbType = DbType.String;
                    nombreParam.Value = nombre;
                    cmd.Parameters.Add(nombreParam);

                    var cantidadParam = cmd.CreateParameter();
                    cantidadParam.ParameterName = "@cantidad";
                    cantidadParam.DbType = DbType.Int32;
                    cantidadParam.Value = cantidad;
                    cmd.Parameters.Add(cantidadParam);

                    var productIdParam = cmd.CreateParameter();
                    productIdParam.ParameterName = "@productId";
                    productIdParam.DbType = DbType.Int32;
                    productIdParam.Value = productId;
                    cmd.Parameters.Add(productIdParam);

                    var idclienteParam = cmd.CreateParameter();
                    idclienteParam.ParameterName = "@idcliente";
                    idclienteParam.DbType = DbType.Int32;
                    idclienteParam.Value = idcliente;
                    cmd.Parameters.Add(idclienteParam);

                    if (option == 3)
                    {
                        var pedidos = new List<Pedido>();

                        using (SqlDataAdapter adapter = new SqlDataAdapter((SqlCommand)cmd))
                        {
                            DataTable dataTable = new DataTable();
                            adapter.Fill(dataTable);

                            foreach (DataRow row in dataTable.Rows)
                            {
                                var pedido = new Pedido
                                {
                                    IdPedidoP = Convert.ToInt32(row["Pedido"]),
                                    Nombre = row["Nombre"].ToString(),
                                    Cantidad = Convert.ToInt32(row["Cantidad"]),
                                    Cliente = row["Cliente"].ToString(),
                                    Fecha = row["Fecha"].ToString(),
                                    Estatus = row["Estatus"].ToString(),
                                };
                                pedidos.Add(pedido);
                            }
                        }

                        return pedidos;
                    }
                    else if (option == 0 )
                    {
                        var result = await cmd.ExecuteScalarAsync();
                        return result != null;
                    }

                    else
                    {
                        return false;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error al ejecutar OptionProducts: {ex.Message}");
            return false;
        }
    }








}
