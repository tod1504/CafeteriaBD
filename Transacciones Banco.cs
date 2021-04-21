
/*Transaccion para la ventana de retiro
Se pone dentro del boton
*/
int monto;
string Fecha = System.DateTime.Now.ToString("yyy/MM/dd");
monto = Convert.ToInt32(txt_retiro.Text);

using (MySqlConnection conn = new MySqlConnection(cadenaConex))
{
    conn.Open();
    MySqlCommand command = conn.CreateCommand();
    MySqlTransaction transaction;

    String saldoactual = "SELECT SaldoActual FROM clientes WHERE NumeroDeCuenta ='" + txb_cuenta.Text + "'";

    transaction = conn.BeginTransaction();

    command.Connection = conn;
    command.Transaction = transaction;
    try
    {

        //String cadenaSQL ;
        //String query = ;
        //"Update clientes SET SaldoActual= SaldoActual-'" + monto + "'";


        command.CommandText =  "INSERT INTO Movimientos (FechaMov, TipoMov, Cantidad, NumeroDeCuenta) VALUES ('" + Fecha + "','" + "Retiro" + "','" + monto + "','" + txb_cuenta.Text + "')";
        command.ExecuteNonQuery();

        command.CommandText = "Update clientes SET SaldoActual= SaldoActual-'" + monto + "'  WHERE NumeroDeCuenta ='" + txb_cuenta.Text + "'";
        command.ExecuteNonQuery();

        transaction.Commit();

        MessageBox.Show("Retiro Realizado con Éxito.");
        txt_retiro.Clear();

    }
    catch(Exception ex)
    {
        MessageBox.Show("Error en el deposito.");
        txt_retiro.Clear();
        try
        {
            transaction.Rollback();
        }catch(MySqlException ex2)
        {
            MessageBox.Show("Error en el deposito.");
            txt_retiro.Clear();
        }
    }
    conn.Close();
}


/*Transaccion para la ventana de deposito
se pone dentro del boton
*/
int monto;
monto = Convert.ToInt32(txt_deposito.Text);

string Fecha = System.DateTime.Now.ToString("yyy/MM/dd");

using (MySqlConnection conn = new MySqlConnection(cadenaConex))
{
    conn.Open();
    MySqlCommand command = conn.CreateCommand();
    MySqlTransaction transaction;

    String saldoactual = "SELECT SaldoActual FROM clientes WHERE NumeroDeCuenta ='" + txb_cuenta.Text + "'";

    transaction = conn.BeginTransaction();

    command.Connection = conn;
    command.Transaction = transaction;
    try
    {

        //String cadenaSQL ;
        //String query = ;
        //"Update clientes SET SaldoActual= SaldoActual-'" + monto + "'";


        command.CommandText = "INSERT INTO Movimientos (FechaMov,TipoMov, Cantidad, NumeroDeCuenta) VALUES ('" + Fecha + "','" + "Deposito" + "','" + monto + "','" + txb_cuenta.Text + "')";
        command.ExecuteNonQuery();

        command.CommandText = "Update clientes SET SaldoActual= SaldoActual+'" + monto + "'";
        command.ExecuteNonQuery();

        transaction.Commit();

        MessageBox.Show("Retiro Realizado con Éxito.");
        txt_deposito.Clear();

    }
    catch (Exception ex)
    {
        MessageBox.Show("Error en el deposito.");
        txt_deposito.Clear();
        try
        {
            transaction.Rollback();
        }
        catch (MySqlException ex2)
        {
            MessageBox.Show("Error en el deposito.");
            txt_deposito.Clear();
        }
    }
    conn.Close();
}
