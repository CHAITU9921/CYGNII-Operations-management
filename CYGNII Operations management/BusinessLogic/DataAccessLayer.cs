/// Created Date : 25- April- 2023*/
/// Created By : Supriya choudhary
/// Modified By :
/// Ver 1.1
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace CYGNII_Operations_management.BusinessLogic
{
    public class DataAccessLayer
    {
        #region Class Level Va SqlConnection Conn;
        SqlConnection Conn;
        SqlCommand SqlCmd;
        SqlDataAdapter DatAdptr;
        SqlDataReader DtRdr;
        DataTable dt;
        string str = "";

        #endregion
        /// <summary>
        /// open database connection
        /// </summary>
        /// <returns></returns>
        #region Openconnection Method
        public string OpenConnection()
        {
            if (Conn == null)
            {
                Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString);
            }

            if (Conn.State == ConnectionState.Closed)
            {
                Conn.Open();
            }
            SqlCmd = new SqlCommand();
            SqlCmd.CommandTimeout = 120;
            SqlCmd.Connection = Conn;
            return ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
        }
        #endregion


        #region CloseConnection and Dispose Connection Method
        public void CloseConnection()
        {
            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
            }
            DisposeConnection();
        }
        #endregion


        #region DisposeConnection Method
        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        public void DisposeConnection()
        {
            if (Conn != null)
            {
                Conn.Dispose();
                Conn = null;
            }
        }
        #endregion

        #region ExecuteSql Method

        public int ExecuteSql(string strsql)
        {
            OpenConnection();
            SqlCmd.CommandType = CommandType.Text;
            SqlCmd.CommandText = strsql;
            int intresult;
            intresult = SqlCmd.ExecuteNonQuery();
            CloseConnection();
            return intresult;
        }
        #endregion

        public string chkAlreadyExist(string command)
        {
            // chkAlreadyExist function return string as Record already exist or not if not then return OK 

            try
            {
                OpenConnection();

                SqlCmd = new SqlCommand(command, Conn);
                dt = new DataTable();
                DatAdptr = new SqlDataAdapter(SqlCmd);
                DatAdptr.Fill(dt);                            // fill datatable

                // if datatable has no row means no Recoed Avaialable retrun OK Status
                if (dt.Rows.Count <= 0)
                {
                    str = "OK";
                }
                else  // if datatable has row means Recoed Avaialable retrun Record already exist Status
                {
                    str = "Record already exist";
                }

                if (Conn.State != ConnectionState.Closed)// check connection close
                {
                    Conn.Close();
                }

                return str;

            }
            catch (Exception ex)
            {
                if (Conn.State != ConnectionState.Closed)// If error then close connection
                {
                    Conn.Close();
                }

                return ex.Message; // if error found then return error meaasge as status 
            }


        }

        #region GetDataTable Method

        public DataTable GetDataTable(string strsql)
        {
            OpenConnection();
            DatAdptr = new SqlDataAdapter(strsql, Conn);
            DataTable dtTble = new DataTable();
            DatAdptr.Fill(dtTble);
            DatAdptr.Dispose();
            CloseConnection();

            return dtTble;
        }
        #endregion


        #region GetDataSet Method

        public DataSet GetDataSet(string strsql)
        {
            OpenConnection();
            DatAdptr = new SqlDataAdapter(strsql, Conn);
            DataSet dtSet = new DataSet();
            DatAdptr.Fill(dtSet);
            DatAdptr.Dispose();
            CloseConnection(); 
            return dtSet;
        }
        #endregion

        #region GetDataSet using Stored Procedure Method

        public DataSet GetDataSetExecuteProcedure(string ProcName, SqlParameter[] SqlParams)
        {
            OpenConnection();
            SqlCmd.CommandType = CommandType.StoredProcedure;
            SqlCmd.CommandText = ProcName;
            SqlCmd.Parameters.Clear();
            foreach (SqlParameter thisParam in SqlParams)
            {
                SqlCmd.Parameters.Add((SqlParameter)thisParam);
            }
            DataSet ds = new DataSet();

            SqlDataAdapter sd = new SqlDataAdapter();
            sd.SelectCommand = SqlCmd;
            sd.Fill(ds);
            return ds;
        }
        #endregion


        #region  Execute Stored Procedure Return DataTable
        public DataTable ExecuteStoredProcedureDataTable(string ProcName, SqlParameter[] SqlParams)
        {
            OpenConnection();
            SqlCmd.CommandType = CommandType.StoredProcedure;
            SqlCmd.CommandText = ProcName;
            SqlCmd.Parameters.Clear();
            foreach (SqlParameter thisParam in SqlParams)
            {
                SqlCmd.Parameters.Add((SqlParameter)thisParam);
            }
            SqlDataAdapter sd = new SqlDataAdapter(SqlCmd);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            CloseConnection();
            return dt;
        }
        #endregion

        #region  Execute Stored Procedure Return DataTable
        internal DataTable ExecuteStoredProcedureDataTableCommonGrid(string ProcName)
        {
            OpenConnection();
            SqlCmd.CommandType = CommandType.StoredProcedure;
            SqlCmd.CommandText = ProcName;
            SqlDataAdapter sd = new SqlDataAdapter(SqlCmd.CommandText, Conn);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            CloseConnection();
            return dt;
        }
        #endregion

        #region GetDataReader Using Command Method

        public SqlDataReader GetDataReader(string strsql)
        {
            OpenConnection();
            SqlCmd.CommandType = CommandType.Text;
            SqlCmd.CommandText = strsql;
            DtRdr = SqlCmd.ExecuteReader(CommandBehavior.CloseConnection);
            return DtRdr;
        }
        #endregion

        #region IsExist Method

        public Boolean IsExist(string strsql)
        {
            OpenConnection();
            SqlCmd.CommandType = CommandType.Text;
            SqlCmd.CommandText = strsql;
            int intresult;
            intresult = (int)SqlCmd.ExecuteScalar();
            CloseConnection();
            if (intresult > 0)
            {
                return true;
            }
            else
            {
                return false;

            }
        }
        #endregion

        #region ExecuteScalar Method
        public string ExecuteScalar(string strsql)
        {
            OpenConnection();
            SqlCmd.CommandType = CommandType.Text;
            SqlCmd.CommandText = strsql;
            string strresult;
            strresult = Convert.ToString(SqlCmd.ExecuteScalar());
            CloseConnection();
            DisposeConnection();
            return strresult;
        }
        #endregion

        #region Execute Stored Procedure

        public string ExecuteStoredProcedure(string ProcName, SqlParameter[] SqlParams)
        {
            OpenConnection();
            SqlCmd.CommandType = CommandType.StoredProcedure;
            SqlCmd.CommandText = ProcName;
            SqlCmd.Parameters.Clear();
            foreach (SqlParameter thisParam in SqlParams)
            {
                SqlCmd.Parameters.Add((SqlParameter)thisParam);
            }
            // SqlCmd.ExecuteReader();
            SqlCmd.ExecuteNonQuery();
  
            // string  intresult = (int)SqlCmd.Parameters["@returnval"].Value;
            string intresult = SqlCmd.Parameters["ReturnVal"].Value.ToString();
            // @ReturnVal could be any name

          
            CloseConnection();
            //var result = returnParameter.Value;
            return intresult;
        }


        #endregion

        #region  Return int value ExecuteStoreProcedure
        #endregion

        #region Execute Stored Procedure Return Integer

        public int ExecuteStoredProcedureRetnInt(string ProcName, SqlParameter[] SqlParams)
        {
            OpenConnection();
            SqlCmd.CommandType = CommandType.StoredProcedure;
            SqlCmd.CommandText = ProcName;
            SqlCmd.Parameters.Clear();
            foreach (SqlParameter thisParam in SqlParams)
            {
                SqlCmd.Parameters.Add((SqlParameter)thisParam);
            }
            SqlCmd.Parameters["@ReturnVal"].Direction = ParameterDirection.Output;
            SqlCmd.ExecuteNonQuery();

              int returnvalue = Convert.ToInt32(SqlCmd.Parameters["@ReturnVal"].Value.ToString());
            CloseConnection();
            return returnvalue;
        }
        #endregion

        #region Execute DataReader using Stored Procedure

        public SqlDataReader ExecuteDataReaderStoredProcedure(string ProcName, SqlParameter[] SqlParams)
        {
            OpenConnection();
            SqlCmd.CommandType = CommandType.StoredProcedure;
            SqlCmd.CommandText = ProcName;
            SqlCmd.Parameters.Clear();
            foreach (SqlParameter thisParam in SqlParams)
            {
                SqlCmd.Parameters.Add((SqlParameter)thisParam);
            }
            DtRdr = SqlCmd.ExecuteReader(CommandBehavior.CloseConnection);
            return DtRdr;

        }

        #endregion

    }
}