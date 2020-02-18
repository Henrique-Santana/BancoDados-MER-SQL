using senai.Filmes.WebApi.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace senai.Filmes.WebApi.Interfaces
{
    /// <summary>
    /// Interface responsável pelo repositório Genero
    /// </summary>
    interface IGeneroRepository
    {
        /// <summary>
        /// Lista todos os gêneros
        /// </summary>
        /// <returns>Retorna uma lista de gêneros</returns>
        List<GeneroDomain> Listar();

        //retorno nomeMetodo(Parâmetro);
        /// <summary>
        /// Cadastra um novo genero
        /// </summary>
        /// <param name="genero">Objeto genero que sera cadastrado</param>
        void Cadastrar(GeneroDomain genero);

        /// <summary>
        /// Deletar um gênero
        /// </summary>
        /// <param name="id">ID de gênero que era deletado</param>
        void Deletar(int id);

        void AtualizarIdCorpo(GeneroDomain genero);

        /// <summary>
        /// Atualizar um Genero existente
        /// </summary>
        /// <param name="id">ID do genêro que sera atualizado</param>
        /// <param name="genero">Objeto genero que sera atualizado</param>
        void AtualizarIdUrl(int id, GeneroDomain genero);
    }
}
