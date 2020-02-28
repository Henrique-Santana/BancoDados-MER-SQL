using senai.Peoples.WebApi.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace senai.Peoples.WebApi.Interfaces
{
    interface ITipoUsuarioRepository
    {
        /// <summary>
        /// Lista todos os funcionários
        /// </summary>
        /// <returns>Retorna uma lista de funcionários</returns>
        List<FuncionarioDomain> Listar();

        /// <summary>
        /// Busca um funcionário através do ID
        /// </summary>
        /// <param name="id">ID do funcionário que será buscado</param>
        /// <returns>Retorna um funcionário buscado</returns>
        FuncionarioDomain BuscarPorId(int id);

        /// <summary>
        /// Atualiza um funcionário existente
        /// </summary>
        /// <param name="id">ID do funcionário que será atualizado</param>
        /// <param name="funcionarioAtualizado">Objeto funcionarioAtualizado que será atualizado</param>
        void Atualizar(int id, FuncionarioDomain funcionarioAtualizado);

        /// <summary>
        /// Deleta um funcionário existente
        /// </summary>
        /// <param name="id">ID do funcionário que será deletado</param>
        void Deletar(int id);

    }
}