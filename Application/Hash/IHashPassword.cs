using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Hash
{
    public interface IHashPassword
    {
        string ComputeSha256Hash(string password);
    }
}
