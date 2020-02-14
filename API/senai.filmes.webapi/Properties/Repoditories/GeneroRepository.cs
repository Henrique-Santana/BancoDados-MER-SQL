using senai.filmes.webapi.Properties.Domains;
using senai.filmes.webapi.Properties.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace senai.filmes.webapi.Properties.Repoditories
{
    public class GeneroRepository : IGeneroRepository
    {
        private string StringConexao = "Data Source= DEV17\\SQLEXPRESS; initial catalog=Filmes; user Id=sa; pwd=Sa132"; //integreate security 

        public List<GeneroDomain> Listar()
        {
            List<GeneroDomain> generos = new List<GeneroDomain>();

            using (SqlConnection con = new SqlConnection(StringConexao)) //con.Open(); serve para se conectar com o banco, então o using serve para que quando finalizar o metodo o using acaba e encerra a conexão com o bnco, caso o acontrario o banco iria ficar aberto.
            {
                string query = "SELECT IdGenero, Nome FROM Genero";

                con.Open();

                SqlDataReader rdr;

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    rdr = cmd.ExecuteReader();

                    while (rdr.Read())
                    {
                        GeneroDomain genero = new GeneroDomain
                        {
                            IdGenero = Convert.ToInt32(rdr[0]),
                            Nome = rdr["Nome"].ToString()
                        };

                        generos.Add(genero);
                    }
                } 

            }
            return generos;
        }
    }
}
